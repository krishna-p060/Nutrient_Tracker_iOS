//
//  MacroItemView.swift
//  NutrientTracker
//
//  Created by Apple on 17/03/24.
//

import SwiftUI

struct MacroHeaderView: View {
    @Binding var carbs: Int
    @Binding var fats: Int
    @Binding var proteins: Int
    
    var body: some View {
        HStack{
            Spacer()
            
            VStack{
                Image(systemName:"carrot.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60)
                    .foregroundColor(.red)
                
                Text("Carbs")
                Text("\(carbs) g")
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gray.opacity(0.1))
            )
            
            Spacer()
            
            VStack{
                Image(systemName:"takeoutbag.and.cup.and.straw.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60)
                    .foregroundColor(.blue)
                
                Text("Fats")
                Text("\(fats) g")
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gray.opacity(0.1))
            )
            
            Spacer()
            
            VStack{
                Image(systemName:"mug.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60)
                    .foregroundColor(.black)
                
                Text("Protein")
                Text("\(proteins) g")
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gray.opacity(0.1))
            )
            
            Spacer()
        }
    }
}

#Preview {
    MacroHeaderView(carbs: .constant(18), fats: .constant(42), proteins: .constant(122))
}
