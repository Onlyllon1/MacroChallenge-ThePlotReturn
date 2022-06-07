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
    static let expiredred = Color("ExpiredRed")
    static let donnatedgreen = Color("DonatedGreen")
}



class Theme {
    static func navigationBarColors( titleColor : UIColor? = nil ){
        
        let navigationAppearance = UINavigationBarAppearance()
        navigationAppearance.titleTextAttributes = [.foregroundColor: titleColor ?? .black]
    }
}
        








//  EXTRA ARGUMENTS FOR THE TITLE BAR THEME
//        background : UIColor?,
//       , tintColor : UIColor? = nil
        
//        navigationAppearance.configureWithOpaqueBackground()
//        navigationAppearance.backgroundColor = background ?? .clear
        
        
//        navigationAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor ?? CustomColor.darkblue]
//
//        UINavigationBar.appearance().standardAppearance = navigationAppearance
//        UINavigationBar.appearance().compactAppearance = navigationAppearance
//        UINavigationBar.appearance().scrollEdgeAppearance = navigationAppearance
//
////        UINavigationBar.appearance().tintColor = tintColor ?? titleColor ?? .black

