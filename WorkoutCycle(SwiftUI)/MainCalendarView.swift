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
        Coordinator(parent: self, eventStore: _eventStore)
    }

    func updateUIView(_ uiView: UICalendarView, context: Context) {
        
    }

    class Coordinator: NSObject, UICalendarViewDelegate {
        var parent: MainCalendarView
        @ObservedObject var eventStore: EventStore
        init(parent: MainCalendarView, eventStore: ObservedObject<EventStore>) {
            self.parent = parent
            self._eventStore = eventStore
        }

        func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
            return nil
        }
    }
}
