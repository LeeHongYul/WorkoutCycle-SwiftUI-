//
//  CalendarView.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 12/14/23.
//

import SwiftUI


struct CalendarMainView: View {
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
                if let recordDate = memo.recordDate?.formattedString(format: "yyyy년 MM월 dd일") {
                    Text(memo.content! + " " + recordDate)
                }
            }
        }
        .listStyle(.plain)
    }
}

extension Date {
    func formattedString(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
