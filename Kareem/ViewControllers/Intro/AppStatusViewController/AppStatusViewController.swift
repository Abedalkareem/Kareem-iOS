//
//  AppStatusViewController.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 12/12/2019.
//  Copyright © 2019 abedalkareem. All rights reserved.
//

import UIKit

class AppStatusViewController: UIViewController {

  // MARK: - ViewController lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

  }

  // MARK: - IBActions

  @IBAction func update(_ sender: Any) {
    if let url = URL(string: Constants.urls.git) {
      UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
  }

  // MARK: - Instance

  class func instance() -> AppStatusViewController {
    let viewController = UIStoryboard.create(storyboard: .intro,
                                             controller: AppStatusViewController.self)
    return viewController
  }
}
