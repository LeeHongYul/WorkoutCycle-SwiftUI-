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
    @FetchRequest(sortDescriptors: []) var workCycleList: FetchedResults<WorkCycleEntity>

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

                CategoryListView

                MyWorkoutListView

                CycleListView

                TodayWorkoutListView
            }

        }
    }

    var CategoryListView: some View {
        HStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(categoryList,id: \.id) { item in
                        Button {
                            selectedCategory = item.workPart
                        } label: {
                            HStack {
                                Image(item.workImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 30, height: 30)

                                Text(item.workPart)
                            }
                            .padding(20)
                            .background(selectedCategory == item.workPart ? .black : .gray.opacity(0.1))
                            .foregroundColor(selectedCategory != item.workPart ? .black : .white)
                            .clipShape(Capsule())
                        }
                    }
                }
            }
            .padding()
        }
    }

    var MyWorkoutListView: some View {

        List {
            if workCycleList.isEmpty {
                ContentUnavailableView(label: {
                    Label("No WorkCycle", systemImage: "tray.fill")
                })
            } else if selectedCategory ==  "전체" || selectedCategory == "" {
                ForEach(workCycleList) { input in
                    Text(input.name!)
                }.onDelete { indexSet in
                    deleteWorkCycle(offsets: indexSet)
                }
            } else {
                FilteredList(filter: selectedCategory)
                    .frame(height: 300)
            }
        }
        .listStyle(.plain)
    }

    var CycleListView: some View {
        HStack {
            if workCycleList.isEmpty {
                ContentUnavailableView(label: {
                    Label("No Workout Schedule", systemImage: "gym.bag")
                })
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(workCycleList) { input in
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 100, height: 60)
                                .foregroundColor(.gray).opacity(0.2)
                                .padding()
                                .overlay(
                                    Text(input.name!)
                                )
                        }.onDelete { indexSet in
                            deleteWorkCycle(offsets: indexSet)
                        }
                    }.padding()
                }
            }
        }
    }

    func deleteWorkCycle(offsets: IndexSet) {
        withAnimation {
            offsets.map { workCycleList[$0] }.forEach(managedObjContext.delete)

            WorkoutCycleManger().saveWorkCycle(context: managedObjContext)
        }
    }

    var TodayWorkoutListView: some View {
        HStack {
            NavigationLink(destination: AddWorkoutListView()) {
                Rectangle()
                    .frame(height: 50)
                    .foregroundColor(.yellow)
                    .cornerRadius(30)
                    .padding()
                    .overlay {
                        Text("Today is Back Day")
                    }
            }
        }
    }
}

#Preview {
    HomeView()
}
