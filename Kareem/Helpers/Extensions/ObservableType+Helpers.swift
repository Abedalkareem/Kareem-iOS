//
//  ObservableType+Helpers.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 11/12/2019.
//  Copyright © 2019 abedalkareem. All rights reserved.
//

import RxSwift

extension ObservableType {
  func emitErrorTo<O: ObserverType>(_ subject: O?) -> Observable<Element> where O.Element == Error {
    return asObservable().do(onError: { error in
      subject?.on(.next(error))
    })
  }
  
  func emitTo<T, O: ObserverType>(_ subject: O?,
                                  value: T) -> Observable<Element> where O.Element == T {
    return asObservable().do(onNext: { _ in
      subject?.on(.next(value))
    })
  }
  
  func catchError<T, O: ObserverType>(_ subject: O?,
                                      value: T?) -> Observable<Element> where O.Element == T {
    return catchError { _ in
      if let value = value {
        subject?.on(.next(value))
      }
      return Observable.empty()
    }
  }
  
  func catchError() -> Observable<Element> {
    return catchError { _ in Observable.empty() }
  }
}
