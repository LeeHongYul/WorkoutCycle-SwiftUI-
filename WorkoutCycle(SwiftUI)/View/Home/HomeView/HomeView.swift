//
//  HomeView.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 12/14/23.
//

import SwiftUI
import Alamofire
import CoreData

struct ResponseModel: Codable {
    var documents: [GymModel]
}

struct HomeView: View {
    @State private var gymList: [GymModel] = []
    @State private var isActive: Bool = false

    @State var selectedCategory = ""

    @Environment(\.managedObjectContext) var managedObjContext

    var body: some View {
        NavigationView {
            VStack{
                HStack {

                    NavigationLink(destination: GymApiListView(gymList: gymList), isActive: $isActive) {

                    }

                    Button(action: {
                        getApi()
                        isActive = true
                    }) {
                        Image(systemName: "location.north.fill")
                    }


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

    func getApi() {
        let url = "https://dapi.kakao.com/v2/local/search/keyword.json?y=37.514322572335935&x=127.06283102249932&radius=20000&query=헬스장"

        let header: HTTPHeaders = [
            "Authorization": "KakaoAK 2f5f20aef317fbed29a97436ffab332f"
        ]
        AF.request(url, method: .get, headers: header).responseJSON { response in
            print("response: \(response)")

            var routines: [GymModel]

            do {
                switch (response.result) {
                    // 성공/실패 구분
                case .success:
                    // response의 data를 [Routineeee]로 변환
                    //                        routines = try decoder.decode([GymModel].self, from: response.data!)
                    //                        print("routines: \(routines)")

                    if let data = response.data {
                        do {
                            let decoder = JSONDecoder()
                            let gyms = try decoder.decode(ResponseModel.self, from: data)
                            DispatchQueue.main.async {
                                self.gymList = gyms.documents
                            }
                        } catch let parsingError {
                            print("Error decoding JSON:", parsingError)
                        }
                    }
                case .failure(let error):
                    print("errorCode: \(error._code)")
                    print("errorDescription: \(error.errorDescription!)")
                }
            } catch let parsingError {
                print("Error:", parsingError)
            }

        }.resume()
    }
}



