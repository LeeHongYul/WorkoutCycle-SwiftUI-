//
//  AddListView.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 12/15/23.
//

import SwiftUI

struct AddListView: View {

    @State private var title = ""
    @State private var type = ""
    @State private var typePicker = ""

    var body: some View {
        NavigationView {
            Form {

                Section(header: Text("New Workout")) {
                    Picker("Pick a Type", selection: $typePicker) {
                        ForEach(addWorkCycleList, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)

                    TextField("Name", text: $title)
                    TextField("Type", text: $type)
                }
            }
            .navigationTitle("Add Workout")
        }
    }
}

#Preview {
    AddListView()
}
