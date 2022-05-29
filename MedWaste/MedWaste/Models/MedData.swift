//
//  MedData.swift
//  MedWaste
//
//  Created by Irene Fernando on 29/05/22.
//

import Foundation


class MedData : Identifiable {
    var id: String
    var text : String = ""
    
//    init(){}
    init() {
        id = UUID().uuidString
    }
}



