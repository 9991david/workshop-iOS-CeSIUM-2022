// See license.md

import UIKit

/// Helper class to layout scrollable content
///
/// Example 1:
///   let scrollContentView = ContentScrollView<MyViewType>(contentView: MyViewType())
///
/// Example 2:
///   let scrollContentView = ContentScrollView<UIStackView>()
///   scrollContentView.contentView.addSubviews(
///     titleLabel,
///     contentLabel
///   )
///
public class ContentScrollView<ContentViewType: UIView>: UIScrollView {

  public let contentView: ContentViewType

  public init(
    frame: CGRect = .zero,
    axis: NSLayoutConstraint.Axis = .vertical,
    alwaysBounce: Bool = true,
    contentView: ContentViewType
  ) {
    self.contentView = contentView
    super.init(frame: frame)

    contentView.translatesAutoresizingMaskIntoConstraints = false

    addSubview(contentView)

    changeAxis(axis, alwaysBounce: alwaysBounce)
  }

  public required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  public func changeAxis(
    _ axis: NSLayoutConstraint.Axis,
    alwaysBounce: Bool = true
  ) {
    switch axis {
    case .horizontal:
      alwaysBounceVertical   = false
      alwaysBounceHorizontal = alwaysBounce

      setupHorizontally()

    case .vertical:
      alwaysBounceVertical   = alwaysBounce
      alwaysBounceHorizontal = false

      setupVertically()

    @unknown default:
      break
    }
  }

  private func setupHorizontally() {
    NSLayoutConstraint.activate([
      contentView.topAnchor.constraint(equalTo: contentLayoutGuide.topAnchor),
      contentView.leftAnchor.constraint(equalTo: contentLayoutGuide.leftAnchor),
      contentView.rightAnchor.constraint(equalTo: contentLayoutGuide.rightAnchor),
      contentView.bottomAnchor.constraint(equalTo: contentLayoutGuide.bottomAnchor),

      contentView.heightAnchor.constraint(equalTo: frameLayoutGuide.heightAnchor)
    ])
  }

  private func setupVertically() {
    NSLayoutConstraint.activate([
      contentView.topAnchor.constraint(equalTo: contentLayoutGuide.topAnchor),
      contentView.leftAnchor.constraint(equalTo: contentLayoutGuide.leftAnchor),
      contentView.rightAnchor.constraint(equalTo: contentLayoutGuide.rightAnchor),
      contentView.bottomAnchor.constraint(equalTo: contentLayoutGuide.bottomAnchor),

      contentView.widthAnchor.constraint(equalTo: frameLayoutGuide.widthAnchor)
    ])
  }

}
