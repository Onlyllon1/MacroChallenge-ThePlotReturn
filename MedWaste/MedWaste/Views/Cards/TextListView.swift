//
//  TextListView.swift
//  MedWaste
//
//  Created by Irene Fernando on 30/05/22.
//

import SwiftUI

struct TextListView: View {
    var body: some View {
        VStack{
            Text("Name: ")
            Text("Dosage: ")
            Text("Type: ")
            Text("Price: ")
            Text("Units: ")
        }
    }
}

struct TextListView_Previews: PreviewProvider {
    static var previews: some View {
        TextListView()
    }
}
