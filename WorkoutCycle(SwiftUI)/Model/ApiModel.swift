//
//  ApiModel.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 1/23/24.
//

import Foundation


struct GymModel: Codable {
    var place_name: String

    init(place_name: String) {
        self.place_name = place_name
    }
}
