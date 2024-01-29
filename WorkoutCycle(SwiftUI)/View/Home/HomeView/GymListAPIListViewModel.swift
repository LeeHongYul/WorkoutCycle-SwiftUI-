//
//  testAPIViewModel.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 1/29/24.
//

import Foundation
import SwiftUI
import CoreLocation

class GymListAPIListViewModel: ObservableObject {
    
    @Published var getLat = 0.0
    @Published var getLon = 0.0

    init(){
        getAPILetLon()
    }

    func getAPILetLon() {
        let manager = CLLocationManager()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()

        if let location = manager.location {
            getLat = location.coordinate.latitude
            getLon = location.coordinate.longitude
        }
    }
}
