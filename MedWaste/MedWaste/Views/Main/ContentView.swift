//
//  ContentView.swift
//  MedWaste
//
//  Created by Francesco on 23/05/22.
//
// The Main View

import SwiftUI

struct ContentView: View {
    
    @State var tabSelection: Tabs = .tab1
    @State public var tex = "d"
    
    @State private var showScanner = false
    @State private var showMap = false
    @State private var isRecognizing = false
    
    
    
    enum Tabs{ case tab1, tab2, tab3 }
    
    func returnNaviBarTitle(tabSelection: Tabs) -> String{
        switch tabSelection{
            case .tab1: return "Riepilogo"
            case .tab2: return "Armadietto"
            case .tab3: return "Statistiche"
        }
    }
    
    var body: some View {
//        NavigationView{
            TabView(selection: $tabSelection){
                SummaryView()
                    .tabItem {Label("Riepilogo", systemImage: "square.grid.2x2.fill")}
//                    .tag(Tabs.tab1)
                CabinetView()
                    .tabItem {Label("Armadietto", systemImage: "heart.text.square.fill")}
//                    .tag(Tabs.tab2)
                StatisticsView()
                    .tabItem {Label("Statistiche", systemImage: "chart.pie.fill")}
//                    .tag(Tabs.tab3)
            }
//            .navigationBarHidden(true)
//            .navigationBarTitle("")
//                    .navigationBarHidden(true)
//            .navigationBarTitle(returnNaviBarTitle(tabSelection: self.tabSelection))
//            .navigationBarItems(trailing:
//                                    HStack(spacing: 20){
//                Button(action: { showMap = true }, label: { Image(systemName: "map.circle.fill").scaleEffect(1.5)})
//                Button(action: {showScanner = true }, label: { Image(systemName: "plus.circle.fill").foregroundColor(CustomColor.darkblue).scaleEffect(1.5)})
//            }
//            )

            
//        }
//        .sheet(isPresented: $showMap, content: {MapView()})
//            .sheet(isPresented: $showScanner, content: {NewItemView()})
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 13 Pro Max")
    }
}
