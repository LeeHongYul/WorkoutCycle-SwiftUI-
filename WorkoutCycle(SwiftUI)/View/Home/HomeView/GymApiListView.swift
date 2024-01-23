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
    @State var draw: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                List(gymList, id: \.place_name) { gym in
                    Text("\(gym.place_name)")
                }

                KakaoMapView(draw: $draw).onAppear(perform: {
                    self.draw = true
                }).onDisappear(perform: {
                    self.draw = false
                }).frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.red)
            }



            .navigationTitle("Gym List")
        }
    }

}

