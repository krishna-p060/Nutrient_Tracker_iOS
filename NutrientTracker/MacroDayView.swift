//
//  MacroDayView.swift
//  NutrientTracker
//
//  Created by Apple on 18/03/24.
//

import SwiftUI


struct MacroDayView: View {
    @State var macro: DailyMacro
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(macro.date.monthAndDay)
                    .font(.title2)
                Text(macro.date.time)
            }
            .frame(width: 80, alignment: .leading)
            
            
            Spacer()
            
            HStack{
                VStack{
//                    Image(systemName:"carrot.fill")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 60)
//                        .foregroundColor(.red)
                    
                    Text("Carbs")
                    Text("\(macro.carbs) g")
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.gray.opacity(0.1))
                )
                
                Spacer()
                
                VStack{
                   
                    Text("Fats")
                    Text("\(macro.fats) g")
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.gray.opacity(0.1))
                )
                
                Spacer()
                
                VStack{
                    
                    
                    Text("Protein")
                    Text("\(macro.proteins) g")
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.gray.opacity(0.1))
                )
                
                //Spacer()
            }
            Spacer()
        }

    }
}

#Preview {
    MacroDayView(macro: DailyMacro(date: .now, carbs: 123, fats: 34, proteins: 66))
}
