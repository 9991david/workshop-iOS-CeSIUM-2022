// See license.md

import UIKit

class SelectionViewController: UIViewController {

  private let contentScrollView: ContentScrollView<UIStackView> = ContentScrollView(
    axis: .vertical,
    contentView: UIStackView.verticalStack(
      spacing: 8
    )
  )

  private let recipesButton = UIButton.makeAppButton("App das Receitas")
  private let elementosBásicosButton = UIButton.makeAppButton("Elementos Básicos")
  private let quadradoCentradoButton = UIButton.makeAppButton("Quadrado Centrado")
  private let quadradoLadoLadoButton = UIButton.makeAppButton("Quadrado Lado a Lado")
  private let quadradoLadoLadoComEspacamentoButton = UIButton.makeAppButton("Quadrado Lado a Lado Com Espacamento")
  private let tresQuadradosLadoLadoButton = UIButton.makeAppButton("Três Quadrados Lado a Lado")
  private let stackViewButton = UIButton.makeAppButton("UIStackView")
  private let tableViewButton = UIButton.makeAppButton("UITableView")
  private let collectionViewButton = UIButton.makeAppButton("UICollectionView")
  
  override func viewDidLoad() {
    super.viewDidLoad()

    setupLayout()
    setupView()
  }

  private func setupLayout() {
    view.addSubviews([
      contentScrollView
    ])

    addArrangedSubviews([
      recipesButton,
      elementosBásicosButton,
      quadradoCentradoButton,
      quadradoLadoLadoButton,
      quadradoLadoLadoComEspacamentoButton,
      tresQuadradosLadoLadoButton,
      stackViewButton,
      tableViewButton,
      collectionViewButton
    ])

    NSLayoutConstraint.activate([
      contentScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
      contentScrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
      contentScrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
      contentScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16)
    ])
  }

  private func setupView() {
    title = "Demos"

    view.backgroundColor = UIColor.nutriumBackground

    addPressActionToButton(elementosBásicosButton, #selector(onElementosBásicosButtonPress))
    addPressActionToButton(recipesButton, #selector(onRecipesButtonPress))
    addPressActionToButton(quadradoCentradoButton, #selector(onQuadradoCentradoButtonPress))
    addPressActionToButton(quadradoLadoLadoButton, #selector(onQuadradoLadoLadoButtonPress))
    addPressActionToButton(quadradoLadoLadoComEspacamentoButton, #selector(onQuadradoLadoLadoComEspacamentoButtonPress))
    addPressActionToButton(tresQuadradosLadoLadoButton, #selector(onTresQuadradosLadoLadoButtonPress))
    addPressActionToButton(stackViewButton, #selector(onStackViewButtonPress))
    addPressActionToButton(tableViewButton, #selector(onTableViewButtonPress))
    addPressActionToButton(collectionViewButton, #selector(onCollectionViewButtonPress))
  }

  private func addArrangedSubviews(_ views: [UIView]) {
    views.forEach { view in
      contentScrollView.contentView.addArrangedSubview(view)
    }
  }

  private func addPressActionToButton(_ button: UIButton, _ action: Selector) {
    button.addTarget(self, action: action, for: .touchUpInside)
  }

  @objc
  private func onElementosBásicosButtonPress() -> Void {
    pushViewController(DemoBasicElements())
  }

  @objc
  private func onRecipesButtonPress() -> Void {
    pushViewController(RecipeComposer.compose())
  }

  @objc
  private func onQuadradoCentradoButtonPress() -> Void {
    pushViewController(DemoQuadradosViewController(demoType: .quadradoCentrado))
  }

  @objc
  private func onQuadradoLadoLadoButtonPress() -> Void {
    pushViewController(DemoQuadradosViewController(demoType: .quadradoLadoLado))
  }

  @objc
  private func onQuadradoLadoLadoComEspacamentoButtonPress() -> Void {
    pushViewController(DemoQuadradosViewController(demoType: .quadradoLadoLadoComEspacamento))
  }

  @objc
  private func onTresQuadradosLadoLadoButtonPress() -> Void {
    pushViewController(DemoQuadradosViewController(demoType: .tresQuadradosLadoLado))
  }

  @objc
  private func onStackViewButtonPress() -> Void {
    pushViewController(DemoStackViewController())
  }

  @objc
  private func onTableViewButtonPress() -> Void {
    pushViewController(DemoTableViewController())
  }

  @objc
  private func onCollectionViewButtonPress() -> Void {
    pushViewController(DemoCollectionViewController())
  }

  private func pushViewController(_ viewController: UIViewController) {
    navigationController?.pushViewController(viewController, animated: true)
  }

}
