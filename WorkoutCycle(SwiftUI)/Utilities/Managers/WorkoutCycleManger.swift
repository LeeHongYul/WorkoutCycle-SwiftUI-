//
//  WorkoutCycleManger.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 1/3/24.
//

import Foundation
import CoreData

class WorkoutCycleManger: BaseManager {

    func saveWorkCycle(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data Saved")
        } catch {
            print("failed to save data")
        }
    }

    func addWorkCycle(name: String, type: String, history: String ,context: NSManagedObjectContext) {
        let workcycle = WorkCycleEntity(context: context)

        workcycle.name = name
        workcycle.type = type
        workcycle.history = history

        saveWorkCycle(context: context)
    }

    func editWorkCycle(workcycle: WorkCycleEntity, name: String, type: String, history: String, context: NSManagedObjectContext) {
        workcycle.name = name
        workcycle.type = type
        workcycle.history = history

        saveWorkCycle(context: context)
    }
}
