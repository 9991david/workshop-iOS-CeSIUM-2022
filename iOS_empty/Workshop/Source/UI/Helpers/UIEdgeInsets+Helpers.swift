// See license.md

import UIKit

extension UIEdgeInsets {

  init(all: CGFloat) {
    self.init(top: all, left: all, bottom: all, right: all)
  }

  init(horizontal: CGFloat, vertical: CGFloat) {
    self.init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
  }

}
