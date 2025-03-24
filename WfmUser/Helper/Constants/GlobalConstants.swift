//
//  GlobalConstants.swift
//  WfmAdmin
//
//  Created by Mustafa Alper Aydin on 27.01.2025.
//

import Foundation
import CoreLocation
import UIKit

let preferences = UserDefaults.standard ///local için preferences kısaltma
var lastLocation: CLLocation? ///telefonun aldığı son lokasyon
var hereInıtilaze: Bool = false ///harita kuruldu mu
let screenHeight = UIScreen.main.bounds.height ///telefon boyutu height almanın kısa yolu
let screenWidth = UIScreen.main.bounds.width ///telefon boyuyu widht almanın kısa yolu
let chartsHeight = screenHeight * 0.2 ///grafikler height kısya yol

var localNetwork: Bool = false
var versiyon = "1.1.0"
//var loginPageType = "10654"
var loginPageType = "10650"


// MARK: remoteconfig için mapkey
struct MapKey {
    static let keyID = "MAP_ACCESS_KEY_ID"
    static let keySecret = "MAP_ACCESS_KEY_SECRET"
    static let autoSuggestKey = "AUTO_SUGGEST_API_KEY"
}

// MARK: CornerRadius
struct CR {
    static let btn3 = 3.0
    static let swp3 = 3.0
    static let btn5 = 5.0
    static let hdr5 = 5.0
    static let r6 = 6.0
    static let sqn7 = 7.0
    static let pck9 = 9.0
    static let btn10 = 10.0
    static let hdr10 = 10.0
    static let dlg10 = 10.0
    static let sqn10 = 10.0
    static let ttl15 = 15.0
    static let mrk15 = 15.0
    static let dlg20 = 20.0
    static let hdr25 = 25.0
}
