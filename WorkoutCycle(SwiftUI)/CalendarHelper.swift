//
//  CalendarHelper.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 12/27/23.
//

import Foundation

class CalendarHelper {
    let calendar = Calendar.current
    let dateFormatter = DateFormatter()

    func monthYearString(_ date: Date) -> String {
        dateFormatter.dateFormat = "LLL yyy"
        return dateFormatter.string(from: date)
    }

    func plusMonth(_ date: Date) -> Date {
        return calendar.date(byAdding: .month, value: 1, to: date)!
    }

    func minusMonth(_ date: Date) -> Date {
        return calendar.date(byAdding: .month, value: -1, to: date)!
    }
}
