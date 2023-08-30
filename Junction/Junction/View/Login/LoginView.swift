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
    
    var body: some View {미
        NavigationView{
            if self.loginStatus == true {
                //                        ProfileDetailView(userEmail: self.email, userAccessToken: self.userAccessToken)
                MainView2()
            } else {
                VStack (spacing: 0){
                    HStack {
                        Spacer()
                        Image("logoText")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 106)
                        Spacer()
                    }
                    .padding(.bottom, 56)
                    VStack (spacing: 12){
                        HStack{
                            Text("ID")
                                .font(.pretendard(.medium, size: 16))
                                .foregroundColor(.textLight300)
                                .frame(width: 25)
                            
                            TextField("", text: $userID)
                                .frame(maxWidth: .infinity)
                                .frame(height: 36)
                                .background(Color.clear)
                                .overlay(content: {
                                    RoundedRectangle(cornerRadius: 10)
                                        .inset(by: 0.5)
                                        .stroke(.blue)
                                })
                            
                        }
                        HStack{
                            Text("PW")
                                .font(.pretendard(.medium, size: 16))
                                .foregroundColor(.textLight300)
                                .frame(width: 25)
                            TextField("", text: $password)
                                .frame(maxWidth: .infinity)
                                .frame(height: 36)
                                .background(Color.clear)
                                .overlay(content: {
                                    RoundedRectangle(cornerRadius: 10)
                                        .inset(by: 0.5)
                                        .stroke(.blue)
                                })
                        }
                    }
                    .padding(.bottom, 48)
                    
                    Button(action: {
                        print(self.userID + self.password)
                        
                        let rft = readItemKeyChain(userId: self.userID)
                        if rft != nil {
                            UserDefaults.standard.set(rft, forKey: self.userID)
                        } else{
                            sendPostRequest("\(url)login", parameters: ["loginId": self.userID, "password": self.password]){
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
                        Text("Sign in")
                            .frame(maxWidth: .infinity)
                            .font(.pretendard(.bold, size: 16))
                            .foregroundColor(.white)
                            .padding(.vertical, 13)
                            .background(Color.mainPrimary500)
                            .cornerRadius(10)
                        
                    }.padding(.bottom, 16)
                    
                    HStack {
                        Text("Don't have an account?")
                            .font(.pretendard(.medium, size: 12))
                            .foregroundColor(Color.textLight300)
                        
                        NavigationLink(destination: SignInView()){
                            Text("Sign Up")
                                .font(.pretendard(.medium, size: 12))
                                .foregroundColor(Color.mainPrimary500)
                        } // NavigationLink
                    }.padding(.bottom, 190)
                }
                .padding(.horizontal, 52)
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
