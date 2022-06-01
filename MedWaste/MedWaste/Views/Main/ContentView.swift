//
//  ContentView.swift
//  MedWaste
//
//  Created by Francesco on 23/05/22.
//
// The Main View

import SwiftUI

struct ContentView: View {
    @StateObject private var store = MedicineStore()
    
    init(){
        Theme.navigationBarColors( titleColor: UIColor(CustomColor.darkblue))
        }

    var body: some View {
            TabView(){
                SummaryView()
                    .tabItem {Label("Riepilogo", systemImage: "square.grid.2x2.fill")}

                CabinetView()
                    .tabItem {Label("Armadietto", systemImage: "heart.text.square.fill")}
                    .onAppear {
                                    MedicineStore.load { result in
                                        switch result {
                                        case .failure(let error):
                                            fatalError(error.localizedDescription)
                                        case .success(let medicines):
                                            store.items = medicines
                                        }
                                    }
                                }

                StatisticsView()
                    .tabItem {Label("Statistiche", systemImage: "chart.pie.fill")}

            }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 13 Pro Max")
    }
}
