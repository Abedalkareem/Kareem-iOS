//
//  LocalizationHelper.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 16/12/2019.
//  Copyright © 2019 abedalkareem. All rights reserved.
//

import Foundation
import LanguageManager_iOS

enum LocalizationHelper {

  ///
  /// To get the diriction of the language.
  ///
  static var isRightToLeft: Bool {
    #if TARGET_INTERFACE_BUILDER
    return true
    #else
    return LanguageManager.shared.isRightToLeft
    #endif
  }

  ///
  /// The app locale to use it in dates and currency.
  ///
  static var locale: Locale {
    #if TARGET_INTERFACE_BUILDER
    return Locale(identifier: "en")
    #else
    return LanguageManager.shared.appLocale
    #endif
  }

  ///
  /// The default language that the app will run first time.
  /// You need to set the `defaultLanguage` in the `AppDelegate`, specifically in
  /// the first line inside `application(_:willFinishLaunchingWithOptions:)`.
  ///
  static var defaultLanguage: Languages {
    get {
      #if TARGET_INTERFACE_BUILDER
      return .en
      #else
      return LanguageManager.shared.defaultLanguage
      #endif
    }
    set {
      LanguageManager.shared.defaultLanguage = newValue
    }
  }

  ///
  /// The current language.
  ///
  static var currentLanguage: Languages {
    #if TARGET_INTERFACE_BUILDER
    return .en
    #else
    return LanguageManager.shared.currentLanguage
    #endif
  }

  ///
  /// To print all the fonts names.
  ///
  static func printFontsNames() {
    UIFont.familyNames
      .forEach { family in  UIFont.fontNames(forFamilyName: family).forEach { print("Font name: " + $0) } }
  }

  ///
  /// Set the current language of the app
  ///
  /// - parameter language: The language that you need the app to run with.
  /// - parameter rootViewController: The new view controller to show after changing the language.
  /// - parameter animation: A closure with the current view to animate to the new view controller,
  ///                        so you need to animate the view, move it out of the screen, change the alpha,
  ///                        or scale it down to zero.
  ///
  static func setLanguage(language: Languages,
                          viewController: UIViewController? = nil,
                          animation: ((UIView) -> Void)? = nil) {

    var viewControllerFactory: LanguageManager.ViewControllerFactory?
    if let viewController = viewController {
      viewControllerFactory = { _ in viewController }
    }

    LanguageManager.shared.setLanguage(language: language,
                                       viewControllerFactory: viewControllerFactory) { view in
                                        view.transform = CGAffineTransform(scaleX: 2, y: 2)
                                        view.alpha = 0
    }
  }

}

extension String {

  ///
  /// Localize the current string to the selected language
  ///
  /// - returns: The localized string
  ///
  var localize: String {
    #if TARGET_INTERFACE_BUILDER
    return self
    #else
    return self.localiz()
    #endif
  }
}
