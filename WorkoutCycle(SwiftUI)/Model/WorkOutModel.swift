//
//  WorkOutModel.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 12/11/23.
//

import Foundation

struct WorkCycle: Decodable {
    let id: UUID
    let workPart: String
    let workImage: String
}

struct TwoWorkoutCycleData {

    static let data1 = WorkCycle(id: UUID(), workPart: "상체", workImage: "upperBody")
    static let data2 = WorkCycle(id: UUID(), workPart: "하체", workImage: "lowerBody")

    static let orderedCycleLists = [data1, data2]


}

var categoryList = [
    WorkCycle(id: UUID(), workPart: "가슴", workImage: "chest"),
    WorkCycle(id: UUID(), workPart: "등", workImage: "backBody"),
    WorkCycle(id: UUID(), workPart: "하체", workImage: "lowerBody"),
    WorkCycle(id: UUID(), workPart: "삼두", workImage: "chest"),
    WorkCycle(id: UUID(), workPart: "이두", workImage: "backBody"),
    WorkCycle(id: UUID(), workPart: "하체", workImage: "lowerBody")


]

let cycleList = ["무분할", "2분할", "3분할", "4분할", "5분할"]


let addWorkCycleList = ["휴식", "스트렝스", "근비대", "자율운동", "크로스핏", "가슴", "등", "팔", "이두", "삼두", "어깨", "상체", "하체", "전면하체", "후면하체"]


let twoCycleList   = [
    WorkCycle(id: UUID(), workPart: "상체", workImage: "upperBody"),
    WorkCycle(id: UUID(), workPart: "하체", workImage: "lowerBody")
]

let threeCycleList = [
    WorkCycle(id: UUID(), workPart: "가슴, 삼두", workImage: "chest"),
    WorkCycle(id: UUID(), workPart: "등, 이두", workImage: "backBody"),
    WorkCycle(id: UUID(), workPart: "하체, 어깨", workImage: "lowerBody")
]


let fourCycleList  = [
    WorkCycle(id: UUID(), workPart: "가슴, 삼두", workImage: "chest"),
    WorkCycle(id: UUID(), workPart: "등, 이두", workImage: "backBody"),
    WorkCycle(id: UUID(), workPart: "어깨", workImage: "shoulder"),
    WorkCycle(id: UUID(), workPart: "하체", workImage: "lowerBody")
]

let fiveCycleList  = [
    WorkCycle(id: UUID(), workPart: "가슴", workImage: "chest"),
    WorkCycle(id: UUID(), workPart: "등", workImage: "backBody"),
    WorkCycle(id: UUID(), workPart: "어께", workImage: "shoulder"),
    WorkCycle(id: UUID(), workPart: "하체", workImage: "lowerBody"),
    WorkCycle(id: UUID(), workPart: "팔", workImage: "arm")
]
