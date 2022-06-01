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
            ScrollView {
                VStack{
                    Text("All Medicines").fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 20)
                    
                    ZStack(alignment: .bottom) {
                        List(recognizedContent.items, id: \.id) { textItem in
                            NavigationLink(destination: TextPreviewView(text: textItem.text)) {
                                Text(String(textItem.text.prefix(50)).appending("..."))
                            }
                        }
                        
                        
                        if isRecognizing {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: Color(UIColor.systemIndigo)))
                                .padding(.bottom, 20)
                        }
                        
                    }
                    
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        
                        ForEach(data, id: \.self) { item in
                            NavigationLink(destination: SingleMedView(),label: { MedCardView()
                                .padding(5)})
                            
                        }
                    }
                }
            } //: ScrollView
            
            .navigationBarTitle("Cabinet", displayMode: .large)
            .navigationBarItems(trailing: HStack(spacing: 20){
                Button(action: { showMap = true }, label: { Image(systemName: "map.circle.fill").scaleEffect(1.5)})
                Button(action: {guard !isRecognizing else { return } ; showScanner = true }, label: { Image(systemName: "plus.circle.fill").foregroundColor(CustomColor.darkblue).scaleEffect(1.5)})
            })
            
        }  //:Navigation View
        .searchable(text: $searchQuery, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search for medicines")
        .sheet(isPresented: $showMap, content: {MapView()})
        .sheet(isPresented: $showScanner, content: {
            ScanView{ result in
                switch result{
                case .success(let scannedImages):
                    isRecognizing = true
                    RecognizeText(scannedImages: scannedImages, recognizedContent: recognizedContent){
                        isRecognizing = false
//                        showData = true
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
