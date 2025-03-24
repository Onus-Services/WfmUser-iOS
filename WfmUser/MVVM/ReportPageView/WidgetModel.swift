//
//  WidgetModel.swift
//  WfmAdmin
//
//  Created by Mustafa Alper Aydin on 29.01.2025.
//

import Foundation
import SwiftUI

struct WidgetModel: Identifiable {
    let id = UUID()
    var valueCount: Int = 2
    var widgetTitle: String
    var item1BgColor1: Color
    var item1BgColor2: Color
    var item1IconText: String
    var item1ValueD: Double = -1.0
    var item1ValueI: Int = -1
    var item1ValueText: String
    var item1ValueTextColor: Color
    var item2BgColor1: Color
    var item2BgColor2: Color
    var item2IconText: String
    var item2ValueD: Double = -1.0
    var item2ValueI: Int = -1
    var item2ValueText: String
    var item2ValueTextColor: Color
}

let localWidgetModel: [WidgetModel] = [
    WidgetModel(valueCount: 1, widgetTitle: "Bölge", item1BgColor1: .blue, item1BgColor2: .blue.opacity(0.5), item1IconText: "map.fill", item1ValueI: 2, item1ValueText: "Bölge", item1ValueTextColor: .blue, item2BgColor1: .clear, item2BgColor2: .clear, item2IconText: "", item2ValueText: "", item2ValueTextColor: .clear),
    WidgetModel(valueCount: 1, widgetTitle: "Araç", item1BgColor1: .red, item1BgColor2: .red.opacity(0.5), item1IconText: "car.fill", item1ValueI: 12, item1ValueText: "Araç", item1ValueTextColor: .red, item2BgColor1: .clear, item2BgColor2: .clear, item2IconText: "", item2ValueText: "", item2ValueTextColor: .clear),
    WidgetModel(widgetTitle: "Sefer Başlatan", item1BgColor1: .green, item1BgColor2: .green.opacity(0.5), item1IconText: "checkmark.circle", item1ValueI: 12, item1ValueText: "Başla\ntan", item1ValueTextColor: .green, item2BgColor1: .red, item2BgColor2: .red, item2IconText: "xmark.circle", item2ValueI: 5, item2ValueText: "Başlat\nmayan", item2ValueTextColor: .red),
    WidgetModel(widgetTitle: "Sefer Bitiren", item1BgColor1: .blue, item1BgColor2: .blue.opacity(0.5), item1IconText: "checkmark.circle", item1ValueI: 12, item1ValueText: "Biti\nren", item1ValueTextColor: .blue, item2BgColor1: .red, item2BgColor2: .red, item2IconText: "xmark.circle", item2ValueI: 2, item2ValueText: "Bitir\nmeyen", item2ValueTextColor: .red),
    WidgetModel(valueCount: 1, widgetTitle: "Verimlilik", item1BgColor1: .purple, item1BgColor2: .purple.opacity(0.5), item1IconText: "shippingbox.fill", item1ValueD: 12.32, item1ValueText: "Ortalama", item1ValueTextColor: .purple, item2BgColor1: .clear, item2BgColor2: .clear, item2IconText: "", item2ValueText: "", item2ValueTextColor: .clear),
    
]

struct WidgetModelOnlyData: Identifiable {
    let id = UUID()
    var widgetType: WidgetType
    var widgetTitle: String
    var itemBgColor1: Color
    var itemBgColor2: Color
    var itemIconText: String
    var itemValue: String
    var itemValueText: String
    var itemValueTextColor: Color
}

enum WidgetType {
    
    case bolge
    case arac
    case seferBaslatan
    case seferBaslatmayan
    case seferBitiren
    case seferBitirmeyen
    case olumlu
    case olumsuz
    case devamEden
    case tamamlanmis
    case devamEdenPer
    case limitUstu
    case limitAlti
    case verimlilik
    case teslimatArac
    case teslimatDrop
    case ortSeferBitirme
    case ortTeslimatSure
    case hesaplananKm
    case toplananKm
    case ortGeofence
    case toplamSiparis
    case kmVerimlilik
    case ortBeklemeSuresi
    case sapmaSayisi
    case rutIciZiyaret
    case rut
    case rutDisi
    case duraklama
    case gun
    
}

struct WidgetModelArray: Identifiable {
    let id = UUID()
    var title: String
    var color: Color
    var widget: [WidgetModelOnlyData]
}
