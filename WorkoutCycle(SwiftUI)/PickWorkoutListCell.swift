//
//  PickWorkoutListCell.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 12/11/23.
//

import SwiftUI

struct PickWorkoutListCell: View {

    let workoutData: WorkCycle

    var body: some View {
        HStack {
            Image(workoutData.workImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 90)
                .cornerRadius(8)

            VStack(alignment: .leading, spacing: 5) {
                Text(workoutData.workPart)
                    .font(.title2)
                    .fontWeight(.medium)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    PickWorkoutListCell(workoutData: TwoWorkoutCycleData.data1)
}
