//
//  AddWorkoutListView.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 1/12/24.
//

import SwiftUI

struct AddWorkoutListView: View {
    @State private var typePicker: String = "2분할"

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
                        Text("Invalid selection")
                    }

                    Button {

                    } label: {
                        Text("Sumbit")
                    }
                }
            }
            .navigationTitle("Add Workout")
        }
    }

    struct TwoTextFieldView: View {
        @State private var textField1: String = ""
        @State private var textField2: String = ""

        var body: some View {
            VStack {
                TextField("First Textfield", text: $textField1)
                    .padding()
                TextField("Second Textfield", text: $textField2)
                    .padding()
            }
        }
    }

    struct ThreeTextFieldView: View {
        @State private var textField1: String = ""
        @State private var textField2: String = ""
        @State private var textField3: String = ""

        var body: some View {
            VStack {
                TextField("First Textfield", text: $textField1)
                    .padding()
                TextField("Second Textfield", text: $textField2)
                    .padding()
                TextField("Second Textfield", text: $textField3)
                    .padding()
            }
        }
    }

    struct FourTextFieldView: View {
        @State private var textField1: String = ""
        @State private var textField2: String = ""
        @State private var textField3: String = ""
        @State private var textField4: String = ""

        var body: some View {
            VStack {
                TextField("First Textfield", text: $textField1)
                    .padding()
                TextField("Second Textfield", text: $textField2)
                    .padding()
                TextField("Second Textfield", text: $textField3)
                    .padding()
                TextField("Second Textfield", text: $textField4)
                    .padding()
            }
        }
    }

    struct FiveTextFieldView: View {
        @State private var textField1: String = ""
        @State private var textField2: String = ""
        @State private var textField3: String = ""
        @State private var textField4: String = ""
        @State private var textField5: String = ""

        var body: some View {
            VStack {
                TextField("First Textfield", text: $textField1)
                    .padding()
                TextField("Second Textfield", text: $textField2)
                    .padding()
                TextField("Second Textfield", text: $textField3)
                    .padding()
                TextField("Second Textfield", text: $textField4)
                    .padding()
                TextField("Second Textfield", text: $textField5)
                    .padding()
            }
        }
    }
}

#Preview {
    AddWorkoutListView()
}
