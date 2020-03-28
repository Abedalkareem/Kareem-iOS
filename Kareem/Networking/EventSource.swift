//
//  EventSource.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 11/12/2019.
//  Copyright © 2019 abedalkareem. All rights reserved.
//

import Foundation

class EventSource: NSObject, NetworkingType {

  typealias Completion = (Error?, Data?) -> Void

  private var operationQueue: OperationQueue?
  private var urlSession: URLSession?
  private let headers = ["Accept": "text/event-stream"]

  private var completion: Completion?

  override init() {
    super.init()
    operationQueue = OperationQueue()

    let configuration = URLSessionConfiguration.default
    configuration.httpAdditionalHeaders = headers
    urlSession = URLSession(configuration: configuration,
                            delegate: self,
                            delegateQueue: operationQueue)

  }


  ///
  /// Make a request and return a result or failure.
  /// - Parameter request: A url request to execute.
  /// - Parameter completion: A cluser will get call after the request finish.
  /// It will return `Error` in case of failure, and `Data` in case of success.
  ///
  func request(_ request: URLRequest?, completion: @escaping Completion) {
    guard let request = request else { return }
    self.completion = completion
    urlSession?.dataTask(with: request)
      .resume()
  }

  deinit {
    urlSession?.finishTasksAndInvalidate()
  }
}

extension EventSource: URLSessionDataDelegate {
  func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
    let string = String(data: data, encoding: .utf8) ?? ""
    print("========\n \(string) ========\n")
    guard let range = string.range(of: "(?<=data:)(.*)(?=\n\n)",
                                   options: .regularExpression),
      let data = string[range].replacingOccurrences(of: "\\\"", with: "\"").data(using: .utf8) else {
        return
    }


    completion?(nil, data)
  }

  func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
    completionHandler(URLSession.ResponseDisposition.allow)
  }

  func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
    completion?(error, nil)
  }
}
