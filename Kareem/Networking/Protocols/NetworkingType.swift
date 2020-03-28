//
//  NetworkingType.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 10/12/2019.
//  Copyright © 2019 abedalkareem. All rights reserved.
//

import Foundation

protocol NetworkingType {
  func request(_ request: URLRequest?, completion: @escaping (Error?, Data?) -> Void)
}
