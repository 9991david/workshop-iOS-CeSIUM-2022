// See license.md

import UIKit

class DemoStackViewController: UIViewController {

  private let stackView = UIStackView()

  override func viewDidLoad() {
    super.viewDidLoad()

    setupLayout()
    setupView()
  }

  private func setupLayout() {
    stackView.addArrangedSubview(UIView.makeSquareView(.green))
    stackView.addArrangedSubview(UIView.makeSquareView(.blue))
    stackView.addArrangedSubview(UIView.makeSquareView(.red))
    stackView.addArrangedSubview(UIView())

    view.addSubviews([stackView])

    NSLayoutConstraint.activate([
      stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      stackView.leftAnchor.constraint(equalTo: view.leftAnchor),
      stackView.rightAnchor.constraint(equalTo: view.rightAnchor)
    ])
  }

  private func setupView() {
    title = "DemoStackViewController"

    view.backgroundColor = UIColor.nutriumBackground

    stackView.axis = .horizontal
  }

}
