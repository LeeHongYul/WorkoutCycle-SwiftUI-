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

var categoryList = [
    WorkCycle(id: UUID(), workPart: "전체", workImage: "upperBody"),
    WorkCycle(id: UUID(), workPart: "가슴", workImage: "chest"),
    WorkCycle(id: UUID(), workPart: "등", workImage: "backBody"),
    WorkCycle(id: UUID(), workPart: "어깨", workImage: "shoulder"),
    WorkCycle(id: UUID(), workPart: "삼두", workImage: "chest"),
    WorkCycle(id: UUID(), workPart: "이두", workImage: "backBody"),
    WorkCycle(id: UUID(), workPart: "하체", workImage: "lowerBody")
]

let cycleList = ["분할을 선택해주세요", "2분할", "3분할", "4분할", "5분할"]


let addWorkCycleList = ["가슴", "등", "팔", "이두", "삼두", "어깨", "상체", "하체", "전면하체", "후면하체"]
