//
//  MedCardView.swift
//  MedWaste
//
//  Created by Irene Fernando on 23/05/22.
//
// This view serves as the basic structure of the medicine card in the CabinetView
// VStack : Image, HStack (Name of med, Dosage) ,Type of med

import SwiftUI

struct MedCardView: View {
    var body: some View {
        ZStack{
               RoundedRectangle(cornerRadius: 20, style: .continuous)
                .foregroundColor(.gray)
                   .fixedSize(horizontal: false, vertical: false)
                   .shadow(color: .gray, radius: 2, x: 0, y: 2)
               VStack(alignment: .center, spacing: 10){
                   Image("pills").resizable().scaledToFit()
                   RoundedRectangle(cornerRadius: 20).fixedSize(horizontal: false, vertical: true)
                   HStack{
                       Text("Ayrinal").font(.title3).fontWeight(.bold).textCase(.uppercase)
                       Spacer()
                       Text ("20mg")
                   }
                   HStack{
                   Text("Antistamine")
                   Spacer()
                   }
                  
               }.padding()
               
           }
    }
}

struct MedCardView_Previews: PreviewProvider {
    static var previews: some View {
        MedCardView()
    }
}
