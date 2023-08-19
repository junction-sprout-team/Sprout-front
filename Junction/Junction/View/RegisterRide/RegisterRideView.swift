//
//  RegisterRideView.swift
//  Junction
//
//  Created by Bokyung on 2023/08/19.
//

import SwiftUI

struct RegisterRideView: View {
    @State var departure: String = ""
    @State var destination: String = ""
    @State var rideType: String = "Ride"
    @State var pickedDate: Date = Date()
    @State var peopleRide: String = ""
    @State var introduce: String = ""
    
    var body: some View {
        VStack (alignment: .leading, spacing: 20){
            Text("Where are you headed?")
            HStack (alignment: .center, spacing: 20) {
                Text("Departure")
                    .font(.pretendard(.bold, size: 16))
                    .foregroundColor(Color(hex: 0x333333).opacity(0.4))
                Spacer()
                TextField("", text: $departure)
                    .frame(width: 152, height: 36)
                    .background(Color.clear)
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 10)
                            .inset(by: 0.5)
                            .stroke(.blue)
                    })
            }
            //.border(.blue) // Departure
            
            HStack (alignment: .center, spacing: 20) {
                Text("Destination")
                    .font(.pretendard(.bold, size: 16))
                    .foregroundColor(Color(hex: 0x333333).opacity(0.4))
                Spacer()
                TextField("", text: $destination)
                    .frame(width: 152, height: 36)
                    .background(Color.clear)
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 10)
                            .inset(by: 0.5)
                            .stroke(.blue)
                    })
            }
            
            RadioButtonGroup(items: ["Ride", "RideOffer"], selectedId: "Ride") { selected in
                print("Selected is: \(selected)")
                rideType = selected
            }
            //.border(.blue) // Destination
            
            DatePicker(selection: $pickedDate) {
                Text("Date")
            }
            
            Text("how many people for the ride?")
            TextField("", text: $peopleRide)
                .frame(maxWidth: .infinity)
                .frame(height: 30)
                .background(Color.clear)
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 10)
                        .inset(by: 0.5)
                        .stroke(.blue)
                })
            
            Text("Introduce yourself to your friends!")
            TextEditor(text: $introduce)
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 10)
                        .inset(by: 0.5)
                        .stroke(.blue)
                })
            
            Button {
                // action
                let formattedDate = formatDateToString(date: pickedDate, format: "yyyy-MM-dd HH:mm")
                // 2000-10-14 10:13
                
                let whoWrite = UserDefaults.standard.string(forKey: "userID") ?? ""

                sendPostRequest("\(url)journeys/register", parameters: ["whoWrite": whoWrite, "departure": departure, "destination": destination, "rideType": rideType, "pickedDate": formattedDate, "peopleRide": String(peopleRide), "introduce": introduce]){
                    responseObject, error in guard let _ = responseObject, error == nil else {
                        print(error ?? "Unknown error")
                        return
                    }
                }
            } label: {
                Text("데이터 전송하기!")
            }

        }
        .padding(.horizontal, 20)
    }
    
    // Date -> String
    func formatDateToString(date: Date, format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
    
}

struct RegisterRideView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RegisterRideView()
        }
    }
}
