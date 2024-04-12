//
//  GetMacros.swift
//  NutrientTracker
//
//  Created by Apple on 18/03/24.
//

import Foundation

struct MacroModel {
  let fats: Int
  let carbs: Int
  let proteins: Int
}

let foodData: [String: MacroModel] = [
  "Apple": MacroModel(fats: 32, carbs: 25, proteins: 101),
  "Banana": MacroModel(fats: 57, carbs: 23, proteins: 178),
  "Chicken breast": MacroModel(fats: 17, carbs: 40, proteins: 31),
  "Eggs": MacroModel(fats: 65, carbs: 19, proteins: 46),
  "Salmon": MacroModel(fats: 12, carbs: 30, proteins: 122),
]

func getMacroNutrients(for food: String) -> MacroModel? {
  return foodData[food]
}

// Example usage
func main() {
    let foodItem = "chicken breast"
    if let macro = getMacroNutrients(for: foodItem) {
        print("Fats: \(macro.fats), Carbs: \(macro.carbs), Protein: \(macro.proteins)")
    } else {
        print("Macro data not found for \(foodItem)")
    }
}

// Call the main function to execute the code

