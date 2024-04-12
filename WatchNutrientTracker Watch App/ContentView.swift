//
//  ContentView.swift
//  WatchNutrientTracker Watch App
//
//  Created by Apple on 19/03/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var watchConnector = WatchToiOSConnector()
    @State var food = ""
    @State var date = Date.now
    @State var isLoading = false
    
    var body: some View {
        ZStack{
            VStack {
                TextField("What did you eat today", text: $food)
                
                DatePicker("When", selection: $date)
                
                Button{
                    sendFoodToGet()
                } label: {
                    Text("Done")
                }
                
            }
            .padding()
            .ignoresSafeArea()
            
            if isLoading {
                Color.primary.opacity(0.7)
                
                ProgressView()
            }
        }
        .ignoresSafeArea()
    }
    
    func sendFoodToGet(){
        Task{
            isLoading = true
            if let macro = getMacroNutrients(for: food) {
                print(macro)
                sendMacroToiOS(macro: macro, food: food)
                isLoading = false
                
            } else {
                isLoading = false
                print("Macro data not found for that food")
            }
        }
    }
    
    func sendMacroToiOS(macro: MacroModel, food: String) {
        let macroItem = Macro(food: food, createdAt: .now, date: date, carbs: macro.carbs, fats: macro.fats, proteins: macro.proteins)
        watchConnector.sendMacroToiOS(macro: macroItem)
    }
}

#Preview {
    ContentView()
}
