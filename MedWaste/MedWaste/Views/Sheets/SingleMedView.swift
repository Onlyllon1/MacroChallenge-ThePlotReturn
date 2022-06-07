//
//  SingleMedView.swift
//  MedWaste
//
//  Created by Irene Fernando on 03/06/22.
//

import SwiftUI

struct SingleMedView: View {
    
    var nome: String
    var dosaggio: String
    var tipologia: String
    var unità: Int
    var categoria :String
    
    var medicineViewModel: MedicineViewModel
    var boxViewModel: BoxViewModel
    
    
    @State private var alertdonate = false
    @State private var alertexpire = false
    @State var isPinned : Bool = false
    
    var body: some View {
        
        ScrollView {
            
            VStack(){
                
                Image("pills").resizable()
                    .frame(width: 200, height: 200, alignment: .center).padding()
                    .rotation3DEffect(.degrees(50), axis: (x: 0, y: 0, z: 1))
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 5){
                    HStack{
                        Text(nome).font(.title2).fontWeight(.bold).textCase(.uppercase)
                        Spacer()
                        Image(systemName: isPinned ? "heart.fill" : "heart").scaleEffect(1.5).foregroundColor(.pink).onTapGesture {
                            isPinned.toggle()
                        }
                    }
                    Text(dosaggio).font(.title3)
                    Text("AYRINAL compresse contiene il principio attivo bilastina che è un antistaminico. AYRINAL 20 mg compresse viene utilizzato per alleviare i sintomi di febbre da fieno (starnuti , prurito, naso che cola, naso chiuso ed arrossamento e lacrimazione oculare) ed altre forme di rinite allergica.").multilineTextAlignment(.leading)
                    //                Divider()
                    Spacer()
                    HStack{
                        Text("Scatole").font(.title2).fontWeight(.bold)
                        Spacer()
                        NavigationLink(destination: NewItemView(medicineViewModel: medicineViewModel, boxViewModel: boxViewModel), label: {Image(systemName: "plus.circle.fill").scaleEffect(1.5).foregroundColor(CustomColor.darkblue)})
                        
                    }
                }
                //            .foregroundColor(CustomColor.graytext)
                
                
                List {
                    ForEach (boxViewModel.filterBoxesForMedicine(medicine: nome)) { box in
                        
                        
                        HStack{
                            Text("Box")
                            Spacer()
                            Text("\(box.expirationDate)")
                        }.padding()
                            .swipeActions {
                                
                                Button{alertexpire.toggle()} label: {
                                    Image(systemName: "trash.fill")
                                }
                                .tint(.red)
                                
                                
                                Button{alertdonate.toggle()} label: {
                                    
                                    //                            DonateIcon()
                                    Image(systemName: "hand.raised.fill")
                                    
                                    
                                }
                                .tint(.green)
                                
                            }
                    }
                }
                .listStyle(.inset)
                .frame(height: 200)
                //
                
                
                
            }.padding(20)
            
        }
        
        //        .sheet(isPresented: $alertdonate, content: {AlertView(statethrow: false)})
        //            .sheet(isPresented: $alertexpire, content: {AlertView(statethrow: true)})
    }
}

//struct SingleMedView_Previews: PreviewProvider {
//    static var previews: some View {
//        SingleMedView()
//    }
//}
