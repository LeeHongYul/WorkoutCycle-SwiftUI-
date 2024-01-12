//
//  AddMemoView.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 1/3/24.
//

import SwiftUI

struct AddMemoView: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State private var content = ""

    var body: some View {
        NavigationView {
            VStack {
                Text("2024년 1월 5일 운동 일지")
                    .toolbar {
                        Button(action: {
                            RecordManager().addRecord(content: content, recordDate: Date(), context: managedObjContext)
                            dismiss()
                        }, label: {
                            Text("Save")
                        })
                    }

                TextField("Content", text: $content, axis: .vertical)
                    .lineLimit(30, reservesSpace: true)
                    .textFieldStyle(.roundedBorder)
                    .padding()
            }
        }
    }
}

#Preview {
    AddMemoView()
}
