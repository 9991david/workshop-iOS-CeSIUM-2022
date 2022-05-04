// See license.md

import UIKit

class RecipeInformationView: UIView {

  private let nameLabel = UILabel()
  private let nutritionalSummaryLabel = UILabel()

  init() {
    super.init(frame: .zero)

    setupLayout()
    setupViews()
  }

  required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

  private func setupLayout() {
    addSubviews([
      nameLabel,
      nutritionalSummaryLabel
    ])

    NSLayoutConstraint.activate([
      nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
      nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
      nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),

      nutritionalSummaryLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
      nutritionalSummaryLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
      nutritionalSummaryLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
      nutritionalSummaryLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -8)
    ])
  }

  private func setupViews() {
    backgroundColor = UIColor.nutriumSecondaryBackground

    nameLabel.textColor = UIColor.nutriumText
    nameLabel.numberOfLines = 2
    nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .black)

    nutritionalSummaryLabel.textColor = UIColor.nutriumText
    nutritionalSummaryLabel.numberOfLines = 1
    nutritionalSummaryLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
  }

  func setRecipe(_ recipe: Recipe) {
    nameLabel.text = recipe.name
    nutritionalSummaryLabel.text = "\(recipe.nutritionalSummary.energy) Gorduras \(recipe.nutritionalSummary.fat) Açucar \(recipe.nutritionalSummary.sugar)"
  }

}
