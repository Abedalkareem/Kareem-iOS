//
//  EndPoint.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 10/12/2019.
//  Copyright © 2019 abedalkareem. All rights reserved.
//

import Foundation

typealias Parameters = [String: Any]
typealias Headers = [String: String]

protocol EndPoint {

  var method: HTTPMethod { get }

  var path: String { get }

  var parameters: Parameters { get }

  var headers: Headers { get }

  var request: URLRequest? { get }
}

extension EndPoint {

  var headers: Headers {
    return [:]
  }

  var request: URLRequest? {
    var urlComponents = URLComponents()
    urlComponents.scheme = Constants.urls.scheme
    urlComponents.host = Constants.urls.host
    urlComponents.path = path
    if method == .get {
      urlComponents.queryItems = parameters
        .map({ URLQueryItem(name: $0.key, value: "\($0.value)") })
    }

    guard let url = urlComponents.url else {
      return nil
    }

    var urlRequest = URLRequest(url: url)

    urlRequest.httpMethod = method.rawValue
    urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")

    if method != .get {
      urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
    }

    for header in headers {
      urlRequest.setValue(header.value, forHTTPHeaderField: header.key)
    }

    return urlRequest
  }
}
