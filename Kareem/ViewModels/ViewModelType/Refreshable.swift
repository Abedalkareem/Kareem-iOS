//
//  Refreshable.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 11/12/2019.
//  Copyright © 2019 abedalkareem. All rights reserved.
//

import RxSwift

protocol Refreshable {
  var refresh: Observable<()>! { get set }
  var refreshTrigger: AnyObserver<()>! { get set }
  var disposeBag: DisposeBag { get }
}
