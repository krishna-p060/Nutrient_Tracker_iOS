//
//  AddMacroView.swift
//  NutrientTracker
//
//  Created by Apple on 18/03/24.
//

import SwiftUI
import SwiftData

struct AddMacroView: View {
    @Environment(\.modelContext) var modelContext
    @State private var food = ""
    @State private var date = Date()
    
    @Query var macros: [Macro]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Add Macro")
                .font(.largeTitle)
            
            TextField("What did you eat?", text: $food)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke()
                )
            
            DatePicker("Date", selection: $date)
            
            Button{
                if let macro = getMacroNutrients(for: food) {
                    print(macro)
                    saveMacro(macro: macro, food: food, date: date)// Print the obtained macro if it's not nil
                } else {
                    print("Macro data not found for that food")
                }
                
            } label: {
                Text("Done")
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundColor(Color(uiColor: .systemBackground))
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color(uiColor: .label))
                    )
                    .padding()
                    
                    .foregroundColor(Color(uiColor: .systemBackground))
            }
        }
        .padding(.horizontal)
    }
    
    private func saveMacro(macro: MacroModel, food: String, date: Date){
        let macroItem = Macro(food: food, createdAt: date, date: date, carbs: macro.carbs, fats: macro.fats, proteins: macro.proteins)
        modelContext.insert(macroItem)
        print(macros)
        //print(macros.first?.food)
    }
}

#Preview {
    AddMacroView()
}
