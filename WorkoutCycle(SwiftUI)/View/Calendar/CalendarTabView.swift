//
//  CalendarView.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 12/14/23.
//

import SwiftUI


struct CalendarTabView: View {


    var body: some View {
        NavigationStack {
            VStack {
                CalendarView(interval: DateInterval(start: .distantPast, end: .distantFuture))

                RecordListView
            }
            .navigationTitle("Calendar View")
        }
    }

    var RecordListView: some View {

        List {
            Text("AA")
            Text("AA")
            Text("AA")
            Text("AA")
        }
        .listStyle(.plain)
    }
}


#Preview {
    CalendarTabView()
}

