//
//  RecordManger.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 1/5/24.
//

import Foundation
import CoreData

class RecordManager: BaseManager {

    func saveRecord(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Record Data Saved")
        } catch {
            print("failed to save data")
        }
    }

    func addRecord(content: String, recordDate: Date, context: NSManagedObjectContext) {
        
        let newRecord = TodayWorkoutMemoEntity(context: context)

        newRecord.content = content
        newRecord.recordDate = Date()
    }

    func editRecord(oldMemo: TodayWorkoutMemoEntity, content: String, recordDate: Date, context: NSManagedObjectContext) {

        oldMemo.content = content
        oldMemo.recordDate = Date()

        saveRecord(context: context)
    }
}
