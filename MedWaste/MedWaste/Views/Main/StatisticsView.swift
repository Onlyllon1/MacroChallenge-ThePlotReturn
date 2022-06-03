//
//  StatisticsView.swift
//  MedWaste
//
//  Created by Irene Fernando on 23/05/22.
//
// This view is the StatisticsView the 3rd component of the Tab bar


import SwiftUI

//struct StatisticsView: View {
//    var body: some View {
//        NavigationView{
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//                .navigationTitle("Statistics")
//        }
//   }
//}
//
//struct StatisticsView_Previews: PreviewProvider {
//    static var previews: some View {
//        StatisticsView()
//    }
//}



import SwiftUI

struct StatisticsView: View {
    @ObservedObject var recognizedContent = RecognizedContent()
    @State private var showScanner = false
    @State private var showData = false
    @State private var isRecognizing = false
    
    let textt = "ghd hgu jhgh 200ml guf huh"
    
    var body: some View {
        NavigationView {
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
            .navigationTitle("Text Scanner")
            .navigationBarItems(trailing: Button(action: {
                guard !isRecognizing else { return }
                showScanner = true
            }, label: {
                HStack {
                    Image(systemName: "doc.text.viewfinder")
                        .renderingMode(.template)
                        .foregroundColor(.white)
                    
                    Text("Scan")
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 16)
                .frame(height: 36)
                .background(Color(UIColor.systemIndigo))
                .cornerRadius(18)
            }))
        }
        
        .sheet(isPresented: $showScanner, content: {
            ScannerView { result in
                switch result {
                    case .success(let scannedImages):
                        isRecognizing = true
                        showData = true
                        TextRecognition(scannedImages: scannedImages,
                                        recognizedContent: recognizedContent) {
                            // Text recognition is finished, hide the progress indicator.
                           
                            isRecognizing = false
                            SeperateText().Patterns(tex: textt)
                            
                        }
                        .recognizeText()
                        
                    case .failure(let error):
                        print(error.localizedDescription)
                }
                
                showScanner = false
                
            } didCancelScanning: {
                // Dismiss the scanner controller and the sheet.
                showScanner = false
            }
        })
        .sheet(isPresented: $showData, content: {NewItemView()})
    }
}


