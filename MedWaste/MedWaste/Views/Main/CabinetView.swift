//
//  CabinetView.swift
//  MedWaste
//
//  Created by Irene Fernando on 23/05/22.
//
// This view is the CabinetView the 2nd component of the Tab bar

import SwiftUI

struct CabinetView: View {
    @State var searchQuery = ""
    @State private var showScanner = false
    @State private var showMap = false
    @State private var showData = false
    @State private var isRecognizing = false
    @ObservedObject var recognizedContent = RecognizedContent()
    
    let data = (1...10).map { "Item \($0)" }
    let columns = [
        GridItem(.flexible(minimum: 90)),
        GridItem(.flexible(minimum: 90))
    ]
    
    
    
    var body: some View {
        NavigationView{
            VStack{
                Text("All Medicines").fontWeight(.bold)
                    .searchable(text: $searchQuery, prompt: "Search for medicines").frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 20)
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(data, id: \.self) { item in
                            MedCardView()
                                .padding(5)
                        }
                    }
                }
            }
            
            .navigationTitle("Cabinet")
            .navigationBarItems(trailing:
                                    HStack(spacing: 20){
                Button(action: { showMap = true }, label: { Image(systemName: "map.circle.fill").scaleEffect(1.5)})
                Button(action: {guard !isRecognizing else { return }
                    showScanner = true }, label: { Image(systemName: "plus.circle.fill").foregroundColor(CustomColor.darkblue).scaleEffect(1.5)})
            }
            )
        }.sheet(isPresented: $showMap, content: {MapView()})
            .sheet(isPresented: $showScanner, content: {
                ScanView{ result in
                    switch result{
                    case .success(let scannedImages):
                        isRecognizing = true
                        RecognizeText(scannedImages: scannedImages, recognizedContent: recognizedContent){
                            isRecognizing = false
                            showData = true
                        }.recognizeText()
                        
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                    showScanner = false
                } didCancelScanning: {showScanner = false}
                
            })
            .sheet(isPresented: $showData, content: {NewItemView()})
    }
}

//struct CabinetView_Previews: PreviewProvider {
//    static var previews: some View {
//        CabinetView()
//    }
//}
