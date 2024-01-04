//
//  FilteredList.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 1/4/24.
//

import SwiftUI

struct FilteredList: View {

    @FetchRequest var fetchRequest: FetchedResults<WorkCycleEntity>

    var body: some View {
        List(fetchRequest, id: \.self) { item in
            HStack {
                Spacer()
                Text("\(item.name ?? "nil")")
                Spacer()
            }
        }
        .listStyle(.plain)
    }

    init(filter: String) {
        _fetchRequest = FetchRequest<WorkCycleEntity>(sortDescriptors: [], predicate: NSPredicate(format: "type == %@", filter))
    }
}

