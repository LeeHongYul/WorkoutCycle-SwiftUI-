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
            ScrollView {
                CalendarView(interval: DateInterval(start: .distantPast, end: .distantFuture))
            }
                .navigationTitle("Calendar View")
        }
    }
}


#Preview {
    CalendarTabView()
}

