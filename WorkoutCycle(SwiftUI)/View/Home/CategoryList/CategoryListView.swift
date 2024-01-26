//
//  CategoryListView.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 1/19/24.
//

import SwiftUI

struct CategoryListView: View {

    @Binding var selectedCategory: String

    var body: some View {
        HStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(categoryList, id: \.id) { item in
                        Button {
                            selectedCategory = item.workPart
                            
                        } label: {
                            CategoryListViewSetting(imageTitle: item.workImage, title: item.workPart, bindindValue: selectedCategory)
                        }
                    }
                }
            }
            .padding()
        }
    }
}
