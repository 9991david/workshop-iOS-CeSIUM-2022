// See license.md

import UIKit

class RecipeCollectionViewCell: UICollectionViewCell {

  override init(frame: CGRect) {
    super.init(frame: frame)

    setupViews()
    setupLayout()
  }

  required init(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

  private func setupLayout() {
  }

  private func setupViews() {
    
  }

  func setRecipe(_ recipe: Recipe) {
  }

}
