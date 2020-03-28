//
//  LocationHelper.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 21/12/2019.
//  Copyright © 2019 abedalkareem. All rights reserved.
//

import CoreLocation
import GoogleMaps
import GooglePlaces
import RxCoreLocation
import RxSwift

class LocationHelper: LocationProvider {

  private let manager: CLLocationManager
  private let disposeBag: DisposeBag
  private let gmsGeocoder: GMSGeocoder

  var currentUserLocation: Observable<CLLocation?> {
    manager.rx.location
  }

  init() {
    manager = CLLocationManager()
    gmsGeocoder = GMSGeocoder()
    disposeBag = DisposeBag()
  }

  func requestAuthorization() {
    manager.requestAlwaysAuthorization()
    manager.rx
      .didChangeAuthorization
      .subscribe(onNext: { [weak self] _, status in
        switch status {
        case .denied:
          print("Authorization denied")
        case .notDetermined:
          print("Authorization: not determined")
        case .restricted:
          print("Authorization: restricted")
        case .authorizedAlways, .authorizedWhenInUse:
          self?.startUpdating()
        @unknown default:
          break
        }
      })
      .disposed(by: disposeBag)

  }

  func startUpdating() {
    manager.startUpdatingLocation()
  }

  func getAddressFrom(coordinate: CLLocationCoordinate2D) -> Observable<Address> {
    return Observable.create { [weak self] observer -> Disposable in
      self?.gmsGeocoder.reverseGeocodeCoordinate(coordinate) { (response, error) in
        guard error == nil else {
          observer.on(.error(error!))
          return
        }
        let address = response?.firstResult()
        observer.on(.next(Address(subLocality: address?.subLocality,
                                  thoroughfare: address?.thoroughfare,
                                  locality: address?.locality,
                                  country: address?.country,
                                  postalCode: address?.postalCode,
                                  lines: address?.lines?.joined(separator: ","))))
      }
      return Disposables.create()
    }
  }
}
