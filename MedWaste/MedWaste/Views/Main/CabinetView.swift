//
//  CabinetView.swift
//  MedWaste
//
//  Created by Irene Fernando on 23/05/22.
//
// This view is the CabinetView the 2nd component of the Tab bar

import SwiftUI

struct CabinetView: View {
    @State var searchQuery = ""
    @State private var showScanner = false
    @State private var showMap = false
    
    let data = (1...10).map { "Item \($0)" }
    let columns = [
           GridItem(.flexible(minimum: 90)),
           GridItem(.flexible(minimum: 90))
       ]
    
    
    
    var body: some View {
        NavigationView{
    
       
        VStack{
//            Text("Searching for \(searchQuery)")
//                            .searchable(text: $searchQuery, prompt: "Search for medicines")
        ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(data, id: \.self) { item in
                            MedCardView()
                                .padding(5)
                        }
                    }
        }
//                    .padding(.horizontal)
        }
        .searchable(text: $searchQuery)
        .navigationTitle("Cabinet")
        .navigationBarItems(trailing:
                                HStack(spacing: 20){
            Button(action: { showMap = true }, label: { Image(systemName: "map.circle.fill").scaleEffect(1.5)})
            Button(action: {showScanner = true }, label: { Image(systemName: "plus.circle.fill").foregroundColor(CustomColor.darkblue).scaleEffect(1.5)})
        }
        )
    }
    }
}

//struct CabinetView_Previews: PreviewProvider {
//    static var previews: some View {
//        CabinetView()
//    }
//}
