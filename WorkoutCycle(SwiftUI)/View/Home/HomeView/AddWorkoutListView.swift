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

struct AddAllTextField{
    func addAllString(strings: [String]) -> String {

        //단어를 하나의 문자열로 저장, 공백과 함께
        //먼저 문자열로 받아 joined으로 "" 넣어주면됨
        let allString = strings.joined(separator: " ")
        print(allString)
        return allString

    }
}


struct AddWorkoutListView: View {

    var testStringS: [String] = []

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

                Section {
                    Button("저장") {

                        let saveString = AddAllTextField().addAllString(strings: [manyTextField.textField1, manyTextField.textField2])


                        SplitWorkoutManager().addSplit(name:saveString, saveDate: Date(), context:managedObjContext)
                    }
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
                        let saveString = AddAllTextField().addAllString(strings: [manyTextField.textField1, manyTextField.textField2, manyTextField.textField3])


                        SplitWorkoutManager().addSplit(name:saveString, saveDate: Date(), context:managedObjContext)
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
                        let saveString = AddAllTextField().addAllString(strings: [manyTextField.textField1, manyTextField.textField2, manyTextField.textField3, manyTextField.textField4])


                        SplitWorkoutManager().addSplit(name:saveString, saveDate: Date(), context:managedObjContext)
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
                        let saveString = AddAllTextField().addAllString(strings: [manyTextField.textField1, manyTextField.textField2, manyTextField.textField3, manyTextField.textField4, manyTextField.textField5])


                        SplitWorkoutManager().addSplit(name:saveString, saveDate: Date(), context:managedObjContext)
                    }
                }
            }
        }
    }
}

#Preview {
    AddWorkoutListView()
}
