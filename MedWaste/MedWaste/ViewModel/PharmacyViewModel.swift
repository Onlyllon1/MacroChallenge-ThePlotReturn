//
//  MapViewModel.swift
//  MedWaste
//
//  Created by Francesco on 31/05/22.
//

import Foundation

class PharmacyViewModel : ObservableObject {
    @Published var pharmacies : [Pharmacy]
    
    init() {
        let pharmacies = PharmacysDataServices.pharmacys
        self.pharmacies = pharmacies
    }
}
