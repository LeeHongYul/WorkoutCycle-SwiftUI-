//
//  HomeView.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 12/14/23.
//

import SwiftUI

struct HomeView: View {

    @State var selectedCategory = ""

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

                TodayWorkoutListView

                Spacer()
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
        }
    }

    var MyWorkoutListView: some View {
        List {
            if !fiveCycleList.isEmpty {
                ContentUnavailableView(label: {
                    Label("No WorkCycle", systemImage: "tray.fill")
                })
            } else {
                ForEach(fiveCycleList, id: \.id) { item in
                    Text(item.workPart)
                        .font(.title2)
                        .fontWeight(.semibold)
                }
            }
        }
        .listStyle(.plain)
    }

    var TodayWorkoutListView: some View {
        HStack {
            Rectangle()
                .frame(height: 200)
                .foregroundColor(.yellow)
                .cornerRadius(30)
                .padding()
                .overlay {
                    Text("Today is Back Day")
                }
        }
    }
}

#Preview {
    HomeView()
}
