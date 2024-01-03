//
//  RecordView.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 12/14/23.
//

import SwiftUI

struct RecordView: View {
    var body: some View {
        NavigationStack {
            NavigationLink {
                AddMemoView()
            } label: {
                Image(systemName: "plus.circle.fill")
            }
        }
    }
}

#Preview {
    RecordView()
}
