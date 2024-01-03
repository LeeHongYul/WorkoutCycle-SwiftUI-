//
//  CalendarView.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 1/3/24.
//

import SwiftUI

struct CalendarView: UIViewRepresentable {
    let interval: DateInterval

    func makeUIView(context: Context) -> UICalendarView {
        let view = UICalendarView()
        view.calendar = Calendar(identifier: .gregorian)
        view.availableDateRange = interval
        return view
    }

    func updateUIView(_ uiView: UICalendarView, context: Context) {

    }


}

