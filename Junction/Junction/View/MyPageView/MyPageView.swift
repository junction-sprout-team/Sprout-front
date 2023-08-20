//
//  MyPageView.swift
//  Junction
//
//  Created by Bokyung on 2023/08/19.
//

import SwiftUI

struct MyPageView: View {

    var body: some View {
        ZStack {
            VStack {
                Text("Sprout")
                Text("ID: Bokyung Park")
            }
        }
        .background(Color.mainPrimary500.ignoresSafeArea())
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
