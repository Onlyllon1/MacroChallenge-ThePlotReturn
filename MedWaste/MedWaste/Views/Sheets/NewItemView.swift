//
//  NewItemView.swift
//  MedWaste
//
//  Created by Irene Fernando on 23/05/22.
//
// This view is used for adding a new item to the cabinet.

import SwiftUI

struct NewItemView: View {
//     var recognizedContent = RecognizedContent()
    @ObservedObject var recognizedContent = RecognizedContent()
//var name : String
    var body: some View {
        VStack(alignment: .leading) {
            
            List(recognizedContent.items, id: \.id) { textItem in
                NavigationLink(destination: TextPreviewView(text: textItem.text)) {
                    Text(String(textItem.text.prefix(50)).appending("..."))
                }
            }
            
            
            Text("New Item....")
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
