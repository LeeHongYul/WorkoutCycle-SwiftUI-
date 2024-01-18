//
//  HomeView.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 12/14/23.
//

import SwiftUI
import CoreData

struct HomeView: View {

    @State var selectedCategory = ""

    @Environment(\.managedObjectContext) var managedObjContext

    var body: some View {
        NavigationView {
            VStack{
                HStack {
                    Image(systemName: "location.north.fill")
                        .resizable()
                        .frame(width: 20, height: 20)

                    Text("Suwon, Korea")
                        .font(.title2)
                        .foregroundStyle(.gray)

                    Spacer()

                    NavigationLink {
                        AddListView()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }

                }
                .padding()

                CategoryListView(selectedCategory: $selectedCategory)

                MyWorkoutListView(selectedCategory: $selectedCategory)

                CycleListView()

                TodayWorkoutListView()
            }

        }
    }
}

#Preview {
    HomeView()
}

