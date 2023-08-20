//
//  DataDecoder.swift
//  Junction
//
//  Created by Bokyung on 2023/08/20.
//

import SwiftUI

struct TripData: Codable {
    let tripResult: TripResult
}

struct TripResult: Codable {
    let tripList: [TripModel2]
}

struct TripModel2: Hashable, Codable {
    //var id: UUID = UUID()
    var objectId: String
    var departure: String
    var destination: String
    var date: String
    //var imageTitle: String
    var memberName: String
    var maxMember: Int
    var currentState: String
    //var buttonColor: Color
    
}


// 현재의 형태
func parseJSON1(_ Data: Data) -> [TripModel2]? {

    do {
        // 스위프트5
        // 자동으로 원하는 클래스/구조체 형태로 분석
        // JSONDecoder
        let decoder = JSONDecoder() // 데이터를 코드로 변형

        let decodedData = try decoder.decode(TripData.self, from: Data) // 데이터를 받아서 내가 사용하고 싶은 형태로 변형

        return decodedData.tripResult.tripList // 변형한 것을 배열로 return

    } catch {

        return nil
    }
}

//
//func parseJSON1(_ data: Data) -> [TripModel2]? {
//    do {
//        let decoder = JSONDecoder()
//        let decodedData = try decoder.decode([TripModel2].self, from: data)
//        return decodedData
//    } catch {
//        print("Error decoding JSON: \(error)")
//        return nil
//    }
//}








