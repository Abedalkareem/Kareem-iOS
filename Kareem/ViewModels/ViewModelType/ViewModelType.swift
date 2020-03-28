//
//  ViewModelType.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 11/12/2019.
//  Copyright © 2019 abedalkareem. All rights reserved.
//

import RxSwift

protocol ViewModelType {
  associatedtype StatusObserverType
  var status: StatusObserverType { get set }
  var disposeBag: DisposeBag { get }
}
