//
//  ApplicationService.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 04/12/2019.
//  Copyright © 2019 abedalkareem. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

///
/// This class to handle any application things need to be done in
/// the `AppDelegate` and you did not find a category to group it with
/// as the `SocialMediaServices` category.
///
class ApplicationService: NSObject, ApplicationDelegate {

  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {

    GMSServices.provideAPIKey(Obfuscator.deObfuscate(Keys.gmsServices))
    GMSPlacesClient.provideAPIKey(Obfuscator.deObfuscate(Keys.gmsServices))

    LocalizationHelper.defaultLanguage = .deviceLanguage

    return true
  }

  func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
    return false
  }
}

