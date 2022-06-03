//
//  TextPreviewView.swift
//  MedWaste
//
//  Created by Irene Fernando on 01/06/22.
//

import SwiftUI


        struct TextPreviewView: View {
            var text: String
            
            var body: some View {
                VStack {
                    ScrollView {
                        Text(text)
                            .font(.body)
                            .padding()
                    }
                }
            }
        }


//struct TextPreviewView_Previews: PreviewProvider {
//    static var previews: some View {
//        TextPreviewView()
//    }
//}
