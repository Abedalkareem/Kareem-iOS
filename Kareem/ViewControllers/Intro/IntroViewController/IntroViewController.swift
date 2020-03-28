//
//  IntroViewController.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 10/12/2019.
//  Copyright © 2019 abedalkareem. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {

  @Injected var locationHelper: LocationProvider

  override func viewDidLoad() {
    super.viewDidLoad()

    locationHelper.requestAuthorization()
  }

  @IBAction func `continue`(_ sender: Any) {
    let viewController = MainViewController.instance()
    setRootViewController(viewController: viewController, animated: true)
  }

  // MARK: - Instance

  class func instance() -> IntroViewController {
    let viewController = UIStoryboard.create(storyboard: .intro,
                                             controller: IntroViewController.self)
    return viewController
  }
}
