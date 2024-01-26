//
//  KakaoMapView.swift
//  WorkoutCycle(SwiftUI)
//
//  Created by 이홍렬 on 1/23/24.
//

import Foundation
import KakaoMapsSDK
import SwiftUI
import CoreLocation


struct KakaoMapView: UIViewRepresentable {

    @Binding var draw: Bool
    @Binding var getLat: CLLocationDegrees
    @Binding var getLon: CLLocationDegrees

    /// UIView를 상속한 KMViewContainer를 생성한다.
    /// 뷰 생성과 함께 KMControllerDelegate를 구현한 Coordinator를 생성하고, 엔진을 생성 및 초기화한다.
    func makeUIView(context: Self.Context) -> KMViewContainer {
        let view: KMViewContainer = KMViewContainer()
        view.sizeToFit()
        context.coordinator.createController(view)
        context.coordinator.controller?.initEngine()


        return view
    }


    /// Updates the presented `UIView` (and coordinator) to the latest
    /// configuration.
    /// draw가 true로 설정되면 엔진을 시작하고 렌더링을 시작한다.
    /// draw가 false로 설정되면 렌더링을 멈추고 엔진을 stop한다.
    func updateUIView(_ uiView: KMViewContainer, context: Self.Context) {
        if draw {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {

                context.coordinator.addViews(lat: getLat, lon: getLon)
                context.coordinator.controller?.startEngine()
                context.coordinator.controller?.startRendering()
            }
        } else {
            context.coordinator.controller?.stopRendering()
            context.coordinator.controller?.stopEngine()
        }
    }

    /// Coordinator 생성
    func makeCoordinator() -> KakaoMapCoordinator {
        return KakaoMapCoordinator()
    }

    /// Cleans up the presented `UIView` (and coordinator) in
    /// anticipation of their removal.
    static func dismantleUIView(_ uiView: KMViewContainer, coordinator: KakaoMapCoordinator) {

    }

    /// Coordinator 구현. KMControllerDelegate를 adopt한다.
    class KakaoMapCoordinator: NSObject, MapControllerDelegate {
        func addViews() {

        }
        

        
        var controller: KMController?
        var first: Bool


        override init() {
            first = true
            super.init()
        }

         // KMController 객체 생성 및 event delegate 지정
        func createController(_ view: KMViewContainer) {
            controller = KMController(viewContainer: view)
            controller?.delegate = self
        }

         // KMControllerDelegate Protocol method구현

          /// 엔진 생성 및 초기화 이후, 렌더링 준비가 완료되면 아래 addViews를 호출한다.
          /// 원하는 뷰를 생성한다.
        func addViews(lat: CLLocationDegrees, lon: CLLocationDegrees) {
            let defaultPosition: MapPoint = MapPoint(longitude: lon, latitude: lat)
            let mapviewInfo: MapviewInfo = MapviewInfo(viewName: "mapview", viewInfoName: "map", defaultPosition: defaultPosition)
            print("################\(lat)    \(lon)")
            if controller?.addView(mapviewInfo) == Result.OK {
                let _ = controller?.getView("mapview") as! KakaoMap
            }
        }

        /// KMViewContainer 리사이징 될 때 호출.
        func containerDidResized(_ size: CGSize, lat: CLLocationDegrees, lon: CLLocationDegrees) {
            let mapView: KakaoMap? = controller?.getView("mapview") as? KakaoMap
            mapView?.viewRect = CGRect(origin: CGPoint(x: 0.0, y: 0.0), size: size)
            if first {
                let cameraUpdate: CameraUpdate = CameraUpdate.make(target: MapPoint(longitude: lon, latitude: lat), zoomLevel: 10, mapView: mapView!)
                mapView?.moveCamera(cameraUpdate)
                first = false
            }
        }
    }
}
