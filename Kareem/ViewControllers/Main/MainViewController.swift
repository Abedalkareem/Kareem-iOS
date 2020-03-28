//
//  MainViewController.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 21/12/2019.
//  Copyright © 2019 abedalkareem. All rights reserved.
//

import UIKit
import GoogleMaps
import RxSwift
import RxCocoa
import RxGoogleMaps

class MainViewController: BaseViewModelController<MainViewModel> {

  // MARK: - IBOutlets

  @IBOutlet private weak var mapView: GMSMapView!
  @IBOutlet private weak var dpLocationView: DPLocationView!
  @IBOutlet private weak var actionButton: AppButton!

  // MARK: - Private properties

  private var currentMarker: GMSMarker!
  private var pickUpMarker: GMSMarker!
  private var dropOffMarker: GMSMarker!

  // MARK: - ViewController lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    setup()

    setupPickUpMarker()
    setupDropOffMarker()

    observeForBookingStatus()
    observeForUserLocation()

    bindDidChangeToMapDidChange()
    observeForAddressWithStatus()
    observeForCenterOfTheMap()
    observeForCars()
  }

  private func setup() {
    mapView.isMyLocationEnabled = true
  }

  private func setupPickUpMarker() {
    pickUpMarker = GMSMarker()
    pickUpMarker.map = mapView
    let view = PickUpView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    pickUpMarker.tracksViewChanges = false
    pickUpMarker.iconView = view
  }

  private func setupDropOffMarker() {
    dropOffMarker = GMSMarker()
    let view = PickUpView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), isWithTime: false)
    dropOffMarker.tracksViewChanges = false
    dropOffMarker.iconView = view
  }

  // MARK: - Observers

  private func observeForUserLocation() {
    Observable.combineLatest(rx.viewDidAppear,
                             UIApplication.shared.rx.applicationDidBecomeActive.startWith(()))
      .flatMap({ [weak self] _ -> Observable<CLLocationCoordinate2D?> in
        guard let self = self else { return Observable.empty() }
        return self.viewModel.currentUserLocation.take(1)
      })
      .subscribe(onNext: { [weak self] location in
        guard let location = location else { return }
        self?.mapView.camera = GMSCameraPosition.camera(withLatitude: location.latitude,
                                                        longitude: location.longitude,
                                                        zoom: MapZoomLevels.buildings)
      })
      .disposed(by: disposeBag)
  }

  private func observeForBookingStatus() {
    viewModel.status
      .subscribe(onNext: { [unowned self] status in
        var buttonTitle = ""
        switch status {
        case .selectDropOff:
          self.dropOffMarker.map = self.mapView
          self.currentMarker = self.dropOffMarker
          buttonTitle = "main_screen_confirm_button".localize
        case .selectPickup:
          self.currentMarker = self.pickUpMarker
          buttonTitle = "main_screen_add_dropoff_button".localize
        case .book:
          self.bookTheCar()
          buttonTitle = "main_screen_book_button".localize
        }
        self.actionButton.setTitle(buttonTitle, for: .normal)
      })
      .disposed(by: disposeBag)
  }

  private func bindDidChangeToMapDidChange() {
    mapView.rx.didChange
      .map({ $0.target })
      .bind(to: viewModel.mapDidChange)
      .disposed(by: disposeBag)
  }

  private func observeForAddressWithStatus() {
    viewModel.addressWithStatus
      .subscribe(onNext: { [weak self] addressAndStatus in
        let (location, status) = addressAndStatus ?? (nil, nil)
        if status == .selectPickup {
          self?.dpLocationView.pickUpLocation = location
        } else {
          self?.dpLocationView.dropOffLocation = location
        }
      })
      .disposed(by: disposeBag)
  }

  private func observeForCenterOfTheMap() {
    viewModel.centerOfMap
      .do(onNext: { [weak self] location in
        self?.currentMarker.tracksViewChanges = true
        self?.currentMarker.position = location ?? CLLocationCoordinate2D()
      })
      .map({ [weak self] _ in self?.currentMarker.iconView as? PickUpView })
      .do(onNext: { $0?.isMoving = true })
      .debounce(.milliseconds(Constants.ints.delayToShowMarker),
                scheduler: MainScheduler.instance)
      .do(onNext: { $0?.isMoving = false })
      .delay(.milliseconds(500), scheduler: MainScheduler.instance)
      .subscribe(onNext: { [weak self] _ in self?.currentMarker.tracksViewChanges = false })
      .disposed(by: disposeBag)
  }

  private func observeForCars() {
    viewModel.cars
      .map({ cars -> Set<CarMarker> in
        let items = cars.map({ car -> CarMarker in
          let carMarker = CarMarker()
          carMarker.tracksViewChanges = false
          carMarker.icon = #imageLiteral(resourceName: "car")
          carMarker.appearAnimation = .pop
          carMarker.position = car.location
          carMarker.id = car.id
          return carMarker
        })
        return Set(items)
      })
      .subscribe(onNext: { cars in
        cars.forEach {
          $0.map = self.mapView
        }
      })
      .disposed(by: disposeBag)
  }

  private func bookTheCar() {
    
  }

  // MARK: - IBActions

  @IBAction func confirm(_ sender: Any) {
    viewModel.next()
  }

  // MARK: - Instance

  class func instance() -> MainViewController {
    let viewController = UIStoryboard.create(storyboard: .main,
                                             controller: MainViewController.self)
    return viewController
  }
}
