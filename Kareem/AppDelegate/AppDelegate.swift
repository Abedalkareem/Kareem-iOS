//
//  AppDelegate.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 10/12/2019.
//  Copyright © 2019 abedalkareem. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  ///
  /// The services 
  ///
  lazy var services: [ApplicationDelegate] = {
    [SocialMediaService(), ApplicationService()]
  }()

  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    return services
      .map { ($0.application?(application, didFinishLaunchingWithOptions: launchOptions) ?? true) }
      .first { !$0 } ?? true
  }

  func application(_ app: UIApplication,
                   open url: URL,
                   options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {

    return services
      .map { $0.application?(app, open: url, options: options) ?? false }
      .first { $0 } ?? false
  }

}

