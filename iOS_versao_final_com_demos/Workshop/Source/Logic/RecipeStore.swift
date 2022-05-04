// See license.md

import Foundation

// MARK: - RecipeStore
protocol RecipeStore {
  func fetchRecipes(completion: @escaping ([Recipe]) -> Void)
}

// MARK: - FileRecipeStore
class FileRecipeStore: RecipeStore {

  private let decoder = JSONDecoder()
  private let url: URL?

  init(url: URL) {
    self.url = url
  }

  init(fileName: String, fileExtension: String) {
    self.url =  Bundle.main.url(forResource: fileName, withExtension: fileExtension)
  }

  func fetchRecipes(completion: @escaping ([Recipe]) -> Void) {
    // Executamos a operação lenta em background
    DispatchQueue.global().async {
      guard
        let url = self.url,
        let data = self.readDataFromUrl(url),
        let recipes = self.readRecipesFromData(data)
      else {
        completion([Recipe]())

        return
      }

      completion(recipes)
    }
  }

  private func readDataFromUrl(_ url: URL) -> Data? {
    return try? Data(contentsOf: url)
  }

  private func readRecipesFromData(_ data: Data) -> [Recipe]? {
    return try? decoder.decode([Recipe].self, from: data)
  }

}
