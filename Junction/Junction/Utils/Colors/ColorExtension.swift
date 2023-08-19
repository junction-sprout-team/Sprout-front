//
//  ColorExtension.swift
//  Junction
//
//  Created by Bokyung on 2023/08/19.
//

import SwiftUI

extension Color {
    // MARK: Black
    static let kakaoBlack100 = Color("kakaoBlack100")
    static let kakaoBlack200 = Color("kakaoBlack200")
    static let kakaoBlack300 = Color("kakaoBlack300")
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

