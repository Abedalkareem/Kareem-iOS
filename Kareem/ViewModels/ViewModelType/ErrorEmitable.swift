//
//  ErrorEmitable.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 11/12/2019.
//  Copyright © 2019 abedalkareem. All rights reserved.
//

import RxSwift

protocol ErrorEmitable {
  var error: Observable<Error>! { get set }
  var errorTrigger: AnyObserver<Error>! { get set }
  var disposeBag: DisposeBag { get }
}
