//
//  SocialMediaService.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 04/12/2019.
//  Copyright © 2019 abedalkareem. All rights reserved.
//

import UIKit

///
/// This class to handle any social media things need to be done in
/// the `AppDelegate`. Like, initializing the facebook sdk. handle the url
/// call backs.
///
class SocialMediaService: NSObject, ApplicationDelegate {

  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
    return true
  }

  func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
    return false
  }
}
