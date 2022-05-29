//
//  NewItemView.swift
//  MedWaste
//
//  Created by Irene Fernando on 23/05/22.
//
// This view is used for adding a new item to the cabinet.

import SwiftUI

struct NewItemView: View {
    @ObservedObject var recognizedContent = RecognizedContent()
//var name : String
    var body: some View {
        ZStack(alignment: .bottom) {
            List(recognizedContent.items, id: \.id) { textItem in
                
                    Text(String(textItem.text.prefix(50)).appending("..."))
                
            }
        }
        
//        HStack{
//        VStack(alignment: .leading, spacing: 10){
//            Text("Name")
//            Text("Dosage")
//            Text("Type")
//            Text("Price")
//        }
//            VStack(alignment: .leading, spacing: 10){
//                Text("Name")
//                Text("Dosage")
//                Text("Type")
//                Text("Price")
//            }
////            TextField("Name", text: name)
//        }
        .navigationTitle("New Item")
        
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView()
            .previewDevice("iPhone 13 Pro Max")
    }
}
