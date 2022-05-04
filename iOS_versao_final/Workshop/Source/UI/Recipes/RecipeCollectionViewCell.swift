// See license.md

import UIKit

class RecipeCollectionViewCell: UICollectionViewCell {

  private let recipePreparationTimeView = RecipePreparationTimeView()
  private let imageView = UIImageView()
  private let recipeInformationView = RecipeInformationView()

  override init(frame: CGRect) {
    super.init(frame: frame)

    setupViews()
    setupLayout()
  }

  required init(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

  private func setupLayout() {
    contentView.addSubviews([
      imageView,
      recipePreparationTimeView,
      recipeInformationView
    ])

    imageView.makeEdgesEqualToParent(insets: UIEdgeInsets.zero)

    NSLayoutConstraint.activate([
      recipePreparationTimeView.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 8),
      recipePreparationTimeView.rightAnchor.constraint(equalTo: imageView.rightAnchor, constant: -8),

      recipeInformationView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
      recipeInformationView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
      recipeInformationView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
      recipeInformationView.heightAnchor.constraint(greaterThanOrEqualToConstant: 80)
    ])
  }

  private func setupViews() {
    imageView.contentMode = .scaleAspectFill
  }

  func setRecipe(_ recipe: Recipe) {
    recipeInformationView.setRecipe(recipe)

    recipePreparationTimeView.setRecipe(recipe)

    imageView.setImageInBase64(recipe.image)
  }

}
