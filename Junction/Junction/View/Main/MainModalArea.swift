//
//  MainModalArea.swift
//  Junction
//
//  Created by Bokyung on 2023/08/20.
//

import SwiftUI

//(departure: String, destination: String, date: String, imageTitle: String, memberName: String, maxMember: Int, currentState: String, buttonColor: Color)

struct MainModalArea: View {
    @Environment(\.presentationMode) var presentationMode // 현재의 뷰를 제거(뒤로 가기)하기 위한 변수
    
    var departure: String
    var destination: String
    var date: String
    var imageTitle: String
    var memberName: String
    var maxMember: Int
    var currentState: String
    var buttonColor: Color
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0){
            Text("Make sure it's right!")
                .font(.pretendard(.medium, size: 28))
                .foregroundColor(.mainPrimary500)
                .padding(.bottom, 24)
            
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
                            Image(systemName: imageTitle)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 11)
                                .foregroundColor(Color(hex: 0x7FB6F5))
                                .padding(.trailing, 8)
                            Text(memberName)
                                .font(.pretendard(.medium, size: 12))
                                .foregroundColor(Color(hex: 0x7FB6F6))
                                .padding(.trailing, 4)
                            
                            Text("max\(maxMember)")
                                .font(.pretendard(.medium, size: 12))
                                .foregroundColor(Color(hex: 0xC33939))
                            Spacer()
                            
                        } // HStack
                    }
                    .padding(EdgeInsets(top: 20, leading: 23, bottom: 14, trailing: 24))
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 113)
                .padding(.bottom, 24)
            
            HStack (spacing: 0){
                Text("Make sure to appreciate your driving mate, ")
                    .font(.pretendard(.medium, size: 12))
                    .foregroundColor(.textLight400)
                Text("Busan!")
                    .font(.pretendard(.medium, size: 12))
                    .foregroundColor(.mainPrimary500)
            }
            Text("Enjoy your experience of sharing the ride in Busan.")
                .font(.pretendard(.medium, size: 12))
                .foregroundColor(.textLight400)
                .padding(.bottom, 24)
            
            Button {
                // action
                presentationMode.wrappedValue.dismiss() // 현재의 뷰를 제거(뒤로 가기)하기 위한 변수
            } label: {
                Text("Confirm")
                    .foregroundColor(.textDark500)
                    .padding(.vertical, 13)
                    .frame(maxWidth: .infinity)
                    .background(Color.mainPrimary500.cornerRadius(15))
            }

        }
        .padding(.horizontal, 39)
        .padding(.vertical, 52)
        //.border(.red)
    }
}

struct MainModalArea_Previews: PreviewProvider {
    static var previews: some View {
        MainModalArea(departure: "Busan Station", destination: "Seomyeon Station", date: "At August 20,  2023 (Sun) 15:30", imageTitle: "car.fill", memberName: "Sprout", maxMember: 3, currentState: "Give a Ride", buttonColor: .mainPoint500)
    }
}
