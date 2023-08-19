//
//  MainView.swift
//  Junction
//
//  Created by Bokyung on 2023/08/19.
//

import SwiftUI

struct MainView: View {
    @State var pickedDate: Date = Date()
    @State var departure: String = ""
    @State var destination: String = ""
    @State var shareOption: Int = 0
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0){
            HStack (spacing: 0){
                Text("Catch your Car")
                Spacer()
                NavigationLink {
                    // destination
                } label: {
                    Image(systemName: "list.bullet")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20)
                        .foregroundColor(.black)
                }
            }.padding(.horizontal, 28)
                .padding(.top, 28)
                .padding(.bottom, 47)
            
            // MARK: 화면 상단 중앙의 Text
            VStack (alignment: .leading, spacing: 0) {
                Text("Dear Sprout, ")
                    .foregroundColor(Color(hex: 0x333333).opacity(0.4))
                    .font(.pretendard(.bold, size: 16))
                    .padding(.bottom, 8)
                    .border(.blue)
                
                Text("Shall we go to make foriegn friends?")
                    .multilineTextAlignment(.leading)
                    .font(.pretendard(.medium, size: 28))
                    .foregroundColor(Color(hex: 0x7fb6f6))
                    .padding(.bottom, 121.5)
                    .border(.blue)
                
                
                
            }
            .border(.red)
            //                    .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 32)
            //.padding(.trailing, 72)
            .border(.red)
            
            
            ScrollView {
                RadioButtonGroup(items: ["All", "Only join", "Only Suggestion"], selectedId: "All") { selected in
                    print("Selected is: \(selected)")
                }
                
                RectangleList(departure: "Busan Station", destination: "Seomyeon Station", date: "Departed at August 20, 2023 (Sun) 15:30", memeberName: "Sprout", maxMember: 3)
                
            } // VStack
            
        }
        
        .frame(maxWidth: .infinity, alignment: .leading)
        
        
    }
}


@ViewBuilder
func RectangleList(departure: String, destination: String, date: String, memeberName: String, maxMember: Int) -> some View {
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
                HStack (alignment: .center){
                    Image(systemName: "person.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 11)
                        .foregroundColor(Color(hex: 0x7FB6F5))
                    Text(memeberName)
                    Text("max\(maxMember)")
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
                    
                }
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
