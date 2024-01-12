//
//  RoutineManger.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 1/12/24.
//

import Foundation
import CoreData

class RoutineManager: BaseManager {
    func saveRoutine(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data Saved")
        } catch {
            print("failed to save data")
        }
    }

    func addRoutine(typeWorkout: String, routine: String, context: NSManagedObjectContext) {
        let routineCycle = RoutineEntity(context: context)

        routineCycle.typeWorkout = typeWorkout
        routineCycle.routine = routine


        saveRoutine(context: context)
    }

    func editRoutine(routineCycle: RoutineEntity, typeWorkout: String, routine: String, context: NSManagedObjectContext) {
        routineCycle.typeWorkout = typeWorkout
        routineCycle.routine = routine


        saveRoutine(context: context)
    }
}
