//
//  ProfileDetailView.swift
//  Junction
//
//  Created by Bokyung on 2023/08/19.
//

import SwiftUI

struct ProfileDetailView: View {
    let userEmail: String
    let userAccessToken: String
    var body: some View {
        
        VStack {
            Text("Profile Detail View")
                .font(.title)
                .fontWeight(.medium)
                .padding()
            
            Text("User Email: \(userEmail)")
                .padding()
            
            Text("Access Token: \(userAccessToken)")
                .padding()
            
            // Add your profile detail content here
        }
    }
}

struct ProfileDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDetailView(userEmail: "ㅁㄴㅇㅁㄴ", userAccessToken: "ㄴㅇㄹㄴㅇ")
    }
}
