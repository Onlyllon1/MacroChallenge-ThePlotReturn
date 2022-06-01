//
//  NewItemView.swift
//  MedWaste
//
//  Created by Irene Fernando on 23/05/22.
//
// This view is used for adding a new item to the cabinet.

import SwiftUI

struct NewItemView: View {
    
    @State var nome: String = ""
    @State var dosaggio: String = ""
    @State var tipologia: String = ""
    @State var prezzo: String = ""
    @State var unità: String = ""
    
    var body: some View {
        
        VStack {
            Form {
                Section {
                    HStack {
                        Text("Nome")
                        Spacer()
                        TextField("Nome", text: $nome)
                    }
                    HStack {
                        Text("Dosaggio")
                        Spacer()
                        TextField("Dosaggio", text: $dosaggio)
                    }
                    HStack {
                        Text("Tipogia")
                        Spacer()
                        TextField("Tipologia", text: $tipologia)
                    }
                    HStack {
                        Text("Prezzo")
                        Spacer()
                        TextField("Prezzo", text: $prezzo)
                    }
                    HStack {
                        Text("Unità")
                        Spacer()
                        TextField("Unità", text: $unità)
                    }
                }.foregroundColor(Color.init(red: 202/255, green: 230/255, blue: 247/255, opacity: 0))
            }
        }
        
        .navigationTitle("New Item")
        
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView()
            .previewDevice("iPhone 13 Pro Max")
    }
}
