// See license.md

import Foundation

// MARK: - Recipe
struct Recipe: Decodable {
  let id: UUID
  let image: String
  let name: String
  let preparationTime: String
  let ingredients: [String]
  let steps: [String]
  let nutritionalSummary: NutritionalSummary
  let isFavourite: Bool
  let difficulty: Int
  let createdAt: String
}

// MARK: - NutritionalSummary
struct NutritionalSummary: Decodable {
  let energy: String
  let fat: String
  let sugar: String
}
