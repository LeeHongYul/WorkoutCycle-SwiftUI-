//
//  ContentView.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 11/29/23.
//

import SwiftUI

struct ContentView: View {

    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    let colors: [Color] = [.black, .blue, .brown, .cyan]


    var body: some View {
        NavigationView {
            VStack {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(cycleList, id: \.self) {    item in
                        NavigationLink(destination: PickWorkoutListView()) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 150, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(.yellow)

                                Text("\(item)")
                            }
                        }
                    }
                }
                .padding()
                .navigationTitle("Workout Cycles")

                List {
                    ForEach(0..<5) { _ in
                        Text("This is One")
                            .font(.title2)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
