//
//  MedData.swift
//  MedWaste
//
//  Created by Irene Fernando on 29/05/22.
//

import Foundation


class TextItem: Identifiable {
    var id: String
    var text: String = ""
    
    init() {
        id = UUID().uuidString
    }
}


class RecognizedContent: ObservableObject {
    @Published var items = [TextItem]()
}


