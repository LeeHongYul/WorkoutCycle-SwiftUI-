//
//  AddListView.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 12/15/23.
//

import SwiftUI

struct AddListView: View {

    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
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
                    Button {
                        WorkoutCycleManger().addWorkCycle(name: title, type: typePicker, context: managedObjContext)
                        dismiss()
                    } label: {
                        Text("Sumbit")
                    }

                }
            }
            .navigationTitle("Add Workout")
        }
    }
}

#Preview {
    AddListView()
}
