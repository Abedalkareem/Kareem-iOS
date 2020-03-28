//
//  File.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 11/12/2019.
//  Copyright © 2019 abedalkareem. All rights reserved.
//

import Foundation
import RxSwift

class Fetcher: FetcherType {

  private var networking: NetworkingType

  init(networking: NetworkingType) {
    self.networking = networking
  }

  ///
  /// Call `EndPoint` and return a `Observable<T>` as response.
  /// Use this in case the server don't return a value (returns empty body).
  /// - Parameter endpoint: End point to call.
  ///
  func fetch(endpoint: EndPoint) -> Observable<Void> {
    return Observable.create { observer -> Disposable in
      self.networking.request(endpoint.request) { error, data in

        if let error = error {
          observer.on(.error(error))
          return
        }

        guard data != nil else { observer.on(.error(Constants.errors.nilData)); return }

        observer.on(.next(()))
      }
      return Disposables.create()
    }
  }

  ///
  /// Call `EndPoint` and return a `Observable<T>` as response.
  /// Use this in case the server will return a one json object.
  /// - Parameter endpoint: End point to call.
  ///
  func fetch<T: Decodable>(endpoint: EndPoint) -> Observable<T> {
    return Observable.create { observer -> Disposable in
      self.networking.request(endpoint.request) { error, data in

        if let error = error {
          observer.on(.error(error))
          return
        }

        guard let data = data else { observer.on(.error(Constants.errors.nilData)); return }

        let decoder = JSONDecoder()

        do {
          let item = try decoder.decode(T.self, from: data)
          observer.on(.next(item))
        } catch {
          observer.on(.error(error))
        }
      }
      return Disposables.create()
    }
  }

  ///
  /// Call `EndPoint` and return a `Observable<[T]>` as response.
  /// Use this in case the server will return a json array.
  /// - Parameter endpoint: End point to call.
  ///
  func fetchArray<T: Decodable>(endpoint: EndPoint) -> Observable<[T]> {
    return Observable.create { observer -> Disposable in
      self.networking.request(endpoint.request) { error, data in

        if let error = error {
          observer.on(.error(error))
          return
        }

        guard let data = data else { observer.on(.error(Constants.errors.nilData)); return }
        let decoder = JSONDecoder()
        do {
          let items = try decoder.decode([T].self, from: data)
          observer.on(.next(items))

        } catch {
          observer.on(.error(error))
        }
      }
      return Disposables.create()
    }
  }

}
