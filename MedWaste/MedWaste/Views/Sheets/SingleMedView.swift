//
//  SingleMedView.swift
//  MedWaste
//
//  Created by Irene Fernando on 31/05/22.
//
// This view is used for adding a new item to the cabinet.

import SwiftUI

struct SingleMedView: View {
    
    let data = (1...10).map { "Item \($0)" }
    
    var body: some View {
        VStack(){
            Image("pills").resizable().scaledToFit()
                .frame(width: 300, height: 300, alignment: .center)
            Divider()
            Spacer()
            VStack(alignment: .leading, spacing: 5){
                HStack{
                    Text("Ayrinal").font(.title2).fontWeight(.bold).textCase(.uppercase)
                    Spacer()
                    Image(systemName: "heart.fill").scaleEffect(1.5).foregroundColor(.pink)
                }
                Text("20mg").font(.title3)
                Text("AYRINAL tablets contain the active ingredient bilastine which is an antihistamine. AYRINAL 20 mg tablets are used to relieve the symptoms of hay fever (sneezing, itching, runny nose, stuffy nose and red and watery eyes) and other forms of allergic rhinitis.")
                Divider()
                Spacer()
                HStack{
                    Text("All the Boxes").font(.title2).fontWeight(.bold).textCase(.uppercase)
                    Spacer()
                    Image(systemName: "plus.circle.fill").scaleEffect(1.5).foregroundColor(CustomColor.darkblue)
                }
            }.foregroundColor(CustomColor.graytext)
            
            ScrollView{
            ForEach (data ,id: \.self){item in
                RoundedRectangle(cornerRadius: 20).foregroundColor(CustomColor.graytext).frame( height: 60, alignment: .center).overlay(Text("Box " + "1").foregroundColor(.white))
                
            }
            }
            
            
        }.padding(20)
    }
}

struct SingleMedView_Previews: PreviewProvider {
    static var previews: some View {
        SingleMedView()
    }
}
