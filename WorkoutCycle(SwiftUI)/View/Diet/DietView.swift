//
//  DietView.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 1/15/24.
//

import SwiftUI

enum MealType: String {
    case breakfast = "아침"
    case lunch = "점심"
    case dinner = "저녁"
}

struct DietView: View {

    @Environment(\.managedObjectContext) var managedObjContext

    @FetchRequest(sortDescriptors: []) var dietList: FetchedResults<DietEntity>
    @Environment(\.dismiss) var dismiss

    @State private var selectedMealType: MealType = .breakfast

    @State private var mealText: String = ""
    @State private var kcalText: String = ""

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("식사 유형")) {
                        Picker("식사 유형", selection: $selectedMealType) {
                            Text("아침").tag(MealType.breakfast)
                            Text("점심").tag(MealType.lunch)
                            Text("저녁").tag(MealType.dinner)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }

                    Section(header: Text("식단 입력")) {
                        TextField("식단 입력", text: $mealText)

                    }

                    Section(header: Text("칼로리 입력")) {
                        TextField("칼로리 입력", text: $kcalText)
                    }

                    Section {
                        Button("저장") {
                            print(selectedMealType.rawValue)
                            DietManager().addDiet(dietType: selectedMealType.rawValue, name: mealText, kcal: Int16(kcalText)!, context: managedObjContext)
                        }
                    }
                }
                DietListView
            }
        }
    }

    var DietListView: some View {

        Form {
            ForEach(dietList) { diet in
                Text((diet.dietType ?? "a") + diet.name! + String(diet.kcal))
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    DietView()
}
