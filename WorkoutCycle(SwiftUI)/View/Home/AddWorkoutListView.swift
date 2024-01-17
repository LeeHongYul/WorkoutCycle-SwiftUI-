//
//  AddWorkoutListView.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 1/12/24.
//

import SwiftUI

struct DynamicTextField {
    var textField1: String = ""
    var textField2: String = ""
    var textField3: String = ""
    var textField4: String = ""
    var textField5: String = ""
}


struct AddWorkoutListView: View {

    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss

    @FetchRequest(sortDescriptors: []) var splitWorkoutList: FetchedResults<SplitWorkoutEntity>


    @State private var typePicker: String = ""

    @State private var title = ""
    @State private var type = ""

    var body: some View {
        NavigationView {
            if splitWorkoutList.isEmpty {
                VStack {
                    Form {

                        Section(header: Text("New Workout")) {
                            Picker("Pick a Type", selection: $typePicker) {
                                ForEach(cycleList, id: \.self) {
                                    Text($0)
                                }
                            }
                            .pickerStyle(.menu)
                        }

                    }
                    .frame(height: 100)

                    Section(header: Text("Select My Routine")) {
                        if typePicker.isEmpty || typePicker == "분할을 선택해주세요" {
                            ContentUnavailableView(label: {
                                Label("No Routine", systemImage: "gym.bag")
                            })
                        } else {
                            switch typePicker {
                            case "2분할":
                                TwoTextFieldView()
                            case "3분할":
                                ThreeTextFieldView()
                            case "4분할":
                                FourTextFieldView()
                            case "5분할":
                                FiveTextFieldView()
                            default:
                                Text("분할을 선택해주세요")
                            }
                        }
                    }
                }
                .navigationTitle("Add Workout")
            } else {
                List {
                    ForEach(splitWorkoutList) { workout in
                        Text(workout.name!)
                    }
                }
            }
        }
    }

    struct TwoTextFieldView: View {

        @State private var manyTextField = DynamicTextField()

        @Environment(\.managedObjectContext) var managedObjContext
        @Environment(\.dismiss) var dismiss

        var body: some View {
            Form {
                Picker("First Textfield", selection: $manyTextField.textField1) {
                    ForEach(addWorkCycleList, id: \.self) {
                        Text($0)
                    }
                }

                Picker( "Second Textfield", selection: $manyTextField.textField2) {
                    ForEach(addWorkCycleList, id: \.self) {
                        Text($0)
                    }
                }

                Text("aaaaaaa")
                Button(action: {
                    SplitWorkoutManager().addSplit(name: manyTextField.textField1, context: managedObjContext)
                    SplitWorkoutManager().addSplit(name: manyTextField.textField2, context: managedObjContext)
                }) {
                    Text("저장 돔 하자")
                }
            }
        }
    }

    struct ThreeTextFieldView: View {

        @State private var manyTextField = DynamicTextField()
        @Environment(\.managedObjectContext) var managedObjContext

        var body: some View {
            Form {
                Picker("First Textfield", selection: $manyTextField.textField1) {
                    ForEach(addWorkCycleList, id: \.self) {
                        Text($0)
                    }
                }
                Picker( "Second Textfield", selection: $manyTextField.textField2) {
                    ForEach(addWorkCycleList, id: \.self) {
                        Text($0)
                    }
                }
                Picker("First Textfield", selection: $manyTextField.textField3) {
                    ForEach(addWorkCycleList, id: \.self) {
                        Text($0)
                    }
                }
                Section {
                    Button("저장") {
                        SplitWorkoutManager().addSplit(name: manyTextField.textField1, context:managedObjContext)
                        SplitWorkoutManager().addSplit(name: manyTextField.textField2, context:managedObjContext)
                        SplitWorkoutManager().addSplit(name: manyTextField.textField3, context:managedObjContext)
                    }
                }
            }
        }
    }

    struct FourTextFieldView: View {

        @State private var manyTextField = DynamicTextField()
        @Environment(\.managedObjectContext) var managedObjContext

        var body: some View {
            Form {
                Picker("First Textfield", selection: $manyTextField.textField1) {
                    ForEach(addWorkCycleList, id: \.self) {
                        Text($0)
                    }
                }
                Picker("First Textfield", selection: $manyTextField.textField2) {
                    ForEach(addWorkCycleList, id: \.self) {
                        Text($0)
                    }
                }
                Picker("First Textfield", selection: $manyTextField.textField3) {
                    ForEach(addWorkCycleList, id: \.self) {
                        Text($0)
                    }
                }
                Picker("First Textfield", selection: $manyTextField.textField4) {
                    ForEach(addWorkCycleList, id: \.self) {
                        Text($0)
                    }
                }

                Section {
                    Button("저장") {
                        SplitWorkoutManager().addSplit(name: manyTextField.textField1, context:managedObjContext)
                        SplitWorkoutManager().addSplit(name: manyTextField.textField2, context:managedObjContext)
                        SplitWorkoutManager().addSplit(name: manyTextField.textField3, context:managedObjContext)
                        SplitWorkoutManager().addSplit(name: manyTextField.textField4, context:managedObjContext)
                    }
                }
            }
        }
    }

    struct FiveTextFieldView: View {

        @State private var manyTextField = DynamicTextField()
        @Environment(\.managedObjectContext) var managedObjContext

        var body: some View {
            Form {
                Picker("First Textfield", selection: $manyTextField.textField1) {
                    ForEach(addWorkCycleList, id: \.self) {
                        Text($0)
                    }
                }
                Picker("First Textfield", selection: $manyTextField.textField2) {
                    ForEach(addWorkCycleList, id: \.self) {
                        Text($0)
                    }
                }
                Picker("First Textfield", selection: $manyTextField.textField3) {
                    ForEach(addWorkCycleList, id: \.self) {
                        Text($0)
                    }
                }
                Picker("First Textfield", selection: $manyTextField.textField4) {
                    ForEach(addWorkCycleList, id: \.self) {
                        Text($0)
                    }
                }
                Picker("First Textfield", selection: $manyTextField.textField5) {
                    ForEach(addWorkCycleList, id: \.self) {
                        Text($0)
                    }
                }
                Section {
                    Button("저장") {
                        SplitWorkoutManager().addSplit(name: manyTextField.textField1, context:managedObjContext)
                        SplitWorkoutManager().addSplit(name: manyTextField.textField2, context:managedObjContext)
                        SplitWorkoutManager().addSplit(name: manyTextField.textField3, context:managedObjContext)
                        SplitWorkoutManager().addSplit(name: manyTextField.textField4, context:managedObjContext)
                        SplitWorkoutManager().addSplit(name: manyTextField.textField5, context:managedObjContext)
                    }
                }
            }
        }
    }
}

#Preview {
    AddWorkoutListView()
}
