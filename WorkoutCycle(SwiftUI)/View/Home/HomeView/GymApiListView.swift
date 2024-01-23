//
//  GymApiListView.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 1/23/24.
//

import SwiftUI
import Alamofire



struct GymApiListView: View {

    var gymList: [GymModel]

    var body: some View {
        NavigationView {
            List(gymList, id: \.place_name) { gym in
                Text("\(gym.place_name)")
            }
            .navigationTitle("Gym List")
        }
    }

}

