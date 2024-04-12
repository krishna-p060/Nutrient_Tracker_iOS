//
//  MacroView.swift
//  NutrientTracker
//
//  Created by Apple on 17/03/24.
//

import SwiftUI
import SwiftData

struct DailyMacro: Identifiable {
    let id = UUID()
    let date: Date
    let carbs: Int
    let fats: Int
    let proteins: Int
}

struct MacroView: View {
    @Environment(\.modelContext) var modelContext
    @StateObject var watchConnector = WatchConnector()
    @State var carbs = 22
    @State var fats = 33
    @State var proteins = 99
    
    @Query var macros: [Macro]
    
    @State var dailyMacros = [DailyMacro]()
    
    @State var showTextField = false
    @State var food = ""
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading){
                Text("Today's Macros")
                    .padding()
                    .font(.title)
                
                
                MacroHeaderView(carbs: $carbs, fats: $fats, proteins: $proteins)
                    .padding()
                
                ScrollView(.vertical) {
                    VStack(alignment: .leading){
                        Text("Previous")
                            .font(.title)
                        
                        ForEach(dailyMacros) { macro in
                            
                            MacroDayView(macro: macro)
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .sheet(isPresented: $showTextField) {
                AddMacroView()
                    .presentationDetents([.fraction(0.4)])
            }
            .onAppear{
                fetchDailyMacros()
                watchConnector.modelContext = modelContext
            }
            .onChange(of: macros) { _, _ in
                fetchDailyMacros()
            }
//            .alert("MacroTracker", isPresented: $showTextField, actions: {
//                TextField("Food", text: $food)
//                Button("cancel", role: .cancel, action: {})
//                Button("done") {
//                    Task{
//                        if let macro = getMacroNutrients(for: food) {
//                            print(macro)
//                            saveMacro(macro: macro, food: food)// Print the obtained macro if it's not nil
//                            } else {
//                                print("Macro data not found for that food")
//                            }
//                    }
//                }
//            }, message: {
//                Text("Please enter the meal or food you want to track")
//            })
            .toolbar{
                ToolbarItem{
                    Button{                       
                        showTextField = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    .foregroundStyle(.black)
                }
            }
        }
        
    }
    
//    private func saveMacro(macro: MacroModel, food: String){
//        let macroItem = Macro(food: food, createdAt: .now, date: .now, carbs: macro.carbs, fats: macro.fats, proteins: macro.proteins)
//        modelContext.insert(macroItem)
//        print(macros)
//        print(macros.first?.food)
//    }
    
    private func fetchDailyMacros() {
        let dates: Set<Date> = Set(macros.map({ Calendar.current.startOfDay(for: $0.date)} ))
        var dailyMacros = [DailyMacro]()
        for date in dates{
            let filterMacros = macros.filter({ Calendar.current.startOfDay(for: $0.date) == date})
            let carbs : Int = filterMacros.reduce(0, { $0 + $1.carbs})
            let fats: Int = filterMacros.reduce(0, { $0 + $1.fats })
            let proteins: Int = filterMacros.reduce(0, { $0 + $1.proteins })
            
            let macro = DailyMacro(date: date, carbs: carbs, fats: fats, proteins: proteins)
            dailyMacros.append(macro)
            
        }
        self.dailyMacros = dailyMacros.sorted(by: {$0.date > $1.date})
    }
}

#Preview {
    
    MacroView()
}
