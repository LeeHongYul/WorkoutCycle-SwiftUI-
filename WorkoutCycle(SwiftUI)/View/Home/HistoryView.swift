//
//  HistoryView.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 1/12/24.
//

import SwiftUI

struct HistoryView: View {

    var passData: String

    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss

    @State private var history = ""
//    @State private var typeWorkout = ""

    @FetchRequest(sortDescriptors: []) var recordHistoryList: FetchedResults<RoutineEntity>

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("\(passData) 기록")) {
                        TextField("Enter History of Workout", text: $history)
                        Button {
                            RoutineManager().addRoutine(typeWorkout: passData,routine: history, context: managedObjContext)
                            dismiss()
                        } label: {
                            Text("Sumbit")
                        }
                    }

                    Section(header: Text("History")) {
                        HistoryListView
                    }
                }


            }
        }
        .navigationTitle("Workout History")
    }

    var HistoryListView: some View {
        List {
            ForEach(recordHistoryList) { routine in
                if routine.typeWorkout == passData {
                    Text("\(routine.routine!)")
                }
            }
        }
    }
}

//#Preview {
//    HistoryView()
//}
