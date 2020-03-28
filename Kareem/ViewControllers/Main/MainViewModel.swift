//
//  MainViewModel.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 10/01/2020.
//  Copyright © 2020 abedalkareem. All rights reserved.
//

import CoreLocation
import RxCocoa
import RxSwift

class MainViewModel: ViewModelType {

  // MARK: - Properties

  var disposeBag = DisposeBag()

  var mapDidChange: AnyObserver<CLLocationCoordinate2D?>!
  var centerOfMap: Observable<CLLocationCoordinate2D?>!

  var currentUserLocation: BehaviorSubject<CLLocationCoordinate2D?>!

  var status = BehaviorSubject<BookingStatus>(value: .selectPickup)
  var moveStep = PublishSubject<Step>()

  var error: Observable<Error>!
  var errorTrigger: AnyObserver<Error>!

  var addressWithStatus = BehaviorSubject<(Address, BookingStatus)?>(value: nil)

  var cars = BehaviorSubject<[CarViewModel]>(value: [])

  // MARK: - Private properties

  private var locationProvider: LocationProvider
  private var carServices: CarServices

  // MARK: - init

  init(locationProvider: LocationProvider, carServices: CarServices) {
    self.locationProvider = locationProvider
    self.carServices = carServices
    locationProvider.startUpdating()

    setupMapDidChangeAndCenterOfMap()

    observeForUserLocation()
    observeForStepMoving()
    bindCenterOfTheMapToAddress()

    getCars()
  }

  private func setupMapDidChangeAndCenterOfMap() {
    let _mapDidChange = BehaviorSubject<CLLocationCoordinate2D?>(value: nil)
    mapDidChange = _mapDidChange.asObserver()
    centerOfMap = _mapDidChange.asObservable()
      .withLatestFrom(status, resultSelector: { ($0, $1) })
      .filter({ _, status in status != .book })
      .map({ location, _ in location})
  }

  private func getCars() {
    carServices.getCarsWith(lat: 1.0, long: 1.0)
      .map({ $0.map(CarViewModel.init) })
      .bind(to: cars)
      .disposed(by: disposeBag)
  }

  // MARK: - Observers
  
  private func observeForUserLocation() {
    currentUserLocation = BehaviorSubject(value: nil)
    locationProvider.currentUserLocation
      .filter({ $0 != nil })
      .map({ $0!.coordinate })
      .bind(to: currentUserLocation)
      .disposed(by: disposeBag)
  }

  private func observeForStepMoving() {
    moveStep
      .withLatestFrom(status, resultSelector: { ($0, $1) })
      .subscribe(onNext: { [unowned self] step, status in
        self.handleMovingWith(status, and: step)
      })
      .disposed(by: disposeBag)
  }

  private func bindCenterOfTheMapToAddress() {
    Observable.combineLatest(centerOfMap, status)
      .map({ location, _ in location })
      .debounce(DispatchTimeInterval.milliseconds(Constants.ints.delayToCallGEOCoder),
                scheduler: MainScheduler.instance)
      .flatMap({ [weak self] location -> Observable<Address> in
        guard let location = location,
          let address = self?.locationProvider.getAddressFrom(coordinate: location) else {
            return Observable.empty()
        }
        return address
      })
      .withLatestFrom(status, resultSelector: { ($0, $1) })
      .bind(to: addressWithStatus)
      .disposed(by: disposeBag)
  }

  // MARK: -

  private func handleMovingWith(_ status: BookingStatus, and step: Step) {

    let allCases = BookingStatus.allCases
    guard let index = allCases.firstIndex(of: status) else {
      return
    }

    let newIndex = step == .next ? (index + 1) : (index - 1)
    guard allCases.indices.contains(newIndex) else {
      return
    }

    let newStatus = allCases[newIndex]
    self.status.on(.next(newStatus))
  }

  // MARK: -

  func next() {
    moveStep.on(.next(.next))
  }

  func previous() {
    moveStep.on(.next(.previous))
  }

}

enum BookingStatus: CaseIterable {
  case selectPickup
  case selectDropOff
  case book
}

enum Step {
  case next
  case previous
}
