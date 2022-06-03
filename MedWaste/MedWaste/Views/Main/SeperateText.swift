//
//  SeperateText.swift
//  MedWaste
//
//  Created by Irene Fernando on 01/06/22.
//

import Foundation


struct SeperateText{

//    var tex: String
let text = "A Lorem 2900mg @!ipsum!@ dolor sit 56555 amet, @!consectetur!@ adipiscing compresse elitml."
//    let text = "  1/2/2021   "


//    let nameMed =
let dosage = "(\\w+(mg|ml))"
//    let dateEx =
let type = "(\\wcompresse)"
//    let price =
//    let units = "(\\[0–9]{2})"
//    let units = "(\p{Ll})"



    func Patterns(tex: String ) -> [String] {
//        let regex = try! NSRegularExpression(pattern: pattern,  options: [])
//        let matches = regex.matches(in: text, options: [], range: NSRange(location: 0, length: text.count))
    let regex2 = try! NSRegularExpression(pattern:  dosage, options: [])
    let matches2 = regex2.matches(in: tex, options: [], range: NSRange(location: 0, length: text.count))
//        let array = matches.map({(text as NSString).substring(with: $0.range(at: 1))})
    let array2 = matches2.map({(text as NSString).substring(with: $0.range(at: 1))})
    return array2
}

}
