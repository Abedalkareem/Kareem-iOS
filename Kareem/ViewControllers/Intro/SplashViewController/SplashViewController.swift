//
//  SplashViewController.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 10/12/2019.
//  Copyright © 2019 abedalkareem. All rights reserved.
//

import RxSwift
import UIKit

class SplashViewController: BaseViewModelController<SplashViewModel> {

  // MARK: - Properties

  // MARK: - Private properties

  // MARK: - ViewController lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    observeForAppStatus()
  }

  // MARK: - Observers

  private func observeForAppStatus() {
    viewModel.status
      .subscribe(onNext: { [weak self] appStatus in
        self?.check(appStatus)
      })
      .disposed(by: disposeBag)
  }

  // MARK: -

  private func check(_ appStatus: AppStatus) {
    switch appStatus {
    case .newUpdate:
      showAppStatusViewController()
    case .none:
      showIntroViewController()
    }
  }

  // MARK: - Show view

  private func showAppStatusViewController() {
    let viewController = AppStatusViewController.instance()
    setRootViewController(viewController: viewController, animated: true)
  }

  private func showIntroViewController() {
    let viewController = IntroViewController.instance()
    setRootViewController(viewController: viewController, animated: true)
  }

  // MARK: - Instance

  class func instance() -> SplashViewController {
    let viewController = UIStoryboard.create(storyboard: .intro,
                                             controller: SplashViewController.self)
    return viewController
  }
}

