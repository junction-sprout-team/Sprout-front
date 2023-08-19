//
//  DestinationModel.swift
//  Junction
//
//  Created by Bokyung on 2023/08/19.
//

import SwiftUI

struct DestinationModel: Identifiable {
    var id: UUID = UUID()
    var departure: String
    var destination: String
    var date: String
    var memeberName: String
    var maxMember: Int
}


let destinationData: [DestinationModel] = [
    DestinationModel(departure: "Busan Station", destination: "Seomyeon Station", date: "Departed at August 20, 2023 (Sun) 15:30", memeberName: "Sprout", maxMember: 3),
    DestinationModel(departure: "Haeundae", destination: "Seomyeon Station", date: "Departed at August 22, 2023 (Tue) 10:30", memeberName: "Junction", maxMember: 2),
    DestinationModel(departure: "Busan Station", destination: "Seomyeon Station",date: "Departed at August 23, 2023 (Wed) 15:00", memeberName: "Sprout", maxMember: 3),
    DestinationModel(departure: "Haeundae", destination: "Seomyeon Station", date: "Departed at August 22, 2023 (Tue) 10:30", memeberName: "Junction", maxMember: 2)
]
