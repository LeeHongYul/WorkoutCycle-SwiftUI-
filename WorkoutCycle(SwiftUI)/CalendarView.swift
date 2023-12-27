//
//  CalendarView.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 12/14/23.
//

import SwiftUI



struct CalendarView: View {

    @EnvironmentObject var dateHolder: DateHolder


    var body: some View {
        VStack(spacing: 1) {
            DateScrollerView()
                .environmentObject(dateHolder)
                .padding()
            dayOfWeekStack
            calendarGrid
        }
    }

    var dayOfWeekStack: some View {
        HStack(spacing: 1) {
            Text("Sun").dayOfWeek()
            Text("Mon").dayOfWeek()
            Text("Tue").dayOfWeek()
            Text("Wed").dayOfWeek()
            Text("Thu").dayOfWeek()
            Text("Fri").dayOfWeek()
            Text("Sat").dayOfWeek()

        }
    }

    var calendarGrid: some View {

        VStack(spacing: 1) {

            let dayInMonth = CalendarHelper().dayInMonth(dateHolder.date)
            let firstDayofMonth = CalendarHelper().firstOfMonth(dateHolder.date)
            let startingSpaces = CalendarHelper().weekDay(firstDayofMonth)
            let prevMonth = CalendarHelper().minusMonth(dateHolder.date)
            let daysInPrevMonth = CalendarHelper().dayInMonth(prevMonth)

            ForEach(0..<6) {
                row in
                HStack(spacing: 1) {
                    ForEach(1..<8) {
                        column in
                        let count = column + (row * 7)
                        CalendarCell(count: count, startingSpaces: startingSpaces, daysInMonth: dayInMonth, daysInPrevMonth: daysInPrevMonth)
                            .environmentObject(dateHolder)
                    }
                }
            }
        }
        .frame(maxHeight: .infinity)
    }
}

extension Text {
    func dayOfWeek() -> some View {
        self.frame(maxWidth: .infinity)
            .padding()
            .lineLimit(1)
    }
}

#Preview {
    CalendarView()
}

