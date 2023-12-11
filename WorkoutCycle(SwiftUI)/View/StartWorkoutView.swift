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
        NavigationView {

            VStack {

                //CategoryView
                CategoryListView


                //CustomWorkoutView
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 300, height: 300)
                    .foregroundColor(.gray)
                    .padding()
                    .overlay(
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 180, height: 180)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    )

                Spacer()

                // ExampleWorkoutView
                List {
                    ForEach(0..<4) { _ in
                        Text("Exmaple Workout")
                            .font(.title2)
                            .fontWeight(.semibold)
                    }
                }

                Spacer()
            }
            .navigationTitle("My Workout Cycle")
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
