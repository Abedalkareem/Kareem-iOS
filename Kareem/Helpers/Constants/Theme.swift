//
//  Theme.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 10/12/2019.
//  Copyright © 2019 abedalkareem. All rights reserved.
//

import UIKit

extension UIColor {

  // MARK: - Main colors

  static let primary = getColor(named: "Primary Color")!
  static let secondary = getColor(named: "Secondary Color")!
  static let tertiary = getColor(named: "Tertiary Color")!
  static let textOverPrimary = getColor(named: "Text Over Primary Color")!
  static let textOverSecondary = getColor(named: "Text Over Secondary Color")!
  static let white = getColor(named: "White Color")!

  // MARK: - others

  static var text: UIColor {
    return primary
  }


  // MARK: - Functions

  private static func getColor(named: String) -> UIColor? {
    #if TARGET_INTERFACE_BUILDER
    return UIColor.orange
    #else
    return UIColor(named: named)
    #endif
  }
}

extension UIFont {

  // MARK: - Private

  private static var titleFont = "Lalezar-Regular"

  private static var enBold = "Roboto-Bold"
  private static var enMedium = "Roboto-Medium"
  private static var enLight = "Roboto-Light"

  private static var arBold = ""
  private static var arMedium = ""
  private static var arLight = ""


  private static var lightFont: String {
    return LocalizationHelper.isRightToLeft ? arLight : enLight
  }
  private static var mediumFont: String {
    return LocalizationHelper.isRightToLeft ? arMedium : enMedium
  }
  private static var boldFont: String {
    return LocalizationHelper.isRightToLeft ? arBold : enBold
  }

  // MARK: - Fonts

  /// Style: Size(55), Weight(Medium)
  static let appLogo = getFontWith(name: titleFont, size: 55)

  // MARK: Bold

  /// Style: Size(24), Weight(Bold)
  static let title1 = getFontWith(name: boldFont, size: 24)
  /// Style: Size(22), Weight(Bold)
  static let title2 = getFontWith(name: boldFont, size: 22)
  /// Style: Size(20), Weight(Bold)
  static let title3 = getFontWith(name: boldFont, size: 20)
  /// Style: Size(18), Weight(Bold)
  static let title4 = getFontWith(name: boldFont, size: 18)
  /// Style: Size(16), Weight(Bold)
  static let title5 = getFontWith(name: boldFont, size: 16)
  /// Style: Size(14), Weight(Bold)
  static let title6 = getFontWith(name: boldFont, size: 14)
  /// Style: Size(12), Weight(Bold)
  static let title7 = getFontWith(name: boldFont, size: 12)

  // MARK: Medium

  /// Style: Size(24), Weight(Medium)
  static let body1 = getFontWith(name: mediumFont, size: 24)
  /// Style: Size(22), Weight(Medium)
  static let body2 = getFontWith(name: mediumFont, size: 22)
  /// Style: Size(20), Weight(Medium)
  static let body3 = getFontWith(name: mediumFont, size: 20)
  /// Style: Size(18), Weight(Medium)
  static let body4 = getFontWith(name: mediumFont, size: 18)
  /// Style: Size(16), Weight(Medium)
  static let body5 = getFontWith(name: mediumFont, size: 16)
  /// Style: Size(14), Weight(Medium)
  static let body6 = getFontWith(name: mediumFont, size: 14)
  /// Style: Size(12), Weight(Medium)
  static let body7 = getFontWith(name: mediumFont, size: 12)

  // MARK: Light

  /// Style: Size(24), Weight(Light)
  static let subBody1 = getFontWith(name: lightFont, size: 24)
  /// Style: Size(22), Weight(Light)
  static let subBody2 = getFontWith(name: lightFont, size: 22)
  /// Style: Size(20), Weight(Light)
  static let subBody3 = getFontWith(name: lightFont, size: 20)
  /// Style: Size(18), Weight(Light)
  static let subBody4 = getFontWith(name: lightFont, size: 18)
  /// Style: Size(16), Weight(Light)
  static let subBody5 = getFontWith(name: lightFont, size: 16)
  /// Style: Size(14), Weight(Light)
  static let subBody6 = getFontWith(name: lightFont, size: 14)
  /// Style: Size(12), Weight(Light)
  static let subBody7 = getFontWith(name: lightFont, size: 12)


  // MARK: - Functions

  private static func getFontWith(name: String, size: CGFloat) -> UIFont {
    #if TARGET_INTERFACE_BUILDER
    return UIFont.systemFont(ofSize: size)
    #else
    return UIFont(name: name, size: size)!
    #endif
  }
}
