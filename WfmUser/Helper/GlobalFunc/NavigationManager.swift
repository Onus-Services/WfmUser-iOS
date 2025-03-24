//
//  NavigationManager.swift
//  WfmUser
//
//  Created by Mustafa Alper Aydin on 17.03.2025.
//

import Foundation
import SwiftUI

class NavigationManager {
    static func getNavigation(type: Int, pastPoint: PointModel? = nil, selectedPoint: PointModel, addressText: String = "") -> [Alert.Button] {
        var buttons: [Alert.Button] = []
        print("XXDDAA")
        if type == 1 {
            print("XXDDAA123")
            if (UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!)){
                buttons.append(.default(Text("GoogleMaps")) {
                    let url = URL(string: "comgooglemaps://?saddr=&daddr=\(Double(selectedPoint.enlem) ?? -1.0),\(Double(selectedPoint.boylam) ?? -1.0)&directionsmode=driving")!
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    } else {
                        UIApplication.shared.openURL(url)
                    }
                })
            }
            if (UIApplication.shared.canOpenURL(URL(string:"yandexmaps://")!)) {
                buttons.append(.default(Text("YandexMaps")) {
                    let url = URL(string: "yandexmaps://build_route_on_map/?lat_from=\(lastLocation?.coordinate.latitude ?? -1.0)&lon_from=\(lastLocation?.coordinate.longitude ?? -1.0)&lat_to=\(Double(selectedPoint.enlem) ?? -1.0)&lon_to=\(Double(selectedPoint.boylam) ?? -1.0)")!
                    
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    } else {
                        UIApplication.shared.openURL(url)
                    }
                })
            }
            if (UIApplication.shared.canOpenURL(URL(string:"maps://")!)) {
                buttons.append(.default(Text("Harita")) {
                    let url = URL(string: "maps://?saddr=&daddr=\(Double(selectedPoint.enlem) ?? -1.0),\(Double(selectedPoint.boylam) ?? -1.0))")!
                    
                    
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    } else {
                        UIApplication.shared.openURL(url)
                    }
                })
            }
            buttons.append(.cancel())
        } else if type == 2 {
            print("XXDDAA1235555")
            if (UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!)){
                buttons.append(.default(Text("GoogleMaps")) {
                    let url = URL(string: "comgooglemaps://?saddr=\(pastPoint!.enlem),\(pastPoint!.boylam)&daddr=\(selectedPoint.enlem),\(selectedPoint.boylam)&directionsmode=driving")!
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    } else {
                        UIApplication.shared.openURL(url)
                    }
                })
            }
            if (UIApplication.shared.canOpenURL(URL(string:"yandexmaps://")!)) {
                buttons.append(.default(Text("YandexMaps")) {
                    let url = URL(string: "yandexmaps://build_route_on_map/?lat_from=\(pastPoint!.enlem)&lon_from=\(pastPoint!.boylam)&lat_to=\(selectedPoint.enlem)&lon_to=\(selectedPoint.boylam)")!
                    
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    } else {
                        UIApplication.shared.openURL(url)
                    }
                })
            }
            if (UIApplication.shared.canOpenURL(URL(string:"maps://")!)) {
                buttons.append(.default(Text("Harita")) {
                    let url = URL(string: "maps://?saddr=\(pastPoint!.enlem),\(pastPoint!.boylam)=&daddr=\(selectedPoint.enlem),\(selectedPoint.boylam)")!
                    
                    
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    } else {
                        UIApplication.shared.openURL(url)
                    }
                })
            }
            buttons.append(.cancel())
        } else {
            print("XXDDAA456")
            if (UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!)){
                print("AKKAKAKAKAKAKKA")
                buttons.append(.default(Text("GoogleMaps")) {
                    print("OPOPOP - comgooglemaps://?q=\(newAdressTextEdit(addressText: addressText)[0])&directionsmode=driving - ---- \(newAdressTextEdit(addressText: addressText)[0])")
                    let url = URL(string: "comgooglemaps://?q=\(newAdressTextEdit(addressText: addressText)[0])&directionsmode=driving")!
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    } else {
                        UIApplication.shared.openURL(url)
                    }
                })
            }
            if (UIApplication.shared.canOpenURL(URL(string:"yandexmaps://")!)) {
                print("AKKAKAKAKAKAKKA123123")
                buttons.append(.default(Text("YandexMaps")) {
                    let url = URL(string: "yandexmaps://maps.yandex.ru/?ll=\(lastLocation?.coordinate.latitude ?? -1.0),\(lastLocation?.coordinate.longitude ?? -1.0)&z=16&text=\(newAdressTextEdit(addressText: addressText)[0])")!
                    
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    } else {
                        UIApplication.shared.openURL(url)
                    }
                })
            }
            if (UIApplication.shared.canOpenURL(URL(string:"maps://")!)) {
                print("AKKAKAKAKAKAKKA8686858585")
                buttons.append(.default(Text("Harita")) {
                    let url = URL(string: "maps://?q=\(newAdressTextEdit(addressText: addressText)[1])")!
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    } else {
                        UIApplication.shared.openURL(url)
                    }
                })
            }
            buttons.append(.cancel())
        }

        return buttons
    }
}

func newAdressTextEdit(addressText: String) -> [String] {
    let adressText = addressText.lowercased()
    let queryableAddress = adressText.replacingOccurrences(of: "\n", with: " ").replacingOccurrences(of: " ", with: "%20")
    let queryableAddress1 = queryableAddress.replacingOccurrences(of: "ğ", with: "g").replacingOccurrences(of: "ü", with: "u").replacingOccurrences(of: "ş", with: "s").replacingOccurrences(of: "ç", with: "c").replacingOccurrences(of: "ı", with: "i").replacingOccurrences(of: "ö", with: "o").replacingOccurrences(of: "i̇", with: "i")
    let queryableAddressiOS = adressText.replacingOccurrences(of: "\n", with: " ").replacingOccurrences(of: " ", with: "+")
    let queryableAddress1iOS = queryableAddress.replacingOccurrences(of: "ğ", with: "g").replacingOccurrences(of: "ü", with: "u").replacingOccurrences(of: "ş", with: "s").replacingOccurrences(of: "ç", with: "c").replacingOccurrences(of: "ı", with: "i").replacingOccurrences(of: "ö", with: "o").replacingOccurrences(of: "i̇", with: "i")
    
    return [queryableAddress1, queryableAddress1iOS] //apple harita için düzenleme
}
