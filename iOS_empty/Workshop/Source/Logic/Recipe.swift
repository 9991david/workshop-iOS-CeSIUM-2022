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

/*
{
  "nutritionalSummary": {
    "fat": "2,1 g",
    "sugar": "19,0 g",
    "energy": "311 Kcal"
  },
  "ingredients": [
    "Corn-flakes",
    "Acucar baunilhado",
    "Creme de leite",
    "Flocos de aveia"
  ],
  "id": "3B49BA5B-16A2-4ABA-BE11-CA4AACC30149",
  "steps": [
    "Espalhe mais uma camada de natas e em seguida regue com o molho de mirtilos.",
    "Aqueça um grelhador com o restante azeite.",
    "Sirva com a salsa e os coentros picados, um pouco de pimenta, o restante sumo de limão (reserve algumas rodelas para decorar).",
    "Continue a misturar até engrossar. Retire do lume, junte a raspa de limão, coloque numa taça e leve ao frio.",
    "Divida a quinoa por 4 taças e por cima disponha os ingredientes uns ao lado dos outros: atum, abacate, manga e pepino.",
    "Coloque na base da forma uma camada fina da mistura de natas e por cima faça uma camada de bolachas torradas.",
    "Enquanto mistura, pode ir esmagando alguns mirtilos com um garfo."
  ],
  "isFavourite": false,
  "image": "BASE_&$",
  "difficulty": 3,
  "createdAt": "3/16/22",
  "name": "Curau de milho verde com leite condensado",
  "preparationTime": "00:30 min"
}
*/
