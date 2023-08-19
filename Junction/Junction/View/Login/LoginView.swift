//
//  LoginView.swift
//  Junction
//
//  Created by Bokyung on 2023/08/19.
//

import SwiftUI

struct LoginView: View {
    @State private var userID: String = ""
    @State private var password: String = ""
    @State private var loginStatus: Bool = false // TODO env 변수로 선언 후 토큰 계속 확인
    @State private var userAccessToken: String = ""
    
    var body: some View {
        NavigationView{
            if self.loginStatus == true {
                //                        ProfileDetailView(userEmail: self.email, userAccessToken: self.userAccessToken)
                MainView()
            } else {
                VStack{
                    Text("LogIn")
                        .font(.title)
                        .fontWeight(.medium)
                        .padding()
                        .foregroundColor(.black)
                    HStack{
                        Image(systemName: "person.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .padding(.bottom)
                        
                        TextField("아이디를 입력하세요.", text: $userID)
                            .frame(width: 300, height: 10)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(5.0)
                            .padding(.bottom, 20)
                        
                    }
                    HStack{
                        Image(systemName: "lock")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .padding(.bottom)
                        
                        SecureField("비밀번호를 입력하세요", text: $password)
                            .frame(width: 300, height: 10)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(5.0)
                            .padding(.bottom, 20)
                    }
                    
                    HStack{
                        Button(action: {
                            print(self.userID + self.password)
                            
                            let rft = readItemKeyChain(userId: self.userID)
                            if rft != nil {
                                UserDefaults.standard.set(rft, forKey: self.userID)
                            } else{
                                sendPostRequest("\(url)users/signin", parameters: ["userID": self.userID, "password": self.password]){
                                    responseObject, error in guard let _ = responseObject, error == nil else {
                                        print(error ?? "Unknown error")
                                        return
                                    }
                                    self.loginStatus = true
                                    // 로그인이 되었을때, 앱에 사용자의 ID, PW를 저장
                                    UserDefaults.standard.set(self.userID, forKey: "userID")
                                    UserDefaults.standard.set(self.password, forKey: "password")
                                
                                    //                                            if let rftToken = responseObject {
                                    //                                                let rft = rftToken["refresh"] as? String
                                    //                                                self.userAccessToken = rftToken["access"] as? String ?? ""
                                    //                                                setItemKeyChain(userId: self.userID, rft: rft!)
                                    //                                                UserDefaults.standard.set(rft, forKey: self.userID)
                                    //                                            }
                                }
                            }
                        }){
                            Text("로그인")
                                .frame(width: 80, height: 10)
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color(.systemBlue))
                                .cornerRadius(10)
                            
                        }
                        .padding()
                        
                        NavigationLink(destination: SignInView()){
                            Text("회원가입")
                                .frame(width: 80, height: 10)
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color(.systemBlue))
                                .cornerRadius(10)
                        }
                        
                    }
                    
                }
                .padding(.all, 30)
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarHidden(true)
            }
        }
    }
    
    //    func setItemKeyChain(userId: String, rft: String){
    //        let previousQuery: [CFString: Any] = [kSecClass: kSecClassIdentity, kSecAttrAccount: userId]
    //
    //        let updateQuery: [CFString: Any] = [kSecValueData: rft]
    //        let status = SecItemUpdate(previousQuery as CFDictionary, updateQuery as CFDictionary)
    //
    //        if status == errSecSuccess {
    //            print("Update!")
    //        } else {
    //            print("Update fail")
    //        }
    //    }
    
    func readItemKeyChain(userId: String) -> String? {
        return UserDefaults.standard.string(forKey: userID)
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoginView()
        }
    }
}
