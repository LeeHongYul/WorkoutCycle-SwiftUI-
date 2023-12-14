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
                CategoryListView

                Spacer()
                
                MyWorkoutListView

            }


                        .navigationTitle("My Workout Cycle")
                        .navigationBarItems(trailing:
                            Button(action: {
                                // 버튼이 클릭되었을 때 수행할 동작
                                print("Button Tapped!")
                            }) {
                                Image(systemName: "plus.circle.fill")
                                    .font(.title)
                            }
                        )
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
            ForEach(fiveCycleList, id: \.id) { item in
                Text(item.workPart)
                    .font(.title2)
                    .fontWeight(.semibold)
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    HomeView()
}
