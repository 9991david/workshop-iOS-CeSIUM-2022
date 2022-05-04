// See license.md

import Foundation

// MARK: - RemoteFileRecipeStore
class RemoteFileRecipeStore: RecipeStore {

  private let decoder = JSONDecoder()
  private let url: URL?

  init(url: URL?) {
    self.url = url
  }

  func fetchRecipes(completion: @escaping ([Recipe]) -> Void) {
    // Executamos a operação lenta em background
    DispatchQueue.global().async {
      guard let url = self.url else {
        completion([Recipe]())

        return
      }

      var request = URLRequest(url: url)

      request.httpMethod = "GET"

      let task = URLSession.shared.dataTask(with: request) { (_ data: Data?, response, error) in
        // Em antes de se tentar ler as receitas podia-se validar:
        // - o error é nil
        // - http status code da response encontra-se na gama 200

        completion(self.readRecipesFromData(data))
      }

      // Importante iniciar o pedido
      task.resume()
    }
  }

  private func readRecipesFromData(_ data: Data?) -> [Recipe] {
    guard let data = data else {
      return [Recipe]()
    }

    return (try? decoder.decode([Recipe].self, from: data)) ?? [Recipe]()
  }

}

// MARK: - RecipeStoreWithFallback
class RecipeStoreWithFallback: RecipeStore {

  private let primaryStore: RecipeStore
  private let fallbackStore: RecipeStore

  init(primaryStore: RecipeStore, fallbackStore: RecipeStore) {
    self.primaryStore = primaryStore
    self.fallbackStore = fallbackStore
  }

  func fetchRecipes(completion: @escaping ([Recipe]) -> Void) {
    // Primeiro vamos tentar ler os resultados da store principal
    primaryStore.fetchRecipes { primaryResults in
      // Aqui em vez de se validar "vazio" devia-se validar se deu erro
      if primaryResults.isEmpty {
        // Depois vamos tentar ler os resultados da store principal
        self.fallbackStore.fetchRecipes(completion: completion)
      } else {
        completion(primaryResults)
      }
    }
  }

}
