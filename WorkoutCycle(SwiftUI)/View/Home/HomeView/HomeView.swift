//
//  HomeView.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 12/14/23.
//

import SwiftUI
import Alamofire
import CoreData
import CoreLocation
import MapKit

struct ResponseModel: Codable {
    var documents: [GymModel]
}

struct HomeView: View {

    @ObservedObject var testAPIModel: GymListAPIListViewModel = GymListAPIListViewModel()

    @State private var gymList: [GymModel] = []
    @State private var isActive: Bool = false

    @State var selectedCategory = ""

    @Environment(\.managedObjectContext) var managedObjContext

    var body: some View {
        NavigationView {
            VStack{
                HStack {

                    NavigationLink(destination: GymAPIListView(gymList: gymList, getLat: testAPIModel.getLat, getLon: testAPIModel.getLon), isActive: $isActive) {

                    }

                    Button(action: {

                        getLocalAPI(lat: testAPIModel.getLat, lon: testAPIModel.getLon)
                        isActive = true

                    }) {
                        HStack {
                            Image(systemName: "location.north.fill")
                            Text("근처 헬스장 찾기")
                                .font(.title2)
                                .foregroundColor(.blue)

                        }
                    }

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

    func changeToClLocation(latitude: Double?, longitude: Double?) -> CLLocation? {
        guard let latitude = latitude, let longitude = longitude else { return nil }
        return CLLocation(latitude: latitude, longitude: longitude)
    }


    func changeToAddress(location: CLLocation?) -> String {
        var address: String = ""

        if let location = location {
            CLGeocoder().reverseGeocodeLocation(location, completionHandler: { placemarks, error in
                if error == nil {
                    guard let placemarks = placemarks,
                          let placemark = placemarks.last else { return }

                    address = "\(placemark.subThoroughfare ?? ""), \(placemark.thoroughfare ?? ""), \(placemark.locality ?? ""), \(placemark.subLocality ?? ""), \(placemark.administrativeArea ?? ""), \(placemark.postalCode ?? ""), \(placemark.country ?? "")"
                    print("\(address)!!!!!!!!!!!!!!!!!!!!!!")



                } else {
                    print("주소로 변환하지 못했습니다.")
                }
            })
        }

        return address
    }


    func getLocalAPI(lat: CLLocationDegrees, lon: CLLocationDegrees) {
        let url = "https://dapi.kakao.com/v2/local/search/keyword.json?y=\(lat)&x=\(lon)&radius=20000&query=헬스장"

        let header: HTTPHeaders = [
            "Authorization": "KakaoAK 2f5f20aef317fbed29a97436ffab332f"
        ]

        AF.request(url, method: .get, headers: header).responseJSON { response in

            do {
                switch (response.result) {

                case .success:

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



