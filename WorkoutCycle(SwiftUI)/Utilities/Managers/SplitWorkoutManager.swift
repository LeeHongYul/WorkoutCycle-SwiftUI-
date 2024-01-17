//
//  SplitWorkout.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 1/17/24.
//

import Foundation
import CoreData

class SplitWorkoutManager: BaseManager {
    func saveSplit(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data Saved")
        } catch {
            print("failed to save data")
        }
    }

    func addSplit(name: String, context: NSManagedObjectContext) {

            let newSplit = SplitWorkoutEntity(context: context)

            newSplit.name = name

            saveSplit(context: context)
        }
}
