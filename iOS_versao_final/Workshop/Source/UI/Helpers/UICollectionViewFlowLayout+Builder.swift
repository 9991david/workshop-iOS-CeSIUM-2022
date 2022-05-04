// See license.md

import UIKit

extension UICollectionViewFlowLayout {

  static func makeLayout(
    minimumLineSpacing: CGFloat
  ) -> UICollectionViewFlowLayout {
    let layout = UICollectionViewFlowLayout()

    layout.minimumLineSpacing = minimumLineSpacing

    return layout
  }

  static func makeLayout(
    itemSize: CGSize
  ) -> UICollectionViewFlowLayout {
    let layout = UICollectionViewFlowLayout()

    layout.itemSize = itemSize

    return layout
  }

}
