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
        }

    }
}
#Preview {
    CalendarView()
}
