//
//  GroupListArea.swift
//  Junction
//
//  Created by Bokyung on 2023/08/19.
//

import SwiftUI

struct GroupListArea: View {
    var body: some View {
        VStack (spacing: 0){
            HStack (spacing: 0){
                Text("안수린님이 모으고 있는 그룹")
                
            }
            .border(.red)
            
        }
        .border(.red)
    }
}

struct GroupListArea_Previews: PreviewProvider {
    static var previews: some View {
        GroupListArea()
    }
}
