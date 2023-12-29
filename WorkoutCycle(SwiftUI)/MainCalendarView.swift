//
//  MainCalendarView.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 12/28/23.
//

import SwiftUI

struct MainCalendarView: UIViewRepresentable {

    let interval: DateInterval
    @ObservedObject var eventStore: EventStore
    
    func makeUIView(context: Context) -> UICalendarView {
        let view = UICalendarView()
        view.calendar = Calendar(identifier: .gregorian)
        view.availableDateRange = interval
        return view
    }
    
    func makeCoordinator() -> Coordinator {

    }

    func updateUIView(_ uiView: UICalendarView, context: Context) {
        
    }

    class Coordinator: NSObject, UICalendarViewDelegate {

    }
}
