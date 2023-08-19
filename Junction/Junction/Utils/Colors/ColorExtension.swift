//
//  ColorExtension.swift
//  Junction
//
//  Created by Bokyung on 2023/08/19.
//

import SwiftUI

extension Color {
    // MARK: Main
    static let mainImport500 = Color("mainImport500")
    static let mainPoint500 = Color("mainPoint500")
    static let mainPrimary500 = Color("mainPrimary500")
    static let mainSub1500 = Color("mainSub1500")
    static let mainSub2500 = Color("mainSub2500")
    
    // MARK: System
    static let systemBlack = Color("systemBlack")
    static let systemGray1 = Color("systemGray1")
    static let systemGray2 = Color("systemGray2")
    static let systemGray3 = Color("systemGray3")

    // MARK: Text
    static let textColorImport = Color("textColorImport")
    static let textColorPrimary = Color("textColorPrimary")
    static let textDark300 = Color("textDark300")
    static let textDark400 = Color("textDark400")
    static let textDark500 = Color("textDark500")
    static let textLight100 = Color("textLight100")
    static let textLight200 = Color("textLight200")
    static let textLight300 = Color("textLight300")
    static let textLight400 = Color("textLight400")
    static let textLight500 = Color("textLight500")
}


// hex 코드를 사용하기 위한 Color Extension -> 사용법: Color(.hex(#000000))
extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}

