//
//  MonthStruct.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 12/27/23.
//

import Foundation

struct MonthStruct {
    var monthType: MonthType
    var dayInt: Int
    
    func day() -> String {
        return String(dayInt)
    }
}

enum MonthType {
    case Previous
    case Current
    case Next
}
