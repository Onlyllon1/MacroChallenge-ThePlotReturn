//
//  SummaryView.swift
//  MedWaste
//
//  Created by Irene Fernando on 23/05/22.
//
// This view is the SummaryView the 1st component of the Tab bar


import SwiftUI

struct SummaryView: View {
    let data = (1...10).map { "Item \($0)" }
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    Text("Pinned").font(.title3).fontWeight(.bold).frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 20)
                    ScrollView(.horizontal){
                        HStack(spacing: 5 ){
                            ForEach(data, id: \.self) { item in
                                MiniMedCardView()
                                    .padding(5)
                            }
                        }
                    }.frame(height: 200)
                    Text("Expired").font(.title3).fontWeight(.bold).frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 20)
                    ScrollView(.horizontal){
                        HStack(spacing: 5 ){
                            ForEach(data, id: \.self) { item in
                                MiniMedCardView()
                                    .padding(5)
                            }
                        }
                    }.frame(height: 200)
                    Text("Facts").font(.title3).fontWeight(.bold).frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 20)
                    ScrollView(.horizontal){
                        HStack( ){
                            ForEach(data, id: \.self) { item in
                                FactsCardView().frame(width: 350)
                                
                            }
                        }
                    }
                    
                }.navigationTitle("Summary")
            }
        }
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
    }
}
