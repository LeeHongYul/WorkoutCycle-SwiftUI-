//
//  CalendarCell.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 12/27/23.
//

import SwiftUI

struct CalendarCell: View {

    @EnvironmentObject var dateHolder: DateHolder
    let count: Int
    let startingSpaces: Int
    let daysInMonth: Int
    let daysInPrevMonth: Int

    var body: some View {
        Text(monthStruct().day())
            .foregroundColor(textColor(type: monthStruct().monthType))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    func textColor(type: MonthType) -> Color {
        return type == MonthType.Current ? Color.black : Color.gray
    }



    func monthStruct() -> MonthStruct {
        let start = startingSpaces == 0 ? startingSpaces + 7 : startingSpaces
        if(count <= start) {
            let day = daysInMonth + count - start
            return MonthStruct(monthType: MonthType.Previous, dayInt: daysInMonth)
        } else if (count - start > daysInMonth) {
            let day = count - start - daysInMonth
            return MonthStruct(monthType: MonthType.Next, dayInt: day)
        }
        let day = count - start
        return MonthStruct(monthType: MonthType.Current, dayInt: day)
    }
}

//#Preview {
//    CalendarCell(count: 1, startingSpaces: 1, daysInMonth: 1, daysInPrev: 1, daysInPrevMonth: 1)
//}
