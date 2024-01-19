//
//  CategoryView.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 1/19/24.
//

import SwiftUI

public struct CategoryListViewModel: View {

    private var imageTitle: String
    private var title: String
    private var bindindValue: String

    public init(imageTitle: String,  title: String, bindindValue: String) {
        self.imageTitle = imageTitle
        self.title = title
        self.bindindValue = bindindValue
    }

    public var body: some View {

        HStack {
            Image(imageTitle)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)

            Text(title)
        }
        .padding(20)
        .background(bindindValue == title ? .black : .gray.opacity(0.1))
        .foregroundColor(bindindValue != title ? .black : .white)
        .clipShape(Capsule())
    }
}
