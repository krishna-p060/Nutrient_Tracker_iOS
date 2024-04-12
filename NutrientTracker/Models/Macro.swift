//
//  Macro.swift
//  NutrientTracker
//
//  Created by Apple on 18/03/24.
//

import Foundation
import SwiftData

@Model
final class Macro{
    let food: String
    let createdAt: Date
    let date: Date
    let carbs: Int
    let fats: Int
    let proteins: Int
    
    init(food: String, createdAt: Date, date: Date, carbs: Int, fats: Int, proteins: Int) {
        self.food = food
        self.createdAt = createdAt
        self.date = date
        self.carbs = carbs
        self.fats = fats
        self.proteins = proteins
    }
}
