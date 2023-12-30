//
//  Event.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 12/30/23.
//

import Foundation

struct Event: Identifiable {
    enum EventType: String, Identifiable, CaseIterable {
        case work, home, social, sport, unspecified
        var id: String {
            self.rawValue
        }

        var icon: String {
            switch self {
            case .work:
                return "Home"
            case .home:
                return "Home"
            case .social:
                return "Home"
            case .sport:
                return "Home"
            case .unspecified:
                return "Home"
            }
        }
    }

    var eventType: EventType
    var date: Date
    var note: String
    var id: String

    init(eventType: EventType = .unspecified, date: Date, note: String, id: String = UUID().uuidString) {
        self.eventType = eventType
        self.date = date
        self.note = note
        self.id = id
    }

    static var sampleEvents: [Event] {
        return [
            Event(eventType: .home, date: Date(), note: "a"),
            Event(eventType: .social, date: Date(), note: "b"),
            Event(eventType: .sport, date: Date(), note: "c"),
            Event(eventType: .work, date: Date(), note: "s")
        ]
    }
}
