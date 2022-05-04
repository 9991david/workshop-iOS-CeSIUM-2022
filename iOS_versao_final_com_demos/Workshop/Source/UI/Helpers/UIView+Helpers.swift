// See license.md

import UIKit

extension UIView {

  func addSubviews(_ subViews: [UIView]) {
    subViews.forEach { subView in
      subView.translatesAutoresizingMaskIntoConstraints = false

      addSubview(subView)
    }
  }

  static func makeSquareView(_ color: UIColor) -> UIView {
    let squareView = UIView()

    squareView.translatesAutoresizingMaskIntoConstraints = false
    squareView.backgroundColor = color

    NSLayoutConstraint.activate([
      squareView.widthAnchor.constraint(equalToConstant: 100),
      squareView.heightAnchor.constraint(equalToConstant: 100)
    ])

    return squareView
  }

}
