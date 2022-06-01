//
//  MedData.swift
//  MedWaste
//
//

import Foundation
import SwiftUI



struct MedData: Identifiable, Codable {

    let id: UUID
    var name :String
    var dosage :String
    var type :String
    var price :String
    var units :Int
    var category :String
    var box :[MedBox] = []
    
    init(id :UUID = UUID(), name :String, dosage :String, type :String, price :String, units :Int, category :String, box :[MedBox] = []) {
        self.name = name
        self.dosage = dosage
        self.type = type
        self.price = price
        self.units = units
        self.category = category
    }

}

extension MedData {
    
    struct Data {
        var name :String
        var dosage :String
        var type :String
        var price :String
        var units :Int
        var category :String
        var box :[MedBox] = []
    
       }
    
    var data: Data {
        Data(name: name, dosage: dosage, type: type, price: price, units: units, category: category, box: box)
    }
    
    mutating func update(from data: Data) {
        name = data.name
        dosage = data.dosage
        type = data.type
        price = data.price
        units = data.units
        category = data.category
        box = data.box
    }
    
    init(data: Data) {
        
        name = data.name
        dosage = data.dosage
        type = data.type
        price = data.price
        units = data.units
        category = data.category
        box = data.box
    }
    
}

extension MedData {
    
    static let sampleData: [MedData] =
    [
        MedData(name: "Tachipirina", dosage: "100 mg", type: "compresse", price: "9,00 €",  units: 30, category: "antivirale", box: [MedBox(expirationDate: "10/12/2024", state: .usable)]),
        MedData(name: "Ayrinal", dosage: "100 mg", type: "compresse", price: "10,90 €",  units: 30, category: "antivirale", box: [MedBox(expirationDate: "10/12/2024", state: .usable)])

    ]
}


