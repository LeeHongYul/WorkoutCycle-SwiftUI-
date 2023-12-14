//
//  StartWorkoutView.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 12/11/23.
//

import SwiftUI

struct StartWorkoutView: View {

    @State var selectedCategory = ""

    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    let colors: [Color] = [.black, .blue, .brown, .cyan]


    var body: some View {
        TabView {
            NavigationView {

                VStack {

                    //CategoryView
                    CategoryListView


                    //CustomWorkoutView

                    NavigationLink(destination: PickWorkoutListView()) {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 300, height: 300)
                            .foregroundColor(.gray).opacity(0.2)
                            .padding()
                            .overlay(
                                VStack {
                                    Image(systemName: "plus")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor(.gray)
                                        .frame(width: 180, height: 180)
                                        .clipShape(RoundedRectangle(cornerRadius: 15))

                                    Text("Make your own Workout")
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.blue)
                                }
                            )
                    }

                    Spacer()

                    // ExampleWorkoutView
                    List {
                        ForEach(fiveCycleList, id: \.id) { item in
                            Text(item.workPart)
                                .font(.title2)
                                .fontWeight(.semibold)
                        }
                    }
                    .listStyle(.plain)

                    Spacer()
                }
                .navigationTitle("My Workout Cycle")
            }

            DetailWorkoutView()
                .tabItem {
                    Image(systemName: "plus")
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
                                    .frame(width: 50, height: 50)

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


}


#Preview {
    StartWorkoutView()
}
