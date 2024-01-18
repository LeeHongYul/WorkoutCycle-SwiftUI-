//
//  MyWorkoutListView.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 1/19/24.
//

import SwiftUI

struct MyWorkoutListView: View {

    @Binding var selectedCategory: String

    @FetchRequest(sortDescriptors: []) var workCycleList: FetchedResults<WorkCycleEntity>
    @Environment(\.managedObjectContext) var managedObjContext
    
    var body: some View {
        List {
            if workCycleList.isEmpty {
                ContentUnavailableView(label: {
                    Label("No WorkCycle", systemImage: "tray.fill")
                })
            } else if selectedCategory ==  "전체" || selectedCategory == "" {
                ForEach(workCycleList) { input in
                    NavigationLink(destination: HistoryView(passData: input.name ?? "")) {
                        Text(input.name!)
                    }
                }.onDelete { indexSet in
                    deleteWorkCycle(offsets: indexSet)
                }
            } else {
                FilteredList(filter: selectedCategory)
            }
        }
        .listStyle(.plain)
    }

    func deleteWorkCycle(offsets: IndexSet) {
        withAnimation {
            offsets.map { workCycleList[$0] }.forEach(managedObjContext.delete)

            WorkoutCycleManger().saveWorkCycle(context: managedObjContext)
        }
    }
}

