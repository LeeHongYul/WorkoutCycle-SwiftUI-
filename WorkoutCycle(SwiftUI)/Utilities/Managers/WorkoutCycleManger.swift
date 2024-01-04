//
//  WorkoutCycleManger.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 1/3/24.
//

import Foundation
import CoreData

class WorkoutCycleManger: ObservableObject {

    let container = NSPersistentContainer(name: "Model")

    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("failed to laod data \(error.localizedDescription)")
            }
        }
    }

    func saveWorkCycle(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data Saved")
        } catch {
            print("failed to save data")
        }
    }

    func addWorkCycle(name: String, type: String, context: NSManagedObjectContext) {
        let workcycle = WorkCycleEntity(context: context)

        workcycle.name = name
        workcycle.type = type

        saveWorkCycle(context: context)
    }

    func editWorkCycle(workcycle: WorkCycleEntity, name: String, type: String,  context: NSManagedObjectContext) {
        workcycle.name = name
        workcycle.type = type

        saveWorkCycle(context: context)
    }
}
