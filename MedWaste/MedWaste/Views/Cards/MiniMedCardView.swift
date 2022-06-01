//
//  MiniMedCardView.swift
//  MedWaste
//
//  Created by Irene Fernando on 29/05/22.
//

import SwiftUI

struct MiniMedCardView: View {
    var body: some View {
        ZStack{
        RoundedRectangle(cornerRadius: 20, style: .continuous)
                .foregroundColor(CustomColor.medcardgray)
            .fixedSize(horizontal: false, vertical: false)
            .shadow(color: .gray, radius: 2, x: 0, y: 2)
        VStack(alignment: .center, spacing: 10){
            Image("pills").resizable().scaledToFit()
           
          
            Text("Ayrinal").font(.subheadline).fontWeight(.bold).textCase(.uppercase).foregroundColor(CustomColor.graytext)
                 }.padding()
        
    }

    }
}

struct MiniMedCardView_Previews: PreviewProvider {
    static var previews: some View {
        MiniMedCardView()
    }
}
