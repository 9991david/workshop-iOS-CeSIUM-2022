// See license.md

import UIKit

struct RecipeComposer {

  static func compose() -> UIViewController {
    return RecipesListViewController(recipeStore: defaultRecipeStore())
  }

  private static func defaultRecipeStore() -> RecipeStore {
    return FileRecipeStore(fileName: "AllRecipes", fileExtension: "json")
  }

  private static func defaultRemoteRecipeStore() -> RecipeStore {
    return RemoteFileRecipeStore(url: URL(string: ""))
  }

  private static func defaultRecipeStoreWithFallback() -> RecipeStore {
    return RecipeStoreWithFallback(
      primaryStore: defaultRecipeStore(),
      fallbackStore: defaultRemoteRecipeStore()
    )
  }

}
