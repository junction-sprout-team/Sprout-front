//
//  DataDecoder.swift
//  Junction
//
//  Created by Bokyung on 2023/08/20.
//

import SwiftUI


// 현재의 형태
//func parseJSON1(_ Data: Data) -> [TripModel]? {
//    
//    do {
//        // 스위프트5
//        // 자동으로 원하는 클래스/구조체 형태로 분석
//        // JSONDecoder
//        let decoder = JSONDecoder() // 데이터를 코드로 변형
//        
//        let decodedData = try decoder.decode(TripData.self, from: Data) // 데이터를 받아서 내가 사용하고 싶은 형태로 변형
//
//        return decodedData.tripDataResult.tripModelList // 변형한 것을 배열로 return
//        
//    } catch {
//        
//        return nil
//    }
//    
//}
