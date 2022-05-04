// See license.md

import UIKit

extension UIView {

  func makeEdgesEqualTo(_ viewController: UIViewController, insets: UIEdgeInsets) {
    let parentView = viewController.view!

    NSLayoutConstraint.activate([
      topAnchor.constraint(equalTo: parentView.safeAreaLayoutGuide.topAnchor, constant: insets.top),
      leftAnchor.constraint(equalTo: parentView.leftAnchor, constant: insets.left),
      rightAnchor.constraint(equalTo: parentView.rightAnchor, constant: -insets.right),
      bottomAnchor.constraint(equalTo: parentView.bottomAnchor, constant: -insets.bottom)
    ])
  }

  func makeEdgesEqualToParent(insets: UIEdgeInsets) {
    guard let parentView = superview else {
      return
    }

    NSLayoutConstraint.activate([
      topAnchor.constraint(equalTo: parentView.topAnchor, constant: insets.top),
      leftAnchor.constraint(equalTo: parentView.leftAnchor, constant: insets.left),
      rightAnchor.constraint(equalTo: parentView.rightAnchor, constant: -insets.right),
      bottomAnchor.constraint(equalTo: parentView.bottomAnchor, constant: -insets.bottom)
    ])
  }

  func makeLeftRightAndBottomEqualToParent(insets: UIEdgeInsets) {
    guard let parentView = superview else {
      return
    }

    NSLayoutConstraint.activate([
      leftAnchor.constraint(equalTo: parentView.leftAnchor, constant: insets.left),
      rightAnchor.constraint(equalTo: parentView.rightAnchor, constant: -insets.right),
      bottomAnchor.constraint(equalTo: parentView.bottomAnchor, constant: -insets.bottom)
    ])
  }

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
