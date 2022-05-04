// See license.md

import UIKit

class DemoQuadradosViewController: UIViewController {

  enum DemoType {
    case quadradoCentrado
    case quadradoLadoLado
    case quadradoLadoLadoComEspacamento
    case tresQuadradosLadoLado
  }

  private let demoType: DemoType

  init(demoType: DemoType) {
    self.demoType = demoType

    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .white

    view.layer.borderWidth = 6
    view.layer.borderColor = UIColor.red.cgColor

    switch demoType {
    case .quadradoCentrado:
      exampleLayoutCenterSquare(parent: view)

    case .quadradoLadoLado:
      exampleLayout2Squares(parent: view)

    case .quadradoLadoLadoComEspacamento:
      exampleLayout2SquaresWithSpacing(parent: view)

    case .tresQuadradosLadoLado:
      exampleLayout3Squares(parent: view)
    }
  }

  private func exampleLayoutCenterSquare(parent: UIView) {
    let viewGreen = addView(.green)

    NSLayoutConstraint.activate([
      viewGreen.centerXAnchor.constraint(equalTo: parent.centerXAnchor),
      viewGreen.centerYAnchor.constraint(equalTo: parent.centerYAnchor)
    ])
  }

  private func exampleLayout2Squares(parent: UIView) {
    let viewGreen = addView(.green)
    let viewBlue = addView(.blue)

    NSLayoutConstraint.activate([
      viewGreen.leftAnchor.constraint(equalTo: parent.leftAnchor),
      viewGreen.centerYAnchor.constraint(equalTo: parent.centerYAnchor),

      viewBlue.leftAnchor.constraint(equalTo: viewGreen.rightAnchor),
      viewBlue.topAnchor.constraint(equalTo: viewGreen.topAnchor),
    ])
  }

  private func exampleLayout2SquaresWithSpacing(parent: UIView) {
    let viewGreen = addView(.green)
    let viewBlue = addView(.blue)

    NSLayoutConstraint.activate([
      viewGreen.leftAnchor.constraint(equalTo: parent.leftAnchor),
      viewGreen.centerYAnchor.constraint(equalTo: parent.centerYAnchor),

      viewBlue.leftAnchor.constraint(equalTo: viewGreen.rightAnchor, constant: 16),
      viewBlue.topAnchor.constraint(equalTo: viewGreen.topAnchor),
    ])
  }

  private func exampleLayout3Squares(parent: UIView) {
    let viewGreen = addView(.green)
    let viewBlue = addView(.blue)
    let viewRed = addView(.red)

    NSLayoutConstraint.activate([
      viewGreen.leftAnchor.constraint(equalTo: parent.leftAnchor),
      viewGreen.centerYAnchor.constraint(equalTo: parent.centerYAnchor),

      viewBlue.leftAnchor.constraint(equalTo: viewGreen.rightAnchor),
      viewBlue.topAnchor.constraint(equalTo: viewGreen.topAnchor),

      viewRed.leftAnchor.constraint(equalTo: viewBlue.rightAnchor),
      viewRed.topAnchor.constraint(equalTo: viewBlue.topAnchor)
    ])
  }

  private func addView(_ color: UIColor) -> UIView {
    let viewA = UIView.makeSquareView(color)

    view.addSubview(viewA)

    return viewA
  }

}
