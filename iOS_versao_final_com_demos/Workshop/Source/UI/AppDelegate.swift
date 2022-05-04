// See license.md

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    runSomeTests()

    self.window = createAndShowWindow(showDemos: true)

    return true
  }

  private func createAndShowWindow(showDemos: Bool) -> UIWindow {
    let window = UIWindow(frame: UIScreen.main.bounds)

    if showDemos {
      window.rootViewController = defaultNavigationController(
        rootViewController: SelectionViewController()
      )
    } else {
      window.rootViewController = defaultNavigationController(
        rootViewController: RecipeComposer.compose()
      )
    }

    window.makeKeyAndVisible()

    return window
  }

  private func defaultNavigationController(rootViewController: UIViewController) -> UINavigationController {
    let navigationController = UINavigationController(
      rootViewController: rootViewController
    )

    let appearance = UINavigationBarAppearance()
    appearance.configureWithOpaqueBackground()
    appearance.backgroundColor = UIColor(hex: 0xEEEEEE)

    navigationController.navigationBar.standardAppearance = appearance
    navigationController.navigationBar.scrollEdgeAppearance = appearance

    return navigationController
  }

}
