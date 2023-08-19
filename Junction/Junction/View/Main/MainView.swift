//
//  MainView.swift
//  Junction
//
//  Created by Bokyung on 2023/08/19.
//

import SwiftUI

struct MainView: View {
    
    @State var shareOption: Int = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image("ImagBackground")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .offset(y: 40)
            VStack (alignment: .leading, spacing: 0){
                HStack (spacing: 0){
                    Text("Catch your Car")
                    Spacer()
                    NavigationLink {
                        // destination
                        RegisterRideView()
                    } label: {
                        Image(systemName: "pencil")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20)
                            .foregroundColor(.black)
                    }
                    .padding(.horizontal, 10)
                    
                    NavigationLink {
                        // destination
                        
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20)
                            .foregroundColor(.black)
                    }
                } // HStack
                .padding(.horizontal, 28)
                    .padding(.top, 28)
                    .padding(.bottom, 47)
                
                // MARK: 화면 상단 중앙의 Text
                VStack (alignment: .leading, spacing: 0) {
                    Text("Dear Sprout, ")
                        .foregroundColor(Color(hex: 0x333333).opacity(0.4))
                        .font(.pretendard(.bold, size: 16))
                        .padding(.bottom, 8)
                    
                    Text("Shall we go to make foriegn friends?")
                        .multilineTextAlignment(.leading)
                        .font(.pretendard(.medium, size: 28))
                        .foregroundColor(Color(hex: 0x7fb6f6))
                        .padding(.bottom, 90)
                }
                .padding(.leading, 32)
                
                ScrollView {
                    RadioButtonGroup(items: ["All", "Only join", "Only Suggestion"], selectedId: "All") { selected in
                        print("Selected is: \(selected)")
                    }
                    
                    ForEach(tripData) { td in
                        RectangleList(departure: td.departure, destination: td.destination, date: td.date, imageTitle: td.imageTitle, memeberName: td.memeberName, maxMember: td.maxMember, currentState: td.currentState, buttonColor: td.buttonColor)
                    }
                    
                } // VStack
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}


@ViewBuilder
func RectangleList(departure: String, destination: String, date: String, imageTitle: String, memeberName: String, maxMember: Int, currentState: String, buttonColor: Color) -> some View {
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
                        Text(currentState)
                            .foregroundColor(buttonColor == .mainSub2500 ? Color.white :  Color.black)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 6)
                            .background(buttonColor.cornerRadius(8))
                    }
                    
                } // HStack
            }
            .padding(EdgeInsets(top: 20, leading: 23, bottom: 14, trailing: 24))
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 113)
        .padding(.horizontal, 39)
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MainView()
        }
    }
}
