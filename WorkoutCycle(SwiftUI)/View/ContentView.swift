//
//  ContentView.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 11/29/23.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        TabView {
            HomeView()
                .tabItem { Image(systemName: "house") }

            CalendarMainView()
                .tabItem { Image(systemName: "calendar") }

            DietView()
                .tabItem { Image(systemName: "list.clipboard") }
        }
    }
}
