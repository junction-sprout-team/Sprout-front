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
    @State var peopleRide: Int = 0
    @State var introduce: String = ""
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0){
            Text("Where are you\nheaded?")
                .font(.pretendard(.medium, size: 28))
                .foregroundColor(.mainPrimary500)
                .padding(.top, 28)
            
            Text("Make your friend on the same route")
                .font(.pretendard(.medium, size: 16))
                .foregroundColor(.textLight300)
            
            RadioButtonGroup(items: ["Ride", "RideOffer"], selectedId: "Ride") { selected in
                print("Selected is: \(selected)")
                rideType = selected
            }.padding(.top, 41.5)
            
            VStack (spacing: 12){
                HStack (alignment: .center, spacing: 20) {
                    Text("Departure")
                        .font(.pretendard(.bold, size: 16))
                        .foregroundColor(Color(hex: 0x333333).opacity(0.4))
                    Spacer()
                    TextField("", text: $departure)
                        .frame(width: 180, height: 36)
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
                        .frame(width: 180, height: 36)
                        .background(Color.clear)
                        .overlay(content: {
                            RoundedRectangle(cornerRadius: 10)
                                .inset(by: 0.5)
                                .stroke(.blue)
                        })
                }
            } // TextField VStack
            
            DatePicker(selection: $pickedDate) {
                Text("When?")
            }.padding(.top, 32)
            
            VStack (alignment: .leading, spacing: 12){
                Text("How many people for the ride?")
                HStack (spacing: 12){
                    Button {
                        // action
                        peopleRide -= 1
                    } label: {
                        Text("-")
                            .foregroundColor(.white)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 14)
                            .background(Color.textLight100.cornerRadius(20))
                    }
                    Text("\(peopleRide)")
                        .frame(maxWidth: .infinity)
                        .frame(height: 36)
                        .background(Color.clear)
                        .overlay(content: {
                            RoundedRectangle(cornerRadius: 10)
                                .inset(by: 0.5)
                                .stroke(.blue)
                        })
                    Button {
                        // action
                        peopleRide += 1
                    } label: {
                        Text("+")
                            .foregroundColor(.white)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 14)
                            .background(Color.mainPrimary500.cornerRadius(20))
                    }
                }
            }.padding(.top, 32)
            
            VStack (alignment: .leading, spacing: 12){
                Text("Introduce yourself to your friends!")
                TextEditor(text: $introduce)
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 10)
                            .inset(by: 0.5)
                            .stroke(.blue)
                    })
            }.padding(.top, 32)
            
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
                Text("Give a ride")
                    .font(.pretendard(.bold, size: 16))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 13)
                    .background(Color.mainPrimary500.cornerRadius(15))
            }.padding(.top, 36)
            
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
