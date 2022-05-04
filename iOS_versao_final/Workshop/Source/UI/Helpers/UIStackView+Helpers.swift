// See license.md

import UIKit

// MARK: Static factories
extension UIStackView {

  public static func verticalStack(
    spacing: CGFloat,
    distribution: UIStackView.Distribution? = nil,
    alignment: UIStackView.Alignment? = nil,
    layoutMargins: UIEdgeInsets? = nil
  ) -> UIStackView {
    let stackView = UIStackView()

    stackView.spacing = spacing
    stackView.axis = .vertical

    return stackView
  }

}
