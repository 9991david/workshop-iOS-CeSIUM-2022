// See license.md

import UIKit

extension UIButton {

  static func makeAppButton(_ title: String) -> UIButton {
    let button = UIButton(type: .system)

    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = UIColor.nutriumGreen
    button.setTitleColor(.white, for: .normal)
    button.setTitle(title, for: .normal)

    NSLayoutConstraint.activate([
      button.heightAnchor.constraint(equalToConstant: 50)
    ])

    return button
  }

}
