// See license.md

import UIKit

class DemoCollectionViewController: UIViewController, UICollectionViewDataSource {

  private let exampleCollectionView: UICollectionView = UICollectionView(
    frame: .zero,
    collectionViewLayout: UICollectionViewFlowLayout.makeLayout(itemSize: CGSize(width: 100, height: 100))
  )

  private let colors: [UIColor] = [
    .green,
    .blue,
    .red
  ]

  override func viewDidLoad() {
    super.viewDidLoad()

    setupLayout()
    setupView()
  }

  private func setupLayout() {
    view.addSubviews([
      exampleCollectionView
    ])

    NSLayoutConstraint.activate([
      exampleCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
      exampleCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
      exampleCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
      exampleCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16)
    ])
  }

  private func setupView() {
    title = "DemoCollectionViewController"

    view.backgroundColor = UIColor.nutriumBackground

    exampleCollectionView.backgroundColor = UIColor.nutriumBackground
    exampleCollectionView.alwaysBounceVertical = true
    exampleCollectionView.alwaysBounceHorizontal = true

    // Aqui podemos registar outro tipo de células
    exampleCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ExampleCell")

    exampleCollectionView.dataSource = self
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return colors.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExampleCell", for: indexPath)

    cell.backgroundColor = colors[indexPath.item]

    return cell
  }

}
