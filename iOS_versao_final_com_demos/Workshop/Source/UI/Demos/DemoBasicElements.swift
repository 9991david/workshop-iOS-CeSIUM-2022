// See license.md

import UIKit

class DemoBasicElements: UIViewController {

  private let exampleLabel = UILabel()
  private let exampleButton = UIButton(type: .system)
  private let exampleImageView = UIImageView()
  private let exampleTextField = UITextField()
  private let exampleScrollView = UILabel()

  override func viewDidLoad() {
    super.viewDidLoad()

    setupLayout()
    setupView()
  }

  private func setupLayout() {
    view.addSubviews([
      exampleLabel,
      exampleButton,
      exampleImageView,
      exampleTextField
    ])

    NSLayoutConstraint.activate([
      exampleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
      exampleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
      exampleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),

      exampleButton.topAnchor.constraint(equalTo: exampleLabel.bottomAnchor, constant: 16),
      exampleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

      exampleImageView.topAnchor.constraint(equalTo: exampleButton.bottomAnchor, constant: 16),
      exampleImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
      exampleImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
      exampleImageView.heightAnchor.constraint(equalTo: exampleImageView.widthAnchor),

      exampleTextField.topAnchor.constraint(equalTo: exampleImageView.bottomAnchor, constant: 16),
      exampleTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
      exampleTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16)
    ])
  }

  private func setupView() {
    title = "DemoBasicElements"

    view.backgroundColor = UIColor.nutriumBackground

    exampleLabel.text = "Olá Mundo!"
    exampleLabel.textColor = UIColor.nutriumGreen

    exampleButton.backgroundColor = UIColor.nutriumGreen
    exampleButton.setTitleColor(.white, for: .normal)
    exampleButton.setTitle("Press me!", for: .normal)
    exampleButton.addTarget(self, action: #selector(onExampleButtonPress), for: .touchUpInside)

    exampleImageView.image = UIImage(named: "nutrium")
    exampleImageView.contentMode = .scaleAspectFit

    exampleTextField.borderStyle = .bezel
  }

  @objc
  private func onExampleButtonPress() -> Void {
    print("Example Button Pressed")
  }

}
