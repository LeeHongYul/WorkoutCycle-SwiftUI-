//
//  PickWorkoutListView.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 12/11/23.
//

import SwiftUI

struct PickWorkoutListView: View {
    var body: some View {
        NavigationView {
            VStack {
                List(TwoWorkoutCycleData.orderedCycleLists, id: \.id) { cycle in
                    PickWorkoutListCell(workoutData: cycle)
                        .onTapGesture {
                            print("Tapped")
                        }
                }

                Button {

                } label: {
                    Text("Pick a Workout")
                }

                Spacer()
            }
        }
    }
}

#Preview {
    PickWorkoutListView()
}
