// See license.md

import Foundation

extension Float {

  func multiplicaPor(_ valor: Float) -> Float {
    return self * valor
  }

}

func darOsParabens(_ nomeDaPessoa: String?) {
  print("Parabéns \(nomeDaPessoa ?? "Desconhecido")")
}

func calcularImc(peso: Float?, altura: Float) -> Float? {
  guard let peso = peso else {
    return nil
  }
  let resultado = peso.multiplicaPor(2)
  return peso / (altura * altura)
}

func somarPesos(_ peso1: Float?, peso2: Float) -> Float {
  var soma: Float = peso2
  if let peso1 = peso1 {
    soma += peso1
  }
  return soma
}


func runSomeTests() {
  let age = 12
  print("Age: \(age)")

  // age = 14 Erro compilação

  var counter = 0
  print("Counter: \(counter)")

  counter += 1
  print("Counter: \(counter)")

  counter += 2
  print("Counter: \(counter)")

  counter += 29
  print("Counter: \(counter) Age: \(age)")

  let name = "John Doe"
  print("Name: \(name)")
  print("Name: " + name)

  name.forEach { character in
    print("Character: \(character)")
  }

  let isValid = true

  if isValid {
    print("Is Valid")
  }
}
