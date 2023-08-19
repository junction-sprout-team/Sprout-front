//
//  Network.swift
//  Junction
//
//  Created by Bokyung on 2023/08/19.
//

import Foundation

// MARK: POST - 로그인 시 필요
func sendPostRequest(_ url: String, parameters: [String: String], completion: @escaping ([String: Any]?, Error?) -> Void) {
    let targetUrl = URL(string: url)
    let paramData = try? JSONSerialization.data(withJSONObject: parameters)
    
    var request = URLRequest(url: targetUrl!)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpBody = paramData
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard
            let data = data,                              // is there data
            let response = response as? HTTPURLResponse,  // is there HTTP response
            200 ..< 300 ~= response.statusCode,           // is statusCode 2XX
            error == nil                                  // was there no error
        else {
            completion(nil, error)
            return
        }
        
        let responseObject = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any]
        completion(responseObject, nil)
        
        print("로그인 성공!")
        print(responseObject ?? "값 없음")
        UserDefaults.standard.set(true, forKey: "isLoggedIn")
    }
    task.resume()
}




func postMethod() {
    
    guard let url = URL(string: "http://dummy.restapiexample.com/api/v1/create") else {
        print("Error: cannot create URL")
        return
    }
    
    // 업로드할 모델(형태)
    struct UploadData: Codable {
        let name: String
        let salary: String
        let age: String
    }
    
    // 실제 업로드할 (데이터)인스턴스 생성
    let uploadDataModel = UploadData(name: "Jack", salary: "3540", age: "23")
    
    // 모델을 JSON data 형태로 변환
    guard let jsonData = try? JSONEncoder().encode(uploadDataModel) else {
        print("Error: Trying to convert model to JSON data")
        return
    }
    
    // URL요청 생성
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type") // 요청타입 JSON
    request.setValue("application/json", forHTTPHeaderField: "Accept") // 응답타입 JSON
    request.httpBody = jsonData
    
    
    // 요청을 가지고 세션 작업시작
    URLSession.shared.dataTask(with: request) { data, response, error in
        // 에러가 없어야 넘어감
        guard error == nil else {
            print("Error: error calling POST")
            print(error!)
            return
        }
        // 옵셔널 바인딩
        guard let safeData = data else {
            print("Error: Did not receive data")
            return
        }
        // HTTP 200번대 정상코드인 경우만 다음 코드로 넘어감
        guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
            print("Error: HTTP request failed")
            return
        }
        
        // 원하는 모델이 있다면, JSONDecoder로 decode코드로 구현 ⭐️
        print(String(decoding: safeData, as: UTF8.self))
        
    }.resume()   // 시작
}



// MARK: GET

// MARK: GET
//func getMethod(_ url: String, completion: @escaping (Data?, Error?) -> Void) {
//    // URL구조체 만들기
//    guard let url = URL(string: url) else {
//        print("Error: cannot create URL")
//        return
//    }
//
//    // URL요청 생성
//    var request = URLRequest(url: url)
//    request.httpMethod = "GET"
//
//    // 요청을 가지고 작업세션시작
//    URLSession.shared.dataTask(with: request) { data, response, error in
//        // 에러 처리
//        if let error = error {
//            print("Error: error calling GET")
//            print(error)
//            completion(nil, error)
//            return
//        }
//
//        // 옵셔널 바인딩
//        guard let safeData = data else {
//            print("Error: Did not receive data")
//            completion(nil, nil)
//            return
//        }
//
//        // HTTP 200번대 정상코드인 경우만 다음 코드로 넘어감
//        guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
//            print("Error: HTTP request failed")
//            completion(nil, nil)
//            return
//        }
//
//        // 원하는 모델이 있다면, JSONDecoder로 decode코드로 구현 ⭐️
//        print("result is \(String(decoding: safeData, as: UTF8.self))")
//        completion(safeData, nil)
//
//        print("response is : \(response)")
//
//    }.resume()     // 시작
//}

// 사용 예시
//getMethod("your_url_here") { data, error in
//    if let error = error {
//        // 에러 처리
//        print("An error occurred: \(error)")
//        return
//    }
//    
//    if let data = data {
//        // 데이터 처리
//        do {
//            let decoder = JSONDecoder()
//            let tripModels = try decoder.decode([TripModel].self, from: data)
//            for trip in tripModels {
//                print(trip)
//            }
//        } catch {
//            print("Error decoding JSON: \(error)")
//        }
//    }
//}


func getMethod(_ url: String) {
    // URL구조체 만들기
    guard let url = URL(string: url) else {
        print("Error: cannot create URL")
        return
    }

    // URL요청 생성
    var request = URLRequest(url: url)
    request.httpMethod = "GET"


    // 요청을 가지고 작업세션시작
    URLSession.shared.dataTask(with: request) { data, response, error in
        // 에러가 없어야 넘어감
        guard error == nil else {
            print("Error: error calling GET")
            print(error!)
            return
        }
        // 옵셔널 바인딩
        guard let safeData = data else {
            print("Error: Did not receive data")
            return
        }
        // HTTP 200번대 정상코드인 경우만 다음 코드로 넘어감
        guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
            print("Error: HTTP request failed")
            return
        }

        // 원하는 모델이 있다면, JSONDecoder로 decode코드로 구현 ⭐️
        print("result is \(String(decoding: safeData, as: UTF8.self))")
        print("response is : \(response)")


    }.resume()     // 시작
   
}


