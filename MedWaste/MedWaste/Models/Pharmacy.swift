//
//  Pharmacy.swift
//  MedWaste
//
//  Created by Francesco on 31/05/22.
//

import Foundation
import MapKit

struct Pharmacy: Identifiable{
    
    let name : String
    let cityName : String
    let provincia : String
    let street : String
    let cap: Int
    let coordinates : CLLocationCoordinate2D
    let phone : String
    let donation : Bool
    let dispose : Bool
    
    
    var id : String {
        name+cityName
    }
    
    
}
