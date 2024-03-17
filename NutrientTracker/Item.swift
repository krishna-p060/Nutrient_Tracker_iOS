//
//  Item.swift
//  NutrientTracker
//
//  Created by Apple on 17/03/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
