// See license.md

import UIKit

extension UIImageView {

  func setImageInBase64(_ imageString: String) {
    guard let imageData = Data(base64Encoded: imageString) else {
      image = nil

      return
    }

    image = UIImage(data: imageData)
  }

}
