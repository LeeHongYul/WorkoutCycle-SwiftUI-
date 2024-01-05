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
    }
}



