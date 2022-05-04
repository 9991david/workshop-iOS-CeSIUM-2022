// See license.md

import UIKit

extension UIColor {

  static var nutriumBackground: UIColor {
    return UIColor(hex: 0xFAFAFA)
  }

  static var nutriumSecondaryBackground: UIColor {
    return UIColor(hex: 0xE0E0E0)
  }

  static var nutriumText: UIColor {
    return UIColor(hex: 0x212121)
  }

  static var nutriumGreen: UIColor {
    return UIColor(hex: 0x1AB394)
  }

  static var nutriumRed: UIColor {
    return UIColor(hex: 0xFF8A65)
  }

  static var nutriumOrange: UIColor {
    return UIColor(hex: 0xFFB74D)
  }

  static var nutriumSecondaryGreen: UIColor {
    return UIColor(hex: 0x81C784)
  }

  convenience init(hex: UInt, alpha: CGFloat = 1) {
    self.init(
      red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
      green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
      blue: CGFloat(hex & 0x0000FF) / 255.0,
      alpha: alpha
    )
  }

}
