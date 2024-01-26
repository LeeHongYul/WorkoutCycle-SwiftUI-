//
//  GymApiListView.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 1/23/24.
//

import SwiftUI
import Alamofire
import CoreLocation

struct GymApiListView: View {

    var gymList: [GymModel]
    
    @State var draw: Bool = false

    @Binding var getLat: CLLocationDegrees
    @Binding var getLon: CLLocationDegrees


    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    List(gymList.prefix(5), id: \.place_name) { gym in
                        Text("\(gym.place_name)")
                    }
                    .pagination(limit: 5)
                    .frame(height: geometry.size.height * 0.4)

                    KakaoMapView(draw: $draw, getLat: $getLat, getLon: $getLon).onAppear(perform: {
                        print("$$$$$$$$$$$$\(getLon) \(getLat)")
                        self.draw = true
                    }).onDisappear(perform: {
                        self.draw = false
                    }).frame(height: geometry.size.height * 0.6)
                }
                .navigationTitle("Gym List")
            }
        }
    }
}

extension List {
    func pagination(limit: Int) -> some View {
        return self.onAppear(
//            List(gymList, id: \.place_name) { gym in
//                Text("\(gym.place_name)")
//            }
        )
    }
}

