//
//  TodayWorkoutListView.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 1/19/24.
//

import SwiftUI

struct TodayWorkoutListView: View {

    @FetchRequest(sortDescriptors: []) var splitWorkoutList: FetchedResults<SplitWorkoutEntity>
    
    var body: some View {
        HStack {
            NavigationLink(destination: AddWorkoutListView()) {
                Rectangle()
                    .frame(height: 50)
                    .foregroundColor(.yellow)
                    .cornerRadius(30)
                    .padding()
                    .overlay {
                        Text("Today is \(isTodayWorkout()) Day")
                    }
            }
        }
    }

    // 하루마다 바뀌게 구현해야함
    func isTodayWorkout() -> String {
        var stack: [String] = []

        for i in 0..<splitWorkoutList.count {
            if let name = splitWorkoutList[i].name {
                stack.append(name)
            }
        }
        return stack.first ?? "No Workout"
    }
}

#Preview {
    TodayWorkoutListView()
}
