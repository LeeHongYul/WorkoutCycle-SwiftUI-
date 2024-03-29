//
//  WorkoutCycle_SwiftUI_App.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 11/29/23.
//

import SwiftUI

@main
struct WorkoutCycle_SwiftUI_App: App {
    @StateObject private var baseManger = BaseManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, baseManger.container.viewContext)

        }
    }
}
