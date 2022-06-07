//
//  SingleMedView.swift
//  MedWaste
//
//  Created by Irene Fernando on 03/06/22.
//

import SwiftUI

struct SingleMedView: View {
    
    @State private var alertdonate = false
    @State private var alertexpire = false
    
    
    
    let data = (1...10).map { "Item \($0)" }
    @State var isPinned : Bool = false
    
    var body: some View {
        ScrollView {
        VStack(){
            Image("pills").resizable()
                .frame(width: 200, height: 200, alignment: .center).padding()
                .rotation3DEffect(.degrees(50), axis: (x: 0, y: 0, z: 1))
            Spacer()
            VStack(alignment: .leading, spacing: 5){
                HStack{
                    Text("Ayrinal").font(.title2).fontWeight(.bold).textCase(.uppercase)
                    Spacer()
                    Image(systemName: isPinned ? "heart.fill" : "heart").scaleEffect(1.5).foregroundColor(.pink).onTapGesture {
                        isPinned.toggle()
                    }
                }
                Text("20mg").font(.title3)
                Text("AYRINAL compresse contiene il principio attivo bilastina che è un antistaminico. AYRINAL 20 mg compresse viene utilizzato per alleviare i sintomi di febbre da fieno (starnuti , prurito, naso che cola, naso chiuso ed arrossamento e lacrimazione oculare) ed altre forme di rinite allergica.").multilineTextAlignment(.leading)
//                Divider()
                Spacer()
                HStack{
                    Text("Scatole").font(.title2).fontWeight(.bold)
                    Spacer()
                    NavigationLink(destination: NewItemView(), label: {Image(systemName: "plus.circle.fill").scaleEffect(1.5).foregroundColor(CustomColor.darkblue)})
                    
                }
            }.foregroundColor(CustomColor.graytext)
            
            
            List {
                ForEach (data ,id: \.self){item in
                
                
                    HStack{
                Text("Box 1")
                    Spacer()
                        Text("10/2022")
                    }.padding()
                    .swipeActions {
                        
                        Button{alertexpire.toggle()} label: {
                            Image(systemName: "trash.fill")
                        }
                        .tint(CustomColor.expiredred)

                        
                        Button{alertdonate.toggle()} label: {
                        
                            DonateIcon()
                             
                        
                        }
                        .tint(CustomColor.donnatedgreen)
                        
                    }
                }
            }
            .listRowBackground(CustomColor.redform)
            .listStyle(.inset)
            .frame(height: 200)
//
            
           
           
        }.padding(20)
           
        }
        
        .sheet(isPresented: $alertdonate, content: {AlertView(statethrow: false)})
            .sheet(isPresented: $alertexpire, content: {AlertView(statethrow: true)})
    }
}

struct SingleMedView_Previews: PreviewProvider {
    static var previews: some View {
        SingleMedView()
    }
}
