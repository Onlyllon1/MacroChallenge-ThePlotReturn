//
//  CustomColors.swift
//  MedWaste
//
//  Created by Irene Fernando on 23/05/22.
//

import Foundation
import SwiftUI


struct CustomColor {
    static let darkblue = Color("DarkBlue")
    static let medcardgray = Color("MedCardGray")
    static let graytext = Color("GreyText")
}



class Theme {
    static func navigationBarColors(
//        background : UIColor?,
       titleColor : UIColor? = nil
//       , tintColor : UIColor? = nil
    ){
        
        let navigationAppearance = UINavigationBarAppearance()
//        navigationAppearance.configureWithOpaqueBackground()
//        navigationAppearance.backgroundColor = background ?? .clear
        
        navigationAppearance.titleTextAttributes = [.foregroundColor: titleColor ?? CustomColor.darkblue]
//        navigationAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor ?? CustomColor.darkblue]
       
//        UINavigationBar.appearance().standardAppearance = navigationAppearance
//        UINavigationBar.appearance().compactAppearance = navigationAppearance
//        UINavigationBar.appearance().scrollEdgeAppearance = navigationAppearance

//        UINavigationBar.appearance().tintColor = tintColor ?? titleColor ?? .black
    }
}
