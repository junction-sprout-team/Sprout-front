//
//  MainViewComponent.swift
//  Junction
//
//  Created by Bokyung on 2023/08/19.
//

import SwiftUI

// MARk: MainView에서 쓰이는 radio button을 구현
struct ColorInvert: ViewModifier {
    
    @Environment(\.colorScheme) var colorScheme
    
    func body(content: Content) -> some View {
        Group {
            if colorScheme == .dark {
                content.colorInvert()
            } else {
                content
            }
        }
    }
}

struct RadioButton: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    let id: String
    let callback: (String)->()
    let selectedID : String
    let size: CGFloat
    let color: Color
    let textSize: CGFloat
    
    init(
        _ id: String,
        callback: @escaping (String)->(),
        selectedID: String,
        size: CGFloat = 20,
        color: Color = Color.primary,
        textSize: CGFloat = 14
    ) {
        self.id = id
        self.size = size
        self.color = color
        self.textSize = textSize
        self.selectedID = selectedID
        self.callback = callback
    }
    
    var body: some View {
        Button(action:{
            self.callback(self.id)
        }) {
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: self.selectedID == self.id ? "largecircle.fill.circle" : "circle")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: self.size, height: self.size)
                    .foregroundColor(.blue)
                    .background(Color(hex: 0xffffff).opacity(0.5))
                    .modifier(ColorInvert())
                    .cornerRadius(20)
                Text(id)
                    .font(.pretendard(.regular, size: 13))
                    .foregroundColor(.black)
                //Spacer()
            }.foregroundColor(self.color)
        }
        .foregroundColor(self.color)
    }
}


struct RadioButtonGroup: View {
    
    let items : [String]
    
    @State var selectedId: String = ""
    
    let callback: (String) -> ()
    
    var body: some View {
        HStack (spacing: 28){
            ForEach(0..<items.count) { index in
                RadioButton(self.items[index], callback: self.radioGroupCallback, selectedID: self.selectedId)
            }
        }
    }
    
    func radioGroupCallback(id: String) {
        selectedId = id
        callback(id)
    }
}

