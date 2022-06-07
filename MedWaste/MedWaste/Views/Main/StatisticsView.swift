//
//  StatisticsView.swift
//  MedWaste
//
//  Created by Irene Fernando on 23/05/22.
//
// This view is the StatisticsView the 3rd component of the Tab bar


import SwiftUI

struct StatisticsView: View {
//    @Binding var status : String
   
    var body: some View {
        NavigationView{
            
//                card per le informzoni
            VStack{
            CircleStatistic()
//                    .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight/2.5, alignment: .top)
                
            ScrollView{
                VStack (spacing:0){
                    StatCardView(Status: "donated")
                    StatCardView(Status: "total")
                    StatCardView(Status: "expired")
                }

               
            } //scrool view
            .frame(maxWidth: UIScreen.screenWidth, maxHeight: UIScreen.screenHeight/2)
                
            
        }
                .navigationTitle("Statistics")
                }
 
    }
}

//
//struct StatisticsView_Previews: PreviewProvider {
//    static var previews: some View {
//        StatisticsView()
//    }
//}
