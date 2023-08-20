//
//  MainView.swift
//  Junction
//
//  Created by Bokyung on 2023/08/19.
//

import SwiftUI

struct MainView2: View {
    @State var shareOption: Int = 0
    @State var radioSelected: String = ""
    
    @State var isModal: Bool = false // modal을 띄우기 위한 변수
    @State var result: [TripModel2] = []
    
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
                        MyPageView()
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
                        self.radioSelected = selected
                        
                        if radioSelected == "All" {
                            getMethod2(url+"journeys/all") { data, error in
                                if let error = error {
                                    // 에러 처리
                                    print("An error occurred: \(error)")
                                    return
                                }
                                
                                if let data = data {
                                    if let tripModels = parseJSON1(data) {
                                        result = tripModels
                                        print(result)
                                        for trip in result {
                                            print("데이터~")
                                            print(trip.destination)
                                        }
                                    }
                                }
                            }
                            
                        }
                        else if radioSelected == "Only join" {
                            getMethod2(url+"journeys/riderequest") { data, error in
                                if let error = error {
                                    // 에러 처리
                                    print("An error occurred: \(error)")
                                    return
                                }
                                
                                if let data = data {
                                    if let tripModels = parseJSON1(data) {
                                        for trip in tripModels {
                                            print("데이터")
                                            print(trip.currentState)
                                        }
                                    }
                                }
                            }
                        } else {
                            getMethod2(url+"journeys/rideoffer") { data, error in
                                if let error = error {
                                    // 에러 처리
                                    print("An error occurred: \(error)")
                                    return
                                }
                                
                                if let data = data {
                                    if let tripModels = parseJSON1(data) {
                                        for trip in tripModels {
                                            print(trip)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                }
                ForEach(result, id: \.self) {td in
                    RectangleListArea2(departure: td.departure, destination: td.destination, date: td.date, memberName: td.memberName, maxMember: td.maxMember, currentState: td.currentState, isModal: $isModal)
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


// Sheet Size Custom
// 339/852 -> 화면의 40프로만 차지
extension PresentationDetent {
    static let sheetSize2 = Self.height(UIScreen.main.bounds.height * 0.4)
}


struct MainView2_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MainView2()
        }
    }
}
