//
//  DietManager.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 1/15/24.
//

import Foundation
import CoreData

class DietManager: BaseManager {
    func saveDiet(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data Saved")
        } catch {
            print("failed to save data")
        }
    }

    func addDiet(dietType: String, name: String, kcal: Int16, context: NSManagedObjectContext) {
        let newDiet = FoodEntity(context: context)

        newDiet.dietType = dietType
        newDiet.name = name
        newDiet.kcal = kcal

        saveDiet(context: context)
    }
}



