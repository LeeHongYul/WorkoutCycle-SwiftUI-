//
//  BaseManager.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 1/3/24.


import Foundation
import CoreData

class BaseManager: ObservableObject {

    let container = NSPersistentContainer(name: "Model")

    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("failed to laod data \(error.localizedDescription)")
            }
        }
    }

}
