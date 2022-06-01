//
//  hgd.swift
//  MedWaste
//
//  Created by Irene Fernando on 31/05/22.
//

import SwiftUI

struct hgd: View {
    @State var searchText = ""
    var body: some View {
        
            NavigationView {
                ZStack {
                    Rectangle()
                        .fill(Color.white)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 1)
                    
                    List {
                        Text("Search Bar")
                    }
                }
                .searchable(text: $searchText, placement:.navigationBarDrawer(displayMode: .always))
                
                .navigationBarTitle("Search", displayMode: .large)
            }
        }
        
        
        
        
    
}

struct hgd_Previews: PreviewProvider {
    static var previews: some View {
        hgd()
    }
}
