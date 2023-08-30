//
//  SignInView.swift
//  Junction
//
//  Created by Bokyung on 2023/08/19.
//

import SwiftUI

let url: String = "https://3db1-14-46-199-32.ngrok-free.app/"

struct SignInView: View {
    @State var userName: String = ""
    @State var userID: String = ""
    @State var userPassword: String = ""
    @State var userPasswordCheck: String = ""
    @State var isClicked: Bool = false
    
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0){
            Text("Welcome!")
                .font(.pretendard(.medium, size: 28))
                .foregroundColor(.mainPrimary500)
                .padding(.bottom, 52)
            
            VStack (alignment: .leading, spacing: 16){
                VStack (alignment: .leading,spacing: 4){
                    // MARK: 아이디
                    Text("ID")
                        .font(.pretendard(.medium, size: 16))
                        .foregroundColor(.textLight300)
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
                VStack (alignment: .leading,spacing: 4){
                    // MARK: 비밀번호
                    Text("Password")
                        .font(.pretendard(.medium, size: 16))
                        .foregroundColor(.textLight300)
                    TextField("", text: $userPassword)
                        .frame(maxWidth: .infinity)
                        .frame(height: 36)
                        .background(Color.clear)
                        .overlay(content: {
                            RoundedRectangle(cornerRadius: 10)
                                .inset(by: 0.5)
                                .stroke(.blue)
                        })
                }
                
                VStack (alignment: .leading,spacing: 4){
                    // MARK: 비밀번호 확인
                    Text("Password Check")
                        .font(.pretendard(.medium, size: 16))
                        .foregroundColor(.textLight300)
                    TextField("", text: $userPasswordCheck)
                        .frame(maxWidth: .infinity)
                        .frame(height: 36)
                        .background(Color.clear)
                        .overlay(content: {
                            RoundedRectangle(cornerRadius: 10)
                                .inset(by: 0.5)
                                .stroke(.blue)
                        })
                }
                VStack (alignment: .leading,spacing: 4){
                    // MARK: 사용자 닉네임
                    Text("Nickname")
                        .font(.pretendard(.medium, size: 16))
                        .foregroundColor(.textLight300)
                    TextField("", text: $userName)
                        .frame(maxWidth: .infinity)
                        .frame(height: 36)
                        .background(Color.clear)
                        .overlay(content: {
                            RoundedRectangle(cornerRadius: 10)
                                .inset(by: 0.5)
                                .stroke(.blue)
                        })
                }
            } // TextField VStack
            .padding(.bottom, 48)
            
            if isClicked && userPassword != userPasswordCheck{
                Text("비밀번호가 일치하지 않습니다! 다시 확인해보세요")
            }
            
            Button {
                isClicked = true
                
                // 회원가입 POST로직
                sendPostRequest("\(url)signup", parameters:
                                    ["userName": self.userName, "userID": self.userID, "password": self.userPassword]
                ){
                    responseObject, error in guard let _ = responseObject, error == nil else {
                        print(error ?? "Unknown error")
                        return
                    }
                    
                }
                
                // 회원가입이 되었을때, 앱에 사용자의 ID, PW를 저장
                UserDefaults.standard.set(self.userID, forKey: "userID")
                UserDefaults.standard.set(self.userPassword, forKey: "password")
                
                
            } label: {
                Text("Confirm")
                    .font(.pretendard(.bold, size: 16))
                    .foregroundColor(.white)
                    .padding(.vertical, 13)
                    .frame(maxWidth: .infinity)
                    .background(Color.mainPrimary500.cornerRadius(12))
            }.disabled(userPassword != userPasswordCheck)
    
        } // VStack
        .padding(.horizontal, 52)
    }
}



struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
