//
//  HelperMainMapView.swift
//  RxAdmin
//
//  Created by Banu Ortac on 25.06.2024.
//

import SwiftUI
import heresdk
import CoreLocation

struct HelperMainMapView: UIViewRepresentable {
    
    //@State private var mapView : MapView = MapView.init(frame: .zero)
    @State var mapView : MapView
    @State private var zoomLevel: Double = 13.2
    
    @State var markerClicked: ([MapMarker]) -> Void = {_ in}
    @State var markerClickedFalse: (Bool) -> Void = {_ in }
    @State var onPanStart: () -> Void = {}
    @State var onPanEnd: (GeoCoordinates) -> Void = {_ in }
    
    @State var setMarker: () -> Void = {}
    
    @State var updateMapView: (MapView) -> Void = {_ in }
    
    func makeUIView(context: Self.Context) -> MapView {
        
        mapView.mapScene.loadScene(mapScheme: .normalDay, completion: { mapError in
                
            guard mapError == nil else {
                print("Error: Map scene not loaded1, \(String(describing: mapError))")
                return
            }
            mapView.gestures.tapDelegate = context.coordinator
            mapView.gestures.panDelegate = context.coordinator
            
            mapView.camera.zoomTo(zoomLevel: zoomLevel)
                
            let orientationUpdate = GeoOrientationUpdate(bearing: nil, tilt: 0)
            mapView.camera.setOrientationAtTarget(orientationUpdate)

            if let location = lastLocation{
                mapView.camera.lookAt(point: GeoCoordinates(latitude: Double(location.coordinate.latitude), longitude: location.coordinate.longitude))
            }
            updateMapView(mapView)
        })
        //MapHelpherClass().usageStats()
        return mapView
    }
    
    func updateUIView(_ uiView: heresdk.MapView, context: Context) {
        //
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, LocationDelegate, TapDelegate, PanDelegate {
        
        func onLocationUpdated(_ location: heresdk.Location) {
            //
        }
        
        
        var parent: HelperMainMapView
        private static let defaultGeoCoordinates = GeoCoordinates(latitude: 52.520798, longitude: 13.409408)
        private var myLocation : GeoCoordinates?
        
        //private var routingEngine: RoutingEngine
        //var routeCalculator: RouteCalculator
        private var locationIndicator: LocationIndicator!
        //private var searchEngine: SearchEngine!
        
        init(parent: HelperMainMapView) {
            self.parent = parent
            
            /*do {
                try routingEngine = RoutingEngine()
            } catch let engineInstantiationError {
                fatalError("Failed to initialize routing engine. Cause: \(engineInstantiationError)")
            }
            
            do {
                try searchEngine = SearchEngine()
            } catch let engineInstantiationError {
                fatalError("Failed to initialize engine. Cause: \(engineInstantiationError)")
            }
            
            routeCalculator = RouteCalculator() */
            
            super.init()
            
            /*if let lastLocation = lastLocation {
                addMyLocationToMap(myLocation: Location(coordinates: GeoCoordinates(latitude: lastLocation.coordinate.latitude, longitude: lastLocation.coordinate.longitude)))
                onLocationUpdated(Location(coordinates: GeoCoordinates(latitude: lastLocation.coordinate.latitude, longitude: lastLocation.coordinate.longitude)))
            } else {
                var defaultLocation = Location(coordinates: HelperMainMapView.Coordinator.defaultGeoCoordinates)
                defaultLocation.time = Date()
                addMyLocationToMap(myLocation: defaultLocation)
            }*/
            
            if UIScreen.main.bounds.height == 667 || UIScreen.main.bounds.height == 736 {
                setTransformCenter()
            }
            
        }
        func setTransformCenter() {
            //Haritanın merkez noktasını değiştirme fonksiyonu
            
            //UIScreen.main.bounds.height == 736 -> iphone7plus
            //UIScreen.main.bounds.height == 667 -> iphone6
            
            if UIScreen.main.bounds.height == 667 {
                let birolCenter : Point2D = Point2D(x: UIScreen.main.bounds.width, y: UIScreen.main.bounds.height * 0.5)
                parent.mapView.camera.principalPoint = birolCenter
                parent.mapView.center = CGPoint(x: birolCenter.x, y: birolCenter.y)
            } else {
                let birolCenter : Point2D = Point2D(x: UIScreen.main.bounds.width * 1.5, y: UIScreen.main.bounds.height - (UIScreen.main.bounds.height * 0.25))
                parent.mapView.camera.principalPoint = birolCenter
                parent.mapView.center = CGPoint(x: birolCenter.x, y: birolCenter.y)
            }
            
            let scaleFactor = UIScreen.main.scale
        }
        //harita sürüm geçişi
        ///lokasyon değiştikçe yapılacak işlemler
        /*func onLocationUpdated(_ location: heresdk.Location) {
            myLocation = location.coordinates
            updateMyLocationOnMap(myLocation: location)
        }
        
        ///harita üzerine indicator ekle
        private func addMyLocationToMap(myLocation: Location) {
            
            locationIndicator = LocationIndicator()
            locationIndicator.locationIndicatorStyle = .navigation
            
            parent.mapView.addLifecycleDelegate(locationIndicator)
        }
        ///lokasyon değiştikçe indicatorun yerini değiştir
        private func updateMyLocationOnMap(myLocation: Location) {
            parent.mapView.removeLifecycleDelegate(locationIndicator)
            parent.mapView.addLifecycleDelegate(locationIndicator)
            locationIndicator.updateLocation(myLocation)
        }*/
        ///marker tıklama --- */*
        func onTap(origin: heresdk.Point2D) {
            parent.mapView.pickMapItems(at: origin, radius: 2, completion: onMapItemsPicked)
        }
        func onMapItemsPicked(pickedMapItems: PickMapItemsResult?) {
                // Note that MapMarker items contained in a cluster are not part of pickedMapItems?.markers.
            if let groupingList = pickedMapItems?.markers {
                handlePickedMapMarkerClusters(groupingList)
            }

            // Note that 3D map markers can't be picked yet. Only marker, polgon and polyline map items are pickable.
            guard let topmostMapMarker = pickedMapItems?.markers.first else {
                return
            }

            if let message = topmostMapMarker.metadata?.getString(key: "key_poi") {
                //showDialog(title: "Map Marker picked", message: message)
                return
            }

                //showDialog(title: "Map marker picked:", message: "Location: \(topmostMapMarker.coordinates)")
        }
        private func handlePickedMapMarkerClusters(_ groupingList: [MapMarker]) {
            guard let topmostGrouping = groupingList.first else {
                parent.markerClickedFalse(false)
                return
            }
            parent.markerClicked(groupingList)
        }
        private func getClusterMetadata(_ mapMarker: MapMarker) -> String {
            if let message = mapMarker.metadata?.getString(key: "key_cluster") {
                    return message
            }
            return "No metadata."
        }
        ///marker tıklama */*
        
        ///harita üzerinde sürükleyerek gezme
        func onPan(state: heresdk.GestureState, origin: heresdk.Point2D, translation: heresdk.Point2D, velocity: Double) {
            //parent.tıklamafunc()
            if state == .end {
                parent.onPanEnd(self.parent.mapView.camera.state.targetCoordinates)
            } else if state == .begin {
                parent.onPanStart()
            }
        }
    }
}
