//
//  MainView.swift
//  Junction
//
//  Created by Bokyung on 2023/08/19.
//

import SwiftUI

struct MainView: View {
    @State var shareOption: Int = 0
    @State var radioSelected: String = ""

    @State var isModal: Bool = false // modal을 띄우기 위한 변수
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image("ImagBackground")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .offset(y: 40)
            VStack (alignment: .leading, spacing: 0){
                HStack (spacing: 16){
                    Text("Breezy")
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
                        MyPageView()
                    } label: {
                        Image(systemName: "person")
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

                    Text("Hope on to Breezy the local Busan Ride.")
                        .multilineTextAlignment(.leading)
                        .font(.pretendard(.medium, size: 28))
                        .foregroundColor(Color(hex: 0x7fb6f6))
                        .padding(.bottom, 90)
                }
                .padding(.horizontal, 32)

                ScrollView {
                    RadioButtonGroup(items: ["All", "Ride request", "Ride offer"], selectedId: "All") { selected in
                        print("Selected is: \(selected)")
                        self.radioSelected = selected
                        if radioSelected == "All" {
                            getMethod(url+"journeys/all")
                        }
                        else if radioSelected == "Ride request" {
                            getMethod(url+"journeys/riderequest")
                        } else {
                            getMethod(url+"journeys/rideoffer")
                        }
                    }


                    ForEach(tripData) { td in
                        RectangleListArea(departure: td.departure, destination: td.destination, date: td.date, imageTitle: td.imageTitle, memberName: td.memberName, maxMember: td.maxMember, currentState: td.currentState, buttonColor: td.buttonColor, isModal: $isModal)
                    }

                } // ScrollView
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .sheet(isPresented: $isModal) {
                MainModalArea(departure: "Busan Station", destination: "Seomyeon Station", date: "Departed at August 20,  2023 (Sun) 15:30", imageTitle: "car.fill", memberName: "Sprout", maxMember: 3, currentState: "Join", buttonColor: .mainPoint500)
                    .presentationDetents([.sheetSize])
            }
        } // ZStack
    }
}

// Sheet Size Custom
// 339/852 -> 화면의 40프로만 차지
extension PresentationDetent {
    static let sheetSize = Self.height(UIScreen.main.bounds.height * 0.4)
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MainView()
        }
    }
}
