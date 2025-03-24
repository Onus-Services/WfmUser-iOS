//
//  MapHelpherClass.swift
//  RxAdmin
//
//  Created by Banu Ortac on 24.06.2024.
//

import Foundation
import UIKit
import heresdk
import SwiftUI

extension MapView {
    
    func setBoundingBox(coordinates: [GeoCoordinates]) {
        var minLatitude = coordinates.first?.latitude ?? 0.0
        var maxLatitude = coordinates.first?.latitude ?? 0.0
        var minLongitude = coordinates.first?.longitude ?? 0.0
        var maxLongitude = coordinates.first?.longitude ?? 0.0

        for coordinate in coordinates {
            minLatitude = min(minLatitude, coordinate.latitude)
            maxLatitude = max(maxLatitude, coordinate.latitude)
            minLongitude = min(minLongitude, coordinate.longitude)
            maxLongitude = max(maxLongitude, coordinate.longitude)
        }
        let southWestCoordinate = GeoCoordinates(latitude: minLatitude - 0.04, longitude: minLongitude - 0.04)
        let northEastCoordinate = GeoCoordinates(latitude: maxLatitude + 0.04, longitude: maxLongitude + 0.04)
        let boundingBox = GeoBox(southWestCorner: southWestCoordinate, northEastCorner: northEastCoordinate)
        
        self.camera.lookAt(area: boundingBox, orientation: GeoOrientationUpdate(GeoOrientation(bearing: 0, tilt: 0)))
    }
    
    func setHereCenter() {
        self.camera.lookAt(point: GeoCoordinates(latitude: lastLocation?.coordinate.latitude ?? -1.0, longitude: lastLocation?.coordinate.longitude ?? -1.0))
        
    }
    
    func setHereCenterCoordinate(latitude: Double, longitude: Double) {
        self.camera.zoomTo(zoomLevel: 15)
        self.camera.lookAt(point: GeoCoordinates(latitude: latitude, longitude: longitude))
    }
    
    func setHereMapType(isClassicMap: Bool) {
        if isClassicMap {
            self.mapScene.loadScene(mapScheme: .normalDay, completion: { mapError in
                
                guard mapError == nil else {
                    print("Error: Map scene not loaded, \(String(describing: mapError))")
                    return
                }

            })
        } else {
            self.mapScene.loadScene(mapScheme: .satellite, completion: { mapError in
                
                guard mapError == nil else {
                    print("Error: Map scene not loaded, \(String(describing: mapError))")
                    return
                }

            })
        }
        
    }
    
    func setHereTraffic(isTraffic: Bool) {
        if isTraffic {
            self.mapScene.enableFeatures([MapFeatures.trafficFlow : MapFeatureModes.trafficFlowWithFreeFlow])
                    // MapFeatures.trafficIncidents renders traffic icons and lines to indicate the location of incidents.
            self.mapScene.enableFeatures([MapFeatures.trafficIncidents: MapFeatureModes.defaultMode])
        } else {
            self.mapScene.disableFeatures([MapFeatures.trafficFlow, MapFeatures.trafficIncidents])
        }
        
    }
    
    //harita sürüm geçişi
    /*func updateMapRoute(with route: Route?, pixels: Double, color: UIColor) -> MapPolyline? {
        guard let unwrappedRoute = route else { return nil }
        
        let routeGeoPolyline = unwrappedRoute.geometry
        //let widthInPixels = 10.0
        
        //renk değiştirme
        let routeMapPolyline = MapPolyline(geometry: routeGeoPolyline, widthInPixels: pixels, color: color)
        
        //mapPolyline = routeMapPolyline
        //self.mapScene.addMapPolyline(routeMapPolyline)
        return routeMapPolyline
    }
    
    func updateMapRoute1(with route: Route?, pixels: Double, color: UIColor, polyline: @escaping (MapPolyline) -> Void) {
        guard let unwrappedRoute = route else { return }
        
        let routeGeoPolyline = unwrappedRoute.geometry
        
        //renk değiştirme
        let routeMapPolyline = MapPolyline(geometry: routeGeoPolyline, widthInPixels: pixels, color: color)
        
        //mapPolyline = routeMapPolyline
        self.mapScene.addMapPolyline(routeMapPolyline)
        polyline(routeMapPolyline)
        //return routeMapPolyline
    } */
    
}

extension Route {
    func boundingBox2() -> GeoBox {
        //-0.06 -0.04
        //+0.04 +0.04
        let geoCoordinatesSouthWestCorner: GeoCoordinates = GeoCoordinates(latitude: self.boundingBox.southWestCorner.latitude - 0.06, longitude: self.boundingBox.southWestCorner.longitude - 0.04)
        let geoCoordinatesNorthEastCorner: GeoCoordinates = GeoCoordinates(latitude: self.boundingBox.northEastCorner.latitude + 0.04, longitude: self.boundingBox.northEastCorner.longitude + 0.04)
        let boundingBox: GeoBox = GeoBox(southWestCorner: geoCoordinatesSouthWestCorner, northEastCorner: geoCoordinatesNorthEastCorner)
        return boundingBox
    }
    
    func boundingBoxNewOrder() -> GeoBox {
        //-0.12 -0.08
        //+0.08 +0.08
        let geoCoordinatesSouthWestCorner: GeoCoordinates = GeoCoordinates(latitude: self.boundingBox.southWestCorner.latitude - 0.08, longitude: self.boundingBox.southWestCorner.longitude - 0.08)
        let geoCoordinatesNorthEastCorner: GeoCoordinates = GeoCoordinates(latitude: self.boundingBox.northEastCorner.latitude + 0.12, longitude: self.boundingBox.northEastCorner.longitude + 0.12)
        let boundingBox: GeoBox = GeoBox(southWestCorner: geoCoordinatesSouthWestCorner, northEastCorner: geoCoordinatesNorthEastCorner)
        return boundingBox
    }
}

/*var routingEngine12: RoutingEngine? */
var searchEngine12: SearchEngine?

struct MapHelpherClass {
    
    
    init() {
        /*if routingEngine12 == nil {
            do {
                try routingEngine12 = RoutingEngine()
            } catch let engineInstantiationError {
                fatalError("Failed to initialize routing engine. Cause: \(engineInstantiationError)")
            }
        } */
        
        if searchEngine12 == nil {
            do {
                try searchEngine12 = SearchEngine()
            } catch let engineInstantiationError {
                fatalError("Failed to initialize engine. Cause: \(engineInstantiationError)")
            }
        }
    }
    
    
    func onLocationUpdated(locationIndicator: LocationIndicator, _ location: heresdk.Location) {
        locationIndicator.updateLocation(location)
    }
    
    func createMapPolygon(geoCoordinates: [GeoCoordinates], color: UIColor) -> MapPolygon {
        
        let coordinates = geoCoordinates
        let geoPolygon = try! GeoPolygon(vertices: coordinates)
        let fillColor = color.withAlphaComponent(0.3)
        var mapPolygon = MapPolygon(geometry: geoPolygon, color: fillColor)
        
        return mapPolygon
    }
    
    func createMarkerAddressBook(point: PointModel, week: Bool = false, isSenaryo: Bool = false, kritikGun: [String] = [], markerArray: @escaping ([MapMarker]) -> Void) {
        guard let imageData = markerFuncAddressBook(point: point, week: week, isSenaryo: isSenaryo, kritikGun: kritikGun).pngData() else {
            let markerImageData = UIImage(systemName: "circle.fill")!.pngData()
            let markerI = MapImage(pixelData: markerImageData!, imageFormat: ImageFormat.png)
            markerArray([MapMarker(at: GeoCoordinates(latitude: Double(point.enlem) ?? -1.0, longitude: Double(point.boylam) ?? -1.0), image: markerI)])
            return
        }
        let markerImageSender = MapImage(pixelData: imageData, imageFormat: ImageFormat.png)
    
        let anchor2D = Anchor2D(horizontal: 0.5, vertical: 1.0)
        var mapMarkerSender = MapMarker(at: GeoCoordinates(latitude: Double(point.enlem) ?? -1.0, longitude: Double(point.boylam) ?? -1.0), image: markerImageSender, anchor: anchor2D)
        let metadata = Metadata()
        metadata.setString(key: MarkerTypesKey.pointMarkerId, value: "\(point.takipId)")
        mapMarkerSender.metadata = metadata
        markerArray([mapMarkerSender])
    }
    
    func markerFuncAddressBook(point: PointModel, week: Bool, isSenaryo: Bool, kritikGun: [String]) -> UIImage {
        return createMarkerViewAddressBook(point: point, week: week, isSenaryo: isSenaryo, kritikGun: kritikGun)!
    }
    
    func createMarkerViewAddressBook(point: PointModel, week: Bool, isSenaryo: Bool, kritikGun: [String]) -> UIImage? {
        if week {
            return getMarkerAddressBookSenaryo(point: point, kritikGun: kritikGun).asImage1()
        } else {
            return getMarkerAddressBook(point: point).asImage1()
        }
        
        /*if point.special2 == "MAGAZA" {
            if isSenaryo {
                return getMarkerAddressBookSenaryo(point: point, kritikGun: kritikGun).asImage1()
            } else {
                return getMarkerAddressBook(point: point).asImage1()
            }
        } else if point.special2 == "MERCH" {
            return getMarkerAddressBookMerch(point: point).asImage1()
        } else if point.special2 == "CENTER" {
            return getMarkerAddressBookCenter(point: point).asImage1()
        } else {
            return getMarkerAddressBook(point: point).asImage1()
        }
        */
    }
    
    /*func createMarkerAddressBook(point: RoutePoint, isSenaryo: Bool = false, kritikGun: [String] = [], markerArray: @escaping ([MapMarker]) -> Void) {
        guard let imageData = markerFuncAddressBook(point: point, isSenaryo: isSenaryo, kritikGun: kritikGun).pngData() else {
            let markerImageData = UIImage(systemName: "circle.fill")!.pngData()
            let markerI = MapImage(pixelData: markerImageData!, imageFormat: ImageFormat.png)
            markerArray([MapMarker(at: GeoCoordinates(latitude: point.latitude, longitude: point.longitude), image: markerI)])
            return
        }
        let markerImageSender = MapImage(pixelData: imageData, imageFormat: ImageFormat.png)
    
        let anchor2D = Anchor2D(horizontal: 0.5, vertical: 1.0)
        var mapMarkerSender = MapMarker(at: GeoCoordinates(latitude: point.latitude, longitude: point.longitude), image: markerImageSender, anchor: anchor2D)
        let metadata = Metadata()
        metadata.setString(key: MarkerTypesKey.pointMarkerId, value: "\(point.mxRoutePointBookId)")
        mapMarkerSender.metadata = metadata
        markerArray([mapMarkerSender])
    } */
    
    /*func markerFuncAddressBook(point: RoutePoint, isSenaryo: Bool, kritikGun: [String]) -> UIImage {
        return createMarkerViewAddressBook(point: point, isSenaryo: isSenaryo, kritikGun: kritikGun)!
    }*/
    
    /*func createMarkerViewAddressBook(point: RoutePoint, isSenaryo: Bool, kritikGun: [String]) -> UIImage? {
        if point.special2 == "MAGAZA" {
            if isSenaryo {
                return getMarkerAddressBookSenaryo(point: point, kritikGun: kritikGun).asImage1()
            } else {
                return getMarkerAddressBook(point: point).asImage1()
            }
        } else if point.special2 == "MERCH" {
            return getMarkerAddressBookMerch(point: point).asImage1()
        } else if point.special2 == "CENTER" {
            return getMarkerAddressBookCenter(point: point).asImage1()
        } else {
            return getMarkerAddressBook(point: point).asImage1()
        }
        
    }*/
    
    /*func createMarkerRoutePlanPointMarker(point: RoutePlanOperation, markerArray: @escaping ([MapMarker]) -> Void) {
        guard let imageData = markerFuncRoutePlanPointMarker(point: point).pngData() else {
            let markerImageData = UIImage(systemName: "circle.fill")!.pngData()
            let markerI = MapImage(pixelData: markerImageData!, imageFormat: ImageFormat.png)
            markerArray([MapMarker(at: GeoCoordinates(latitude: Double(point.Latitude) ?? -1.0, longitude: Double(point.Longitude) ?? -1.0), image: markerI)])
            return
        }
        let markerImageSender = MapImage(pixelData: imageData, imageFormat: ImageFormat.png)
    
        let anchor2D = Anchor2D(horizontal: 0.5, vertical: 1.0)
        var mapMarkerSender = MapMarker(at: GeoCoordinates(latitude: Double(point.Latitude) ?? -1.0, longitude: Double(point.Longitude) ?? -1.0), image: markerImageSender, anchor: anchor2D)
        let metadata = Metadata()
        metadata.setString(key: MarkerTypesKey.pointMarkerId, value: "\(point.MxRoutePointsId)")
        mapMarkerSender.metadata = metadata
        markerArray([mapMarkerSender])
    }*/
    
    /*func markerFuncRoutePlanPointMarker(point: RoutePlanOperation) -> UIImage {
        return createMarkerViewRoutePlanPointMarker(point: point)!
    }*/
    
    /*func createMarkerViewRoutePlanPointMarker(point: RoutePlanOperation) -> UIImage? {
        if point.Special2 == "MAGAZA" {
            if point.ExecStatus == "130006" {
                return getMarkerRoutePlanTamamlandi(point: point).asImage1()
            } else if point.ExecStatus == "130503" {
                return getMarkerRoutePlanDuraklama(point: point).asImage1()
            } else if point.ExecStatus == "130501" {
                return getMarkerRoutePlanFarkliGun(point: point).asImage1()
            } else if point.ExecStatus == "130502" {
                return getMarkerRoutePlanBolgeDisi(point: point).asImage1()
            }
        } else if point.Special2 == "CENTER" {
            return getMarkerRoutePlanDepo(point: point).asImage1()
        }
        return getMarkerRoutePlanTamamlandi(point: point).asImage1()
        
    }*/
    
    /*func createMarkerRoutePlanTraceMarker(index: Int, point: VehicleTraceModel, colorList: [Color], markerArray: @escaping ([MapMarker]) -> Void) {
        guard let imageData = markerFuncRoutePlanTraceMarker(index: index, point: point, colorList: colorList).pngData() else {
            let markerImageData = UIImage(systemName: "circle.fill")!.pngData()
            let markerI = MapImage(pixelData: markerImageData!, imageFormat: ImageFormat.png)
            markerArray([MapMarker(at: GeoCoordinates(latitude: Double(point.Latitude) ?? -1.0, longitude: Double(point.Longitude) ?? -1.0), image: markerI)])
            return
        }
        let markerImageSender = MapImage(pixelData: imageData, imageFormat: ImageFormat.png)
    
        let anchor2D = Anchor2D(horizontal: 0.5, vertical: 1.0)
        var mapMarkerSender = MapMarker(at: GeoCoordinates(latitude: Double(point.Latitude) ?? -1.0, longitude: Double(point.Longitude) ?? -1.0), image: markerImageSender, anchor: anchor2D)
        let metadata = Metadata()
        metadata.setString(key: MarkerTypesKey.pointMarkerId, value: "\(point.MxRoutePointsId)")
        mapMarkerSender.metadata = metadata
        markerArray([mapMarkerSender])
    }*/
    
    /*func markerFuncRoutePlanTraceMarker(index: Int, point: VehicleTraceModel, colorList: [Color]) -> UIImage {
        return createMarkerViewRouteTracePointMarker(index: index, point: point, colorList: colorList)!
    }*/
    
    /*func createMarkerViewRouteTracePointMarker(index: Int, point: VehicleTraceModel, colorList: [Color]) -> UIImage? {
        return getMarkerTrace(color: colorList[index], sequence: "\(index + 1)").asImage1()
    }*/
    
    func removeCoordinate(from coordinates: inout [GeoCoordinates], coordinateToRemove: GeoCoordinates) {
        if let index = coordinates.firstIndex(of: coordinateToRemove) {
            coordinates.remove(at: index)
        }
    }
    
    func reverseGeocode(coordinates: GeoCoordinates, resultHandler:@escaping (Place?) -> ()){
        
        var reverseGeocodingOptions: SearchOptions = SearchOptions()
        reverseGeocodingOptions.languageCode = LanguageCode.trTr
        reverseGeocodingOptions.maxItems = 1
        
        _ = searchEngine12!.search(coordinates: coordinates,
                            options: reverseGeocodingOptions,
                                completion: {error, items in
            if let searchError = error {
                print("Search Error: \(searchError)")
                return
            }

            if let places = items{
                if let firstPlace = places.first{
                    resultHandler(firstPlace)
                }
            }
        })
        

    }
}

struct MarkerTypes {
    static let point = 1
    static let current = 2
}

struct MarkerTypesKey {
    static let markerType = "markerType"
    static let pointMarkerId = "pointMarkerId"
}

extension UIView {
    func asImage1() -> UIImage? {
        if #available(iOS 10.0, *){
            let renderer = UIGraphicsImageRenderer(bounds: bounds)
            return renderer.image { rendererContext in
                layer.render(in: rendererContext.cgContext)
            }
        } else {
            guard let context = UIGraphicsGetCurrentContext() else {
                return nil
            }
            UIGraphicsBeginImageContext(self.frame.size)
            self.layer.render(in: context)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            guard let cgImage = image?.cgImage else {
                return nil
            }
            return UIImage(cgImage: cgImage)
        }
    }
}

func getMarkerAddressBook(point: PointModel) -> UIView {
    let markerView: UIView = UIView()
    markerView.frame = CGRect(x: 0, y: 0, width: 50, height: 60)
    
    let blackBorder: UIImageView = UIImageView()
    blackBorder.image = UIImage(named: "gray1")
    blackBorder.frame = CGRect(x: 0, y: 0, width: 50, height: 60)
    
    let innerCircle: UIImageView = UIImageView()
    innerCircle.image = UIImage(systemName: "circle.fill")
    innerCircle.frame = CGRect(x: 10, y: 8, width: 30, height: 30)
    
    let labelNameSequence: UILabel = UILabel()
    labelNameSequence.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
    labelNameSequence.font = UIFont(name: fontsMedium, size: 12)
    labelNameSequence.text = "\(point.sira)"
    labelNameSequence.textAlignment = .center
    
    blackBorder.tintColor = UIColor(Color.MyColor.releaseNoteBlueText)
    innerCircle.tintColor = UIColor(Color.MyColor.bottomMenuBlueColor)
    labelNameSequence.textColor = .white
    
    innerCircle.addSubview(labelNameSequence)
    
    markerView.addSubview(blackBorder)
    markerView.addSubview(innerCircle)
    
    return markerView
}

func getMarkerAddressBookSenaryo(point: PointModel, kritikGun: [String]) -> UIView {
    let markerView: UIView = UIView()
    markerView.frame = CGRect(x: 0, y: 0, width: 50, height: 60)
    
    let blackBorder: UIImageView = UIImageView()
    blackBorder.image = UIImage(named: "gray1")
    blackBorder.frame = CGRect(x: 0, y: 0, width: 50, height: 60)
    
    let innerCircle: UIView = UIView()
    innerCircle.frame = CGRect(x: 10, y: 8, width: 30, height: 30)
    innerCircle.layer.cornerRadius = 15
    innerCircle.clipsToBounds = true
    
    let labelNameSequence: UILabel = UILabel()
    labelNameSequence.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
    labelNameSequence.font = UIFont(name: fontsMedium, size: 12)
    labelNameSequence.textAlignment = .center
    labelNameSequence.textColor = .black
    
    /*if kritikGun == [] {
        let pointKritikGunArray = point.kritikGun.components(separatedBy: ",")
        let siraliDizi = pointKritikGunArray.sorted()
        for sirali in siraliDizi {
            if let index = pointKritikGunArray.firstIndex(where: { $0 == sirali }) {
                let listSequenceArray = point.sira.components(separatedBy: ",")
                
                if index < listSequenceArray.count {
                    labelNameSequence.text = "\(listSequenceArray[index])"
                } else {
                    print("Hata: Geçersiz index \(index), listSequenceArray boyutu \(listSequenceArray.count)")
                }
                break
            }
        }
    } else {
        let siraliDizi = kritikGun.sorted()
        let pointKritikGunArray = point.kritikGun.components(separatedBy: ",")
        print("siraliDizisiraliDizi - \(siraliDizi)")
        print("pointKritikGunArray - \(pointKritikGunArray)")
        for sirali in siraliDizi {
            print("siralisirali - \(sirali)")
            if let index = pointKritikGunArray.firstIndex(where: { $0 == sirali }) {
                print("indexindex - \(index)")
                let listSequenceArray = point.sira.components(separatedBy: ",")
                
                if index < listSequenceArray.count {
                    labelNameSequence.text = "\(listSequenceArray[index])"
                } else {
                    labelNameSequence.text = "\(point.sira)"
                    print("Hata: Geçersiz index \(index), listSequenceArray boyutu \(listSequenceArray.count)")
                }
                break
            }
        }
    } */
    
    labelNameSequence.text = "\(point.sira)"
    
    blackBorder.tintColor = UIColor(Color(hex1: point.vehicleColor))
    //blackBorder.tintColor = UIColor(Color.black)
    
    let sliceCount = min(max(point.haftaninGunu.components(separatedBy: ",").count, 1), 7)
    addColorSlices(to: innerCircle, sliceCount: sliceCount, kritikGun: point.haftaninGunu)
    
    innerCircle.addSubview(labelNameSequence)
    
    markerView.addSubview(blackBorder)
    markerView.addSubview(innerCircle)
    
    return markerView
}

func addColorSlices(to view: UIView, sliceCount: Int, kritikGun: String = "") {
    //getDayColor
    var color1 = UIColor(Color(red: 236/255, green: 31/255, blue: 32/255))
    var color2 = UIColor(Color(red: 21/255, green: 29/255, blue: 246/255))
    var color3 = UIColor(Color(red: 53/255, green: 193/255, blue: 0/255))
    var color4 = UIColor(Color(red: 212/255, green: 163/255, blue: 0/255))
    var color5 = UIColor(Color(red: 0/255, green: 217/255, blue: 217/255))
    var color6 = UIColor(Color(red: 207/255, green: 152/255, blue: 254/255))
    var color7 = UIColor(Color(red: 238/255, green: 220/255, blue: 0/255))
    
    var colors1: [UIColor] = [color1, color2, color3, color4, color5, color6, color7]
    
    var kritik = kritikGun.components(separatedBy: ",")
    switch kritik.count {
    case 1:
        color1 = UIColor(getDayColor(for: kritik[0]))
        colors1 = [color1]
    case 2:
        color1 = UIColor(getDayColor(for: kritik[0]))
        color2 = UIColor(getDayColor(for: kritik[1]))
        colors1 = [color1, color2]
    case 3:
        color1 = UIColor(getDayColor(for: kritik[0]))
        color2 = UIColor(getDayColor(for: kritik[1]))
        color3 = UIColor(getDayColor(for: kritik[2]))
        colors1 = [color1, color2, color3]
    case 4:
        color1 = UIColor(getDayColor(for: kritik[0]))
        color2 = UIColor(getDayColor(for: kritik[1]))
        color3 = UIColor(getDayColor(for: kritik[2]))
        color4 = UIColor(getDayColor(for: kritik[3]))
        colors1 = [color1, color2, color3, color4]
    case 5:
        color1 = UIColor(getDayColor(for: kritik[0]))
        color2 = UIColor(getDayColor(for: kritik[1]))
        color3 = UIColor(getDayColor(for: kritik[2]))
        color4 = UIColor(getDayColor(for: kritik[3]))
        color5 = UIColor(getDayColor(for: kritik[4]))
        colors1 = [color1, color2, color3, color4, color5]
    case 6:
        color1 = UIColor(getDayColor(for: kritik[0]))
        color2 = UIColor(getDayColor(for: kritik[1]))
        color3 = UIColor(getDayColor(for: kritik[2]))
        color4 = UIColor(getDayColor(for: kritik[3]))
        color5 = UIColor(getDayColor(for: kritik[4]))
        color6 = UIColor(getDayColor(for: kritik[5]))
        colors1 = [color1, color2, color3, color4, color5, color6]
    case 7:
        color1 = UIColor(getDayColor(for: kritik[0]))
        color2 = UIColor(getDayColor(for: kritik[1]))
        color3 = UIColor(getDayColor(for: kritik[2]))
        color4 = UIColor(getDayColor(for: kritik[3]))
        color5 = UIColor(getDayColor(for: kritik[4]))
        color6 = UIColor(getDayColor(for: kritik[5]))
        color7 = UIColor(getDayColor(for: kritik[6]))
        colors1 = [color1, color2, color3, color4, color5, color6, color7]
    default:
        print("<")
    }
    
    
    
    let colors: [UIColor] = [UIColor(Color(red: 236/255, green: 31/255, blue: 32/255)),
                             UIColor(Color(red: 21/255, green: 29/255, blue: 246/255)),
                             UIColor(Color(red: 53/255, green: 193/255, blue: 0/255)),
                             UIColor(Color(red: 212/255, green: 163/255, blue: 0/255)),
                             UIColor(Color(red: 0/255, green: 217/255, blue: 217/255)),
                             UIColor(Color(red: 207/255, green: 152/255, blue: 254/255)),
                             UIColor(Color(red: 238/255, green: 220/255, blue: 0/255))]
    let center = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
    let radius = view.bounds.width / 2
    
    for i in 0..<sliceCount {
        let startAngle = CGFloat(i) * (2 * .pi / CGFloat(sliceCount))
        let endAngle = CGFloat(i + 1) * (2 * .pi / CGFloat(sliceCount))
        
        let path = UIBezierPath()
        path.move(to: center)
        path.addArc(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        path.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = colors1[i % colors1.count].cgColor
        
        view.layer.addSublayer(shapeLayer)
    }
    
    /*for i in 0..<sliceCount {
        let startAngle = CGFloat(i) * (2 * .pi / CGFloat(sliceCount))
        let endAngle = CGFloat(i + 1) * (2 * .pi / CGFloat(sliceCount))
        
        let path = UIBezierPath()
        path.move(to: center)
        path.addArc(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        path.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = colors[i % colors.count].cgColor
        
        view.layer.addSublayer(shapeLayer)
    } */
    
}



//---//

func getMarkerTrace(color: Color, sequence: String) -> UIView {
    let markerView: UIView = UIView()
    markerView.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
    
    let blackBorder: UIImageView = UIImageView()
    blackBorder.image = UIImage(systemName: "circle.fill")
    blackBorder.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
    blackBorder.tintColor = .black
    
    let innerCircle: UIImageView = UIImageView()
    innerCircle.image = UIImage(systemName: "circle.fill")
    innerCircle.frame = CGRect(x: 1.5, y: 1.5, width: 22, height: 22)
    innerCircle.tintColor = UIColor(color)
    
    let labelNameSequence: UILabel = UILabel()
    labelNameSequence.frame = CGRect(x: 0, y: 0, width: 22, height: 22)
    labelNameSequence.font = UIFont(name: fontsMedium, size: 12)
    labelNameSequence.text = sequence
    labelNameSequence.textColor = .black
    labelNameSequence.textAlignment = .center
    
    innerCircle.addSubview(labelNameSequence)
    
    markerView.addSubview(blackBorder)
    markerView.addSubview(innerCircle)
    
    return markerView
}

/*func getMarkerAddressBook(point: RoutePoint) -> UIView {
    let markerView: UIView = UIView()
    //markerView.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
    markerView.frame = CGRect(x: 0, y: 0, width: 50, height: 60)
    
    let blackBorder: UIImageView = UIImageView()
    //blackBorder.image = UIImage(systemName: "circle.fill")
    blackBorder.image = UIImage(named: "gray1")
    //blackBorder.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
    blackBorder.frame = CGRect(x: 0, y: 0, width: 50, height: 60)
    //blackBorder.tintColor = .black
    
    let innerCircle: UIImageView = UIImageView()
    innerCircle.image = UIImage(systemName: "circle.fill")
    //innerCircle.frame = CGRect(x: 2.5, y: 2.5, width: 30, height: 30)
    innerCircle.frame = CGRect(x: 10, y: 8, width: 30, height: 30)
    //innerCircle.tintColor = UIColor(Color(hex1: color))
    
    let labelNameSequence: UILabel = UILabel()
    labelNameSequence.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
    labelNameSequence.font = UIFont(name: fontsMedium, size: 12)
    labelNameSequence.text = "\(point.special3)"
    //labelNameSequence.textColor = .black
    labelNameSequence.textAlignment = .center
    
    blackBorder.tintColor = UIColor(Color(hex1: point.merchColor))
    innerCircle.tintColor = UIColor(getFrekansMatrixColor(for: point.special3))
    labelNameSequence.textColor = .black
    
    innerCircle.addSubview(labelNameSequence)
    
    markerView.addSubview(blackBorder)
    markerView.addSubview(innerCircle)
    
    return markerView
} */

/*func getMarkerAddressBookSenaryo(point: RoutePoint, kritikGun: [String]) -> UIView {
    let markerView: UIView = UIView()
    //markerView.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
    markerView.frame = CGRect(x: 0, y: 0, width: 50, height: 60)
    
    let blackBorder: UIImageView = UIImageView()
    //blackBorder.image = UIImage(systemName: "circle.fill")
    blackBorder.image = UIImage(named: "gray1")
    //blackBorder.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
    blackBorder.frame = CGRect(x: 0, y: 0, width: 50, height: 60)
    
    let innerCircle: UIView = UIView()
    //innerCircle.frame = CGRect(x: 4, y: 4, width: 27, height: 27)
    innerCircle.frame = CGRect(x: 10, y: 8, width: 30, height: 30)
    innerCircle.layer.cornerRadius = 15
    innerCircle.clipsToBounds = true
    
    let labelNameSequence: UILabel = UILabel()
    labelNameSequence.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
    labelNameSequence.font = UIFont(name: fontsMedium, size: 12)
    labelNameSequence.textAlignment = .center
    labelNameSequence.textColor = .black
    
    if kritikGun == [] {
        let pointKritikGunArray = point.kritikGun.components(separatedBy: ",")
        let siraliDizi = pointKritikGunArray.sorted()
        for sirali in siraliDizi {
            if let index = pointKritikGunArray.firstIndex(where: { $0 == sirali }) {
                let listSequenceArray = point.listSequence.components(separatedBy: ",")
                
                if index < listSequenceArray.count {
                    labelNameSequence.text = "\(listSequenceArray[index])"
                } else {
                    print("Hata: Geçersiz index \(index), listSequenceArray boyutu \(listSequenceArray.count)")
                }
                break
            }
        }
        //labelNameSequence.text = "\(point.listSequence)"
    } else {
        let siraliDizi = kritikGun.sorted()
        print("siraliDizi - \(siraliDizi)")
        print("point.kritikGun - \(point.kritikGun)")
        let pointKritikGunArray = point.kritikGun.components(separatedBy: ",")
        print("pointKritikGunArray - \(pointKritikGunArray)")
        /*if let index = pointKritikGunArray.firstIndex(where: { $0 == siraliDizi[0] }) {
            print("indexindex - \(index)")
            print("listSequence - \(point.listSequence)")
            let listSequenceArray = point.listSequence.components(separatedBy: ",")
            print("listSequenceArraylistSequenceArray - \(listSequenceArray)")
            print("listSequenceArray- \(listSequenceArray[index])")
            labelNameSequence.text = "\(listSequenceArray[index])"
        } */
        
        for sirali in siraliDizi {
            if let index = pointKritikGunArray.firstIndex(where: { $0 == sirali }) {
                let listSequenceArray = point.listSequence.components(separatedBy: ",")
                
                if index < listSequenceArray.count {
                    labelNameSequence.text = "\(listSequenceArray[index])"
                } else {
                    print("Hata: Geçersiz index \(index), listSequenceArray boyutu \(listSequenceArray.count)")
                }
                break
            }
        }
    }
    
    blackBorder.tintColor = UIColor(Color(hex1: point.merchColor))
    
    let sliceCount = min(max(point.kritikGun.components(separatedBy: ",").count, 1), 7)
    addColorSlices(to: innerCircle, sliceCount: sliceCount)
    
    innerCircle.addSubview(labelNameSequence)
    
    markerView.addSubview(blackBorder)
    markerView.addSubview(innerCircle)
    
    return markerView
} */



/*func getMarkerAddressBookMerch(point: RoutePoint) -> UIView {

    let markerView: UIView = UIView()
    markerView.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
    
    let imageView: UIImageView = UIImageView()
    imageView.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
    imageView.image = UIImage(named: ImageConstants.mapVehicleMarker.rawValue)
    
    imageView.tintColor = UIColor(Color.init(hex1: point.color))
    
    imageView.contentMode = .scaleAspectFit
    markerView.addSubview(imageView)
    
    return markerView
} */

/*func getMarkerAddressBookCenter(point: RoutePoint) -> UIView {
    let markerView: UIView = UIView()
    markerView.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
    
    let imageView: UIImageView = UIImageView()
    imageView.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
    imageView.image = UIImage(named: ImageConstants.seciliIsMarkerFinish.rawValue)
    
    imageView.contentMode = .scaleAspectFit
    markerView.addSubview(imageView)
    
    return markerView
} */

func getMarkerOlumlu(color: String, sequence: String, isDonePoint: Bool = false, isNegDone: Bool = false) -> UIView {
    let markerView: UIView = UIView()
    markerView.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
    
    let blackBorder: UIImageView = UIImageView()
    blackBorder.image = UIImage(systemName: "circle.fill")
    blackBorder.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
    //blackBorder.tintColor = .black
    
    let innerCircle: UIImageView = UIImageView()
    innerCircle.image = UIImage(systemName: "circle.fill")
    innerCircle.frame = CGRect(x: 1.5, y: 1.5, width: 32, height: 32)
    //innerCircle.tintColor = UIColor(Color(hex1: color))
    
    let labelNameSequence: UILabel = UILabel()
    labelNameSequence.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
    labelNameSequence.font = UIFont(name: fontsMedium, size: 12)
    labelNameSequence.text = sequence
    //labelNameSequence.textColor = .black
    labelNameSequence.textAlignment = .center
    
    if isDonePoint {
        blackBorder.tintColor = isNegDone ? .red : .white
        innerCircle.tintColor = UIColor(Color(hex1: "#0A5C36"))
        labelNameSequence.textColor = .white
    } else {
        blackBorder.tintColor = .black
        innerCircle.tintColor = UIColor(Color(hex1: color))
        labelNameSequence.textColor = .black
    }
    
    innerCircle.addSubview(labelNameSequence)
    
    markerView.addSubview(blackBorder)
    markerView.addSubview(innerCircle)
    
    return markerView
}

/*
func getMarkerRoutePlanDuraklama(point: RoutePlanOperation) -> UIView {
    let markerView: UIView = UIView()
    markerView.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
    
    let blackBorder: UIImageView = UIImageView()
    blackBorder.image = UIImage(systemName: "hexagon.fill")
    blackBorder.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
    //blackBorder.tintColor = .black
    
    let innerCircle: UIImageView = UIImageView()
    innerCircle.image = UIImage(systemName: "hexagon.fill")
    innerCircle.frame = CGRect(x: 2.5, y: 2.5, width: 30, height: 30)
    //innerCircle.tintColor = UIColor(Color(hex1: color))
    
    let labelNameSequence: UILabel = UILabel()
    labelNameSequence.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
    labelNameSequence.font = UIFont(name: fontsMedium, size: 12)
    labelNameSequence.text = "\(point.ListSequence)"
    //labelNameSequence.textColor = .black
    labelNameSequence.textAlignment = .center
    
    blackBorder.tintColor = UIColor.black
    innerCircle.tintColor = UIColor.green
    labelNameSequence.textColor = .black
    
    innerCircle.addSubview(labelNameSequence)
    
    markerView.addSubview(blackBorder)
    markerView.addSubview(innerCircle)
    
    return markerView
}

func getMarkerRoutePlanFarkliGun(point: RoutePlanOperation) -> UIView {
    let markerView: UIView = UIView()
    markerView.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
    
    let blackBorder: UIImageView = UIImageView()
    blackBorder.image = UIImage(systemName: "triangle.fill")
    blackBorder.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
    //blackBorder.tintColor = .black
    
    let innerCircle: UIImageView = UIImageView()
    innerCircle.image = UIImage(systemName: "triangle.fill")
    innerCircle.frame = CGRect(x: 2.5, y: 2.5, width: 30, height: 30)
    //innerCircle.tintColor = UIColor(Color(hex1: color))
    
    let labelNameSequence: UILabel = UILabel()
    labelNameSequence.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
    labelNameSequence.font = UIFont(name: fontsMedium, size: 12)
    labelNameSequence.text = "\(point.ListSequence)"
    //labelNameSequence.textColor = .black
    labelNameSequence.textAlignment = .center
    
    blackBorder.tintColor = UIColor.black
    innerCircle.tintColor = UIColor.red
    labelNameSequence.textColor = .black
    
    innerCircle.addSubview(labelNameSequence)
    
    markerView.addSubview(blackBorder)
    markerView.addSubview(innerCircle)
    
    return markerView
}

func getMarkerRoutePlanBolgeDisi(point: RoutePlanOperation) -> UIView {
    let markerView: UIView = UIView()
    markerView.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
    
    let blackBorder: UIImageView = UIImageView()
    blackBorder.image = UIImage(systemName: "rhombus.fill")
    blackBorder.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
    //blackBorder.tintColor = .black
    
    let innerCircle: UIImageView = UIImageView()
    innerCircle.image = UIImage(systemName: "rhombus.fill")
    innerCircle.frame = CGRect(x: 2.5, y: 2.5, width: 30, height: 30)
    //innerCircle.tintColor = UIColor(Color(hex1: color))
    
    let labelNameSequence: UILabel = UILabel()
    labelNameSequence.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
    labelNameSequence.font = UIFont(name: fontsMedium, size: 12)
    labelNameSequence.text = "\(point.ListSequence)"
    //labelNameSequence.textColor = .black
    labelNameSequence.textAlignment = .center
    
    blackBorder.tintColor = UIColor.black
    innerCircle.tintColor = UIColor.blue
    labelNameSequence.textColor = .black
    
    innerCircle.addSubview(labelNameSequence)
    
    markerView.addSubview(blackBorder)
    markerView.addSubview(innerCircle)
    
    return markerView
}

func getMarkerRoutePlanTamamlandi(point: RoutePlanOperation) -> UIView {
    let markerView: UIView = UIView()
    markerView.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
    
    let blackBorder: UIImageView = UIImageView()
    blackBorder.image = UIImage(systemName: "circle.fill")
    blackBorder.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
    //blackBorder.tintColor = .black
    
    let innerCircle: UIImageView = UIImageView()
    innerCircle.image = UIImage(systemName: "circle.fill")
    innerCircle.frame = CGRect(x: 2.5, y: 2.5, width: 30, height: 30)
    //innerCircle.tintColor = UIColor(Color(hex1: color))
    
    let labelNameSequence: UILabel = UILabel()
    labelNameSequence.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
    labelNameSequence.font = UIFont(name: fontsMedium, size: 12)
    labelNameSequence.text = "\(point.ListSequence)"
    //labelNameSequence.textColor = .black
    labelNameSequence.textAlignment = .center
    
    blackBorder.tintColor = UIColor.white
    innerCircle.tintColor = UIColor.systemBlue
    labelNameSequence.textColor = .black
    
    innerCircle.addSubview(labelNameSequence)
    
    markerView.addSubview(blackBorder)
    markerView.addSubview(innerCircle)
    
    return markerView
}

func getMarkerRoutePlanDepo(point: RoutePlanOperation) -> UIView {
    let markerView: UIView = UIView()
    markerView.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
    
    let blackBorder: UIImageView = UIImageView()
    blackBorder.image = UIImage(systemName: "square.fill")
    blackBorder.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
    //blackBorder.tintColor = .black
    
    let innerCircle: UIImageView = UIImageView()
    innerCircle.image = UIImage(systemName: "square.fill")
    innerCircle.frame = CGRect(x: 2.5, y: 2.5, width: 30, height: 30)
    //innerCircle.tintColor = UIColor(Color(hex1: color))
    
    let labelNameSequence: UILabel = UILabel()
    labelNameSequence.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
    labelNameSequence.font = UIFont(name: fontsMedium, size: 12)
    labelNameSequence.text = ""
    //labelNameSequence.textColor = .black
    labelNameSequence.textAlignment = .center
    
    blackBorder.tintColor = UIColor.white
    innerCircle.tintColor = UIColor.orange
    labelNameSequence.textColor = .black
    
    innerCircle.addSubview(labelNameSequence)
    
    markerView.addSubview(blackBorder)
    markerView.addSubview(innerCircle)
    
    return markerView
} */

func getMarkerPlanlanan(color: String, sequence: String, isPlanned: Bool = false) -> UIView {
    let markerView: UIView = UIView()
    markerView.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
    
    let blackBorder: UIImageView = UIImageView()
    blackBorder.image = UIImage(systemName: "square.fill")
    blackBorder.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
    blackBorder.tintColor = .black
    
    let innerCircle: UIImageView = UIImageView()
    innerCircle.image = UIImage(systemName: "square.fill")
    innerCircle.frame = CGRect(x: 1.5, y: 1.5, width: 32, height: 32)
    
    //innerCircle.tintColor = UIColor(Color(hex1: color))
    
    let labelNameSequence: UILabel = UILabel()
    labelNameSequence.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
    labelNameSequence.font = UIFont(name: fontsMedium, size: 12)
    labelNameSequence.text = sequence
    //labelNameSequence.textColor = .black
    labelNameSequence.textAlignment = .center
    
    if isPlanned {
        innerCircle.tintColor = UIColor(Color(hex1: "#D3D3D3"))
        labelNameSequence.textColor = .white
    } else {
        innerCircle.tintColor = UIColor(Color(hex1: color))
        labelNameSequence.textColor = .black
    }
    
    innerCircle.addSubview(labelNameSequence)
    
    markerView.addSubview(blackBorder)
    markerView.addSubview(innerCircle)
    
    return markerView
}

func getMarkerOlumsuz(color: String, sequence: String) -> UIView {
    let markerView: UIView = UIView()
    markerView.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
    
    let blackBorder: UIImageView = UIImageView()
    blackBorder.image = UIImage(systemName: "arrowtriangle.right.fill")
    blackBorder.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
    blackBorder.tintColor = .black
    
    let innerCircle: UIImageView = UIImageView()
    innerCircle.image = UIImage(systemName: "arrowtriangle.right.fill")
    innerCircle.frame = CGRect(x: 1.5, y: 1.5, width: 32, height: 32)
    innerCircle.tintColor = UIColor(Color(hex1: color))
    
    let labelNameSequence: UILabel = UILabel()
    labelNameSequence.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
    labelNameSequence.font = UIFont(name: fontsMedium, size: 12)
    labelNameSequence.text = sequence
    labelNameSequence.textColor = .black
    labelNameSequence.textAlignment = .center
    
    innerCircle.addSubview(labelNameSequence)
    
    markerView.addSubview(blackBorder)
    markerView.addSubview(innerCircle)
    
    return markerView
}

func getNilMarker() -> UIView {
    let markerView: UIView = UIView()
    markerView.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
    
    
    return markerView
}
