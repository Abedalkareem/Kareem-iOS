//
//  Loadable.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 11/12/2019.
//  Copyright © 2019 abedalkareem. All rights reserved.
//

import RxSwift

protocol Loadable {
  var loading: Observable<Loading>! { get set }
  var loadingTrigger: AnyObserver<Loading>! { get set }
  var disposeBag: DisposeBag { get }
}

struct Loading {
  var isLoading: Bool
  var type: LoadingType
  
  init(_ isLoading: Bool, type: LoadingType) {
    self.isLoading = isLoading
    self.type = type
  }
}

enum LoadingType {
  case fullScreen, button
}
