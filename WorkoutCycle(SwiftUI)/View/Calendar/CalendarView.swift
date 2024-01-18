//
//  CalendarView.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 1/3/24.
//

import SwiftUI

struct CalendarView: UIViewRepresentable {
    @Binding var isAddMemoViewActive: Bool

    let interval: DateInterval

    func makeUIView(context: Context) -> UICalendarView {
        let view = UICalendarView()
        view.calendar = Calendar(identifier: .gregorian)
        view.availableDateRange = interval
        view.delegate = context.coordinator
        let dateSelection = UICalendarSelectionSingleDate(delegate: context.coordinator)
        view.selectionBehavior = dateSelection

        return view
    }

    func updateUIView(_ uiView: UICalendarView, context: Context) {

    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UICalendarViewDelegate, UICalendarSelectionSingleDateDelegate {

        @Environment(\.managedObjectContext) var managedObjContext
        @Environment(\.dismiss) var dismiss

        @FetchRequest(sortDescriptors: []) var memoList: FetchedResults<TodayMemoEntity>

        var parent: CalendarView

        init(_ parent: CalendarView) {
            self.parent = parent
        }

        func didSelectDate(_ date: Date) {
            // 선택된 날짜에 대한 액션을 수행
        }

        func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
            print("Calendar Pressed")
            parent.isAddMemoViewActive = true
        }




        func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {

            // 선택된 날짜에 빨간색 동그라미를 표시하는 예제
            for item in memoList {
                    if let selectedDate = item.recordDate,
                        Calendar.current.isDate(selectedDate, inSameDayAs: dateComponents.date ?? Date()) {
                        return UICalendarView.Decoration.default(color: .systemGreen, size: .large)
                    }
            }




            // 여기에서 다른 조건에 따라 다른 Decoration을 반환할 수 있습니다.

            return nil // Decoration이 필요 없는 경우 nil을 반환합니다.
        }

    }
}





