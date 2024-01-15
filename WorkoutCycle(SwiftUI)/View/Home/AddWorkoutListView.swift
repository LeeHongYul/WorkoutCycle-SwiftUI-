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

    @FetchRequest(sortDescriptors: []) var recordHistoryList: FetchedResults<RoutineEntity>


    @State private var typePicker: String = ""

    @State private var title = ""
    @State private var type = ""

    var body: some View {
        NavigationView {
            Form {

                Section(header: Text("New Workout")) {
                    Picker("Pick a Type", selection: $typePicker) {
                        ForEach(cycleList, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)
                }

                Section(header: Text("Select My Routine")) {
                    switch typePicker {
                    case "분할을 선택해주세요":
                        Text("분할을 선택해주세요")
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

                Section {
                    Button("저장") {
                        print("a")
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add Workout")
        }
    }

    struct TwoTextFieldView: View {
        @State private var manyTextField = DynamicTextField()

        var body: some View {
            VStack {
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
            }
        }
    }

    struct ThreeTextFieldView: View {
        @State private var manyTextField = DynamicTextField()

        var body: some View {
            VStack {
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
            }
        }
    }

    struct FourTextFieldView: View {
        @State private var manyTextField = DynamicTextField()

        var body: some View {
            VStack {
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
            }
        }
    }

    struct FiveTextFieldView: View {

        @State private var manyTextField = DynamicTextField()
        
        var body: some View {
            VStack {
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
            }
        }
    }
}

#Preview {
    AddWorkoutListView()
}
