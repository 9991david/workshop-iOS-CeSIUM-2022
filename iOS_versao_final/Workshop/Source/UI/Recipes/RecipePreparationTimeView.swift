// See license.md

import UIKit

class RecipePreparationTimeView: UIView {

  private let preparationTimeLabel = UILabel()

  init() {
    super.init(frame: .zero)

    setupLayout()
    setupViews()
  }

  required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

  private func setupLayout() {
    addSubviews([
      preparationTimeLabel
    ])

    preparationTimeLabel.makeEdgesEqualToParent(insets: UIEdgeInsets(horizontal: 8, vertical: 4))
  }

  private func setupViews() {
    preparationTimeLabel.textColor = UIColor.nutriumText
    preparationTimeLabel.numberOfLines = 2
    preparationTimeLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
  }

  func setRecipe(_ recipe: Recipe) {
    preparationTimeLabel.text = recipe.preparationTime

    if recipe.difficulty > 6 {
      backgroundColor = UIColor.nutriumRed
    } else if recipe.difficulty > 4 {
      backgroundColor = UIColor.nutriumOrange
    } else {
      backgroundColor = UIColor.nutriumSecondaryGreen
    }
  }

}
