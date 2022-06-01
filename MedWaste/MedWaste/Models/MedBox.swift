//
//  Box.swift
//  MedWaste
//
//  Created by Jasmine Aufiero on 31/05/22.
//

import Foundation

struct MedBox :Identifiable, Codable {
    
    enum MedState { // force the box to have only three possible states
        case expired, donated, usable
    }
    
    let id: UUID = UUID()
    var expirationDate :String
    var state :MedState
}

