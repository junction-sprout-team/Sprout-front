//
//  ContentView.swift
//  Junction
//
//  Created by Bokyung on 2023/08/18.
//

import SwiftUI

struct ContentView: View {
    @State var isLoading: Bool = true
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = UserDefaults.standard.bool(forKey: "isLoggedIn")
    
    var body: some View {
        ZStack {
            if isLoggedIn { // 로그인이 된 상태라면
                NavigationView {
                    MainView()                    
                }
            } else { // 로그인이 되지 않은 상태라면
                VStack (spacing: 0){
                    LoginView()
                } .zIndex(0)
            }
            
            if isLoading { // Splash
                launchScreenView.transition(.opacity).zIndex(1)
            }
        } // ZStack
        .onAppear {
            autoLogin()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
                withAnimation { isLoading.toggle() }
            })
        } // onAppear
    }
    
    func autoLogin() {
        if let userID = UserDefaults.standard.string(forKey: "userID") {
            if let password = UserDefaults.standard.string(forKey: "userID") {
                sendPostRequest("\(url)users/signin", parameters: ["userID": userID, "password": password]){
                    responseObject, error in guard let _ = responseObject, error == nil else {
                        print(error ?? "Unknown error")
                        return
                    }
                }
            }
        }
    } // func autoLogin
}


extension ContentView {
    var launchScreenView: some View {
        ZStack (alignment: .center){
            LinearGradient(gradient: Gradient(colors: [.red, .blue]),
                           startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
