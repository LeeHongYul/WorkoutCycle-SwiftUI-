//
//  FilteredList.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 1/4/24.
//

import SwiftUI

struct FilteredList: View {

    @FetchRequest var fetchRequest: FetchedResults<WorkCycleEntity>

    @Environment(\.managedObjectContext) var managedObjContext

    @FetchRequest(sortDescriptors: []) var workCycleList: FetchedResults<WorkCycleEntity>

    var body: some View {
        ForEach(fetchRequest, id: \.self) { item in
            NavigationLink(destination: HistoryView(passData: item.name ?? "")) {
                Text("\(item.name ?? "nil")")
            }
        }.onDelete { indexSet in
            deleteWorkCycle(offsets: indexSet)
        }
    }

    func deleteWorkCycle(offsets: IndexSet) {
        withAnimation {
            offsets.map { workCycleList[$0] }.forEach(managedObjContext.delete)

            WorkoutCycleManger().saveWorkCycle(context: managedObjContext)
        }
    }

    init(filter: String) {
        _fetchRequest = FetchRequest<WorkCycleEntity>(sortDescriptors: [], predicate: NSPredicate(format: "type == %@", filter))
    }
}

