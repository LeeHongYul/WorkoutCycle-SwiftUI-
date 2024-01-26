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
                        Text("\(getCurrentIndex())")
                    }
            }
        }
    }

    func getCurrentIndex() -> String {
        let currentDate = Date()
        let calendar = Calendar.current


        let timeDifference = calendar.dateComponents([.day], from: splitWorkoutList.first?.saveDate ?? Date(), to: currentDate).day ?? 0

        let arrays = splitWorkoutList.first?.name!.components(separatedBy: " ")

        if let arrays = arrays {
            let newIndex = (arrays.count + 1 + timeDifference) % arrays.count
            return "Today is \(arrays[newIndex]) Day"
        }
        return "There is No Workout"
    }
}
