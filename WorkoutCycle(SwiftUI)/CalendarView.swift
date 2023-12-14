//
//  CalendarView.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 12/14/23.
//

import SwiftUI



struct CalendarView: View {

    @State private var date = Date()

    var body: some View {
        VStack {
            Text("This is my Calendar")
                .font(.largeTitle)

            DatePicker("Today Calendar", selection: $date, displayedComponents: [.date])
                .datePickerStyle(.graphical)

            Spacer()

            
        }
    }
}

#Preview {
    CalendarView()
}
