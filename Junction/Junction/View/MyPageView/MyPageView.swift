//
//  MyPageView.swift
//  Junction
//
//  Created by Bokyung on 2023/08/19.
//

import SwiftUI

struct MyPageView: View {

    var body: some View {
        ZStack {
            Color.mainPrimary500.ignoresSafeArea()
            VStack (spacing: 0){
                Rectangle()
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .shadow(color: Color(hex: 0x333333).opacity(0.3), radius: 6, x: 4, y: 4)
                    .overlay(alignment: .topLeading) {
                        VStack (alignment: .leading, spacing: 8){
                            HStack (spacing: 12){
                                Text("Sprout")
                                    .font(.pretendard(.medium, size: 28))
                                    .foregroundColor(.mainPrimary500)
                                Image(systemName: "square.and.pencil")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 16)
                                    .foregroundColor(.mainPrimary500)
                                
                            }
                            Text("ID: Bokyung Park")
                                .font(.pretendard(.medium, size: 16))
                                .foregroundColor(.textLight300)
                        }.padding(20)
                    }
                    .frame(height: 130)
                    .frame(maxWidth: .infinity)
                    .padding(.top, 36) // Rectangle1
                    .padding(.bottom, 40)
                
                Rectangle()
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(color: Color(hex: 0x333333).opacity(0.3), radius: 6, x: 4, y: 4)
                    .overlay(alignment: .leading) {
                        HStack (spacing: 0){
                            Text("Credit card Management...")
                                .font(.pretendard(.light, size: 17))
                                .foregroundColor(.black)
                                
                            Spacer()

                            Image(systemName: "chevron.right")
                                .foregroundColor(Color(hex: 0x3c3c43).opacity(0.3))
                        }.padding(.horizontal, 16)
                    }
                    .frame(height: 44)
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 20)
                
                
                Rectangle()
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(color: Color(hex: 0x333333).opacity(0.3), radius: 6, x: 4, y: 4)
                    .overlay(alignment: .leading) {
                        VStack (spacing: 11){
                            HStack (spacing: 0){
                                Text("Credit card Management...")
                                    .font(.pretendard(.light, size: 17))
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color(hex: 0x3c3c43).opacity(0.3))
                            }.padding(.horizontal, 16)
                            
                            Divider().padding(.horizontal)
                            
                            HStack (spacing: 0){
                                Text("A past record...")
                                    .font(.pretendard(.light, size: 17))
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color(hex: 0x3c3c43).opacity(0.3))
                            }.padding(.horizontal, 16)
                            
                        } // VStack
                    }
                    .frame(height: 88)
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 20)
                
                
                
                
                Spacer()
            }
            .padding(.horizontal, 32)
        }
        .tint(.white)
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MyPageView()
        }
    }
}
