//
//  WorkoutCycleManger.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 1/3/24.
//

import Foundation
import CoreData

class WorkoutCycleManger: BaseManager {
    static let shared = WorkoutCycleManger()

    private override init() {

    }

    var mainContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    var workCycleList = [WorkCycleEntity]()

    func fetchWorkCycle() {
        let request = WorkCycleEntity.fetchRequest()

        do {
            workCycleList = try mainContext.fetch(request)
        } catch {
            print("fetch 실패")
        }
    }

    func addWorkCycle(name: String) {
        let newWorkCycle = WorkCycleEntity(context: mainContext)

        newWorkCycle.name = name

        workCycleList.insert(newWorkCycle, at: 0)

        saveContext()
    }

    func deleteOneWorkData(workCycle: WorkCycleEntity) {
        mainContext.delete(workCycle)
        saveContext()
    }

    func deleteAllWorkData() {
        for i in workCycleList {
            mainContext.delete(i)
        }
        saveContext()
    }
}
