//
//  SignInView.swift
//  Junction
//
//  Created by Bokyung on 2023/08/19.
//

import SwiftUI

struct SignInView: View {
    @State var userName: String = ""
    @State var userID: String = ""
    @State var userPassword: String = ""
    @State var userPasswordCheck: String = ""
    @State var isClicked: Bool = false
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0){
            // MARK: 사용자 이름
            Text("user의 이름: \(userName)")
            TextField("이름을 입력해주세요!", text: $userName)
                .frame(width: 300, height: 10)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            
            // MARK: 아이디
            Text("user의 아이디: \(userID)")
            TextField("아이디를 입력해주세요!", text: $userID)
                .frame(width: 300, height: 10)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            
            // MARK: 비밀번호
            Text("user의 비밀번호: \(userPassword)")
            SecureField("비밀번호를 입력하세요", text: $userPassword)
                .frame(width: 300, height: 10)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            
            // MARK: 비밀번호 확인
            
            SecureField("비밀번호를 다시 입력하세요", text: $userPasswordCheck)
                .frame(width: 300, height: 10)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            
            if isClicked && userPassword != userPasswordCheck{
                Text("비밀번호가 일치하지 않습니다! 다시 확인해보세요")
            }
            
            Button {
                isClicked = true
                
                // 회원가입 POST로직
//                sendPostRequest("<http://localhost:8000/auth/signup>", parameters:
//                                    ["userName": self.userName, "useID": self.userID, "password": self.userPassword]
//                ){
//                    responseObject, error in guard let _ = responseObject, error == nil else {
//                        print(error ?? "Unknown error")
//                        return
//                    }
//                }
                
            } label: {
                Text("회원가입 로직")
            }.disabled(userPassword != userPasswordCheck)
        }
        .padding(20)
        .border(.red)
    }
}



struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
