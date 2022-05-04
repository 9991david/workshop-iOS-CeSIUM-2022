// See license.md

import UIKit

extension UICollectionViewFlowLayout {

  static func makeLayout(
    minimumInteritemSpacing: CGFloat,
    minimumLineSpacing: CGFloat
  ) -> UICollectionViewFlowLayout {
    let layout = UICollectionViewFlowLayout()

    layout.minimumLineSpacing = minimumLineSpacing
    layout.minimumInteritemSpacing = minimumInteritemSpacing

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
