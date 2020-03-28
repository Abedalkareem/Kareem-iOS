//
//  FetcherType.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 11/12/2019.
//  Copyright © 2019 abedalkareem. All rights reserved.
//

import Foundation
import RxSwift

protocol FetcherType {

  func fetch<T: Decodable>(endpoint: EndPoint) -> Observable<T>
  func fetch(endpoint: EndPoint) -> Observable<Void>
  func fetchArray<T: Decodable>(endpoint: EndPoint) -> Observable<[T]>
}
