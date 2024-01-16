//
//  CalendarView.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 12/14/23.
//

import SwiftUI


struct CalendarTabView: View {
    @State private var isAddMemoViewActive = false
    
    @Environment(\.managedObjectContext) var managedObjContext

    @FetchRequest(sortDescriptors: []) var recordMemoList: FetchedResults<TodayMemoEntity>

    var body: some View {

        NavigationView {
            VStack {
                CalendarView(isAddMemoViewActive: $isAddMemoViewActive, interval: DateInterval(start: .distantPast, end: .distantFuture))

                RecordListView
            }

            .navigationTitle("Calendar View")
            .sheet(isPresented: $isAddMemoViewActive) {
                            AddMemoView()
            }
        }
    }

    var RecordListView: some View {

        Form {
            ForEach(recordMemoList) { memo in
                Text(memo.content!)
            }
        }
        .listStyle(.plain)
    }
}

//#Preview {
//    CalendarTabView()
//}

