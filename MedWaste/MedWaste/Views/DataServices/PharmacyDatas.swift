//
//  PharmacyDatas.swift
//  MedWaste
//
//  Created by Francesco on 31/05/22.
//

import Foundation
import CoreLocation

class PharmacysDataServices {
    static let pharmacys : [Pharmacy] = [
//        Pharmacy(name: "Farmacia Cormons", cityName: "Portici", street: "Via Diaz, 55", coordinates: CLLocationCoordinate2D(latitude: 40.8198146838057, longitude: 14.336731855509914)),
//        Pharmacy(name: "Farmacia Diaz", cityName: "Portici", street: "Via Diaz, 7", coordinates: CLLocationCoordinate2D(latitude: 40.818931118960506, longitude: 14.333173666595616))
        Pharmacy(
         name: "Farmacia Cormons",
         cityName: "Portici",
         provincia: "Via Diaz, 55",
         street: "Via Diaz, 55",
         cap: 8055,
         coordinates: CLLocationCoordinate2D(latitude: 40.8198146838057, longitude: 14.336731855509914),
         phone: "081000000",
         donation: false,
         dispose: true)
    ]
}
