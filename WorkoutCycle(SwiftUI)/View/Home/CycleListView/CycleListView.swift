//
//  CycleListView.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 1/19/24.
//

import SwiftUI

struct CycleListView: View {

    @FetchRequest(sortDescriptors: []) var splitWorkoutList: FetchedResults<SplitWorkoutEntity>

    var body: some View {
        HStack {
            if splitWorkoutList.isEmpty {
                ContentUnavailableView(label: {
                    Label("No Routine", systemImage: "gym.bag")
                })
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 5) {


                        if let splitArray = splitWorkoutList.first?.name!.components(separatedBy: " ") {
                            ForEach(splitArray, id: \.self) {   item in
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 100, height: 60)
                                    .foregroundColor(.gray).opacity(0.2)
                                    .padding()
                                    .overlay(

                                        Text(item)
                                            .font(.title2)
                                            .padding()
                                    )
                            }
                        }




                    }.padding()
                }
            }
        }
    }
}
