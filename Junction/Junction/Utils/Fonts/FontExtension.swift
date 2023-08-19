//
//  FontExtension.swift
//  Junction
//
//  Created by Bokyung on 2023/08/19.
//


import SwiftUI

extension Font {
    // MARK: Pretendard
    enum Pretendard {
        case black
        case bold
        case extrabold
        case extralight
        case light
        case medium
        case regular
        case semibold
        case thin
        case custom(String)
        
        var value: String {
            switch self {
            case .black:
                return "Pretendard-Black"
            case .bold:
                return "Pretendard-Bold"
            case .extrabold:
                return "Pretendard-ExtraBold"
            case .extralight:
                return "Pretendard-ExtraLight"
            case .light:
                return "Pretendard-Light"
            case .medium:
                return "Pretendard-Medium"
            case .regular:
                return "Pretendard-Regular"
            case .semibold:
                return "Pretendard-SemiBold"
            case .thin:
                return "Pretendard-Thin"
            case .custom(let name):
                return name
            }
        } // return String
    } // enum
    
    static func pretendard(_ type: Pretendard, size: CGFloat = 18) -> Font {
        return .custom(type.value, size: size)
    }
}

