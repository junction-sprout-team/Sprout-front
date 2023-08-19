//
//  RectangleListArea.swift
//  Junction
//
//  Created by Bokyung on 2023/08/20.
//

import SwiftUI

struct RectangleListArea: View {
    var departure: String
    var destination: String
    var date: String
    var imageTitle: String
    var memeberName: String
    var maxMember: Int
    var currentState: String
    var buttonColor: Color
    
    @Binding var isModal: Bool // 모달을 띄울지 말지
    
    var body: some View {
        Rectangle()
            .foregroundColor(.white)
            .cornerRadius(10)
            .shadow(color: Color(hex: 0x333333).opacity(0.3), radius: 6, x: 4, y: 4)
            .overlay(alignment: .topLeading) {
                VStack (alignment: .leading, spacing: 0){
                    Text("\(departure) -> \(destination)")
                        .font(.pretendard(.light, size: 16))
                        .padding(.bottom, 8)
                    Text(date)
                        .font(.pretendard(.light, size: 12))
                        .padding(.bottom, 10)
                    HStack (alignment: .center, spacing: 0){
                        //Image(systemName: currentState == "Take the ride" ? "person.fill" : "car.fill")
                        Image(systemName: imageTitle)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 11)
                            .foregroundColor(Color(hex: 0x7FB6F5))
                            .padding(.trailing, 8)
                        Text(memeberName)
                            .font(.pretendard(.medium, size: 12))
                            .foregroundColor(Color(hex: 0x7FB6F6))
                            .padding(.trailing, 4)
                        
                        Text("max\(maxMember)")
                            .font(.pretendard(.medium, size: 12))
                            .foregroundColor(Color(hex: 0xC33939))
                        Spacer()
                        
                        Button {
                            // action
                            isModal = true
                        } label: {
                            Text(currentState)
                                .foregroundColor(buttonColor == .mainPoint500 ? .black : .white)
                                //.foregroundColor(currentState == "Take the ride" ? Color.white :  Color.black)
                                .padding(.horizontal, 15)
                                .padding(.vertical, 6)
                                .background(currentState == "Take the ride" ? Color.mainSub2500.cornerRadius(8) : Color.mainPoint500.cornerRadius(8))
                        }
                    } // HStack
                }
                .padding(EdgeInsets(top: 20, leading: 23, bottom: 14, trailing: 24))
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: 113)
            .padding(.horizontal, 39)
    }
}

//struct RectangleListArea_Previews: PreviewProvider {
//    static var previews: some View {
//        RectangleListArea()
//    }
//}
