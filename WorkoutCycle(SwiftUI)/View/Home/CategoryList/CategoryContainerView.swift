////
////  CategoryContainerView.swift
////  WorkoutCycle(SwiftUI)
////
////  Created by 이홍렬 on 1/19/24.
////
//
//import SwiftUI
//
//public struct CategoryContainerView: View {
//
//    @Binding var selectedCategory: String
//
//    @State var totalHeight: CGFloat
//    let verticalSpacing: CGFloat
//    let horizontalSpacing: CGFloat
//
//    public init(
//        selectedCategory: Binding<String>,
//        totalHeight: CGFloat = .zero,
//        verticalSpacing: CGFloat = 4,
//        horizontalSpacing: CGFloat = 4
//
//      ) {
//        self._selectedCategory = selectedCategory
//        self.totalHeight = totalHeight
//        self.verticalSpacing = verticalSpacing
//        self.horizontalSpacing = horizontalSpacing
//      }
//
//    public var body: some View {
//
//        var width = CGFloat.zero
//        var height = CGFloat.zero
//
//        GeometryReader { geomety in
//            ZStack(alignment: .topLeading) {
//                ForEach(categoryList, id: \.id) { item in
//                    Button {
//                        selectedCategory = item.workPart
//
//                    } label: {
//                        CategoryListViewModel(imageTitle: item.workImage, title: item.workPart, bindindValue: selectedCategory)
//                            .alignmentGuide(.leading) { view in
//                                if abs(width - view.width) > geomety.size.width {
//                                              width = 0
//                                              height -= view.height
//                                              height -= verticalSpacing
//                                            }
//                                            let result = width
//
//                                            return result
//                                          }
//                            .alignmentGuide(.top) { _ in
//                                let result = height
//
//                                return result
//                            }
//                    }
//                }
//            }
//            .background(
//                GeometryReader { geometry in
//                    Color.clear
//                        .onAppear {
//                            self.totalHeight = geomety.size.height
//                        }
//                }
//            )
//        }
//        .frame(height: totalHeight)
//    }
//}
//
//
