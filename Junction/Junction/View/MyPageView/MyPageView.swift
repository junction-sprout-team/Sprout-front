//
//  MyPageView.swift
//  Junction
//
//  Created by Bokyung on 2023/08/19.
//

import SwiftUI

struct MyPageView: View {
    var body: some View {
        HStack(spacing: 0){
            Text("MyPageView")
            //                    HStack (alignment: .center, spacing: 20) {
            //                        Text("Departure")
            //                            .font(.pretendard(.bold, size: 16))
            //                            .foregroundColor(Color(hex: 0x333333).opacity(0.4))
            //                        Spacer()
            //                        TextField("", text: $departure)
            //                            .frame(width: 152, height: 36)
            //                            .background(Color.clear)
            //                            .overlay(content: {
            //                                RoundedRectangle(cornerRadius: 10)
            //                                    .inset(by: 0.5)
            //                                    .stroke(.blue)
            //                            })
            //                    }.border(.blue) // Departure
            //
            //                    HStack (alignment: .center, spacing: 20) {
            //                        Text("Destination")
            //                            .font(.pretendard(.bold, size: 16))
            //                            .foregroundColor(Color(hex: 0x333333).opacity(0.4))
            //                        Spacer()
            //                        TextField("", text: $destination)
            //                            .frame(width: 152, height: 36)
            //                            .background(Color.clear)
            //                            .overlay(content: {
            //                                RoundedRectangle(cornerRadius: 10)
            //                                    .inset(by: 0.5)
            //                                    .stroke(.blue)
            //                            })
            //                    }.border(.blue) // Destination
        }
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
