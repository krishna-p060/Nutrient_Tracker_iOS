//
//  Date+Ext.swift
//  NutrientTracker
//
//  Created by Apple on 19/03/24.
//

import Foundation

extension Date{
    var monthAndDay: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d"
        return formatter.string(from: self)
    }
    
    var time: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return formatter.string(from: self)
    }
}
