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
    @State private var passData: String?
    @State private var todayWorkout = ""

    @Environment(\.managedObjectContext) var managedObjContext
    
    @FetchRequest(sortDescriptors: []) var workCycleList: FetchedResults<WorkCycleEntity>
    @FetchRequest(sortDescriptors: []) var splitWorkoutList: FetchedResults<SplitWorkoutEntity>

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
                    NavigationLink(destination: HistoryView(passData: input.name ?? "")) {
                        Text(input.name!)
                    }
                }.onDelete { indexSet in
                    deleteWorkCycle(offsets: indexSet)
                }
            } else {
                    FilteredList(filter: selectedCategory)
            }
        }
        .listStyle(.plain)
    }

    var CycleListView: some View {
        HStack {
            if splitWorkoutList.isEmpty {
                ContentUnavailableView(label: {
                    Label("No Routine", systemImage: "gym.bag")
                })
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 5) {
                        ForEach(splitWorkoutList) { input in
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 100, height: 60)
                                .foregroundColor(.gray).opacity(0.2)
                                .padding()
                                .overlay(
                                    Text(input.name!)
                                        .font(.title2)
                                        .padding()
                                )
                        }.onDelete { indexSet in
                            deleteWorkCycle(offsets: indexSet)
                        }
                    }.padding()
                }
            }
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
                        Text("Today is \(isTodayWorkout()) Day")
                    }

            }
        }
    }

    // 하루마다 바뀌게 구현해야함
    func isTodayWorkout() -> String {
        var stack: [String] = []

        for i in 0..<splitWorkoutList.count {
                if let name = splitWorkoutList[i].name {
                    stack.append(name)
                }
            }
        return stack.first ?? "No Workout"
    }

    func deleteWorkCycle(offsets: IndexSet) {
        withAnimation {
            offsets.map { workCycleList[$0] }.forEach(managedObjContext.delete)

            WorkoutCycleManger().saveWorkCycle(context: managedObjContext)
        }
    }
}

#Preview {
    HomeView()
}

