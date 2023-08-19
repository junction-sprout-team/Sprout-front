//
//  MyForeignerView.swift
//  Junction
//
//  Created by Bokyung on 2023/08/19.
//

import SwiftUI

struct MyForeignerView: View {
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading, spacing: 0){
                Text("Dear Sprout,")
                Text("Awating Rides")
                
//                ForEach(tripData) { td in
//                    RectangleList2(departure: td.departure, destination: td.destination, date: td.date, memeberName: td.memeberName, maxMember: td.maxMember)
//                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 39)
        }
    }
}



@ViewBuilder
func RectangleList2(departure: String, destination: String, date: String, memeberName: String, maxMember: Int) -> some View {
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
                    Image(systemName: "person.fill")
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
                    NavigationLink {
                        // destination
                    } label: {
                        Text("Join")
                            .foregroundColor(.black)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 6)
                            .background(Color.yellow.cornerRadius(8))
                    }
                    
                } // HStack
            }
            .padding(EdgeInsets(top: 20, leading: 23, bottom: 14, trailing: 24))
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 113)
        .padding(.horizontal, 39)
}


struct MyForeignerView_Previews: PreviewProvider {
    static var previews: some View {
        MyForeignerView()
    }
}
