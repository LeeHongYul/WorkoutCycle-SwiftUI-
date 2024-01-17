//
//  RoutineManger.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 1/12/24.
//

import Foundation
import CoreData

class HistoryManager: BaseManager {
    func saveHistory(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data Saved")
        } catch {
            print("failed to save data")
        }
    }

    func addHistory(typeWorkout: String, routine: String, dateInput: Date, context: NSManagedObjectContext) {
        let newHistory = HistoryEntity(context: context)

        newHistory.typeWorkout = typeWorkout
        newHistory.routine = routine
        newHistory.dateInput = Date()


        saveHistory(context: context)
    }

    func editHistory(oldHistory: HistoryEntity, typeWorkout: String, routine: String, context: NSManagedObjectContext) {
        
        oldHistory.typeWorkout = typeWorkout
        oldHistory.routine = routine


        saveHistory(context: context)
    }
}
