//
//  ReportDetail.swift
//  RxAdmin
//
//  Created by Banu Ortac on 12.06.2024.
//

import Foundation
import SwiftUI

enum ReportType: String, CustomStringConvertible {
    case barTeslimat
    case pieTeslimat
    case lineHesaplananToplananKm
    case barHesaplananToplananSaat
    case barAdresSkor
    case barOrtalamaGeofence
    case barAracVerimlilik
    case barSeferBBB
    case barDuraklama
    case barKumeleme
    case barOrtalamaTeslimat
    

    var description: String {
        switch self {
        case .barTeslimat:
            return String(localized: "RTDTeslimatDurum")
        case .pieTeslimat:
            return String(localized: "RTDTeslimatDurum")
        case .lineHesaplananToplananKm:
            return String(localized: "RTDHesaplananToplananKM")
        case .barHesaplananToplananSaat:
            return String(localized: "RTDHesaplananToplananSaat")
        case .barAdresSkor:
            return String(localized: "RTDAdresSkor")
        case .barOrtalamaGeofence:
            return String(localized: "RTDOrtalamaGeofence")
        case .barAracVerimlilik:
            return String(localized: "RTDAracBasinaVerimlilik")
        case .barSeferBBB:
            return String(localized: "RTDSeferBBB")
        case .barDuraklama:
            return "Duraklama"
        case .barKumeleme:
            return "Kümeleme"
        case .barOrtalamaTeslimat:
            return "Ortalama Teslimat"
        }
    }
    
    var descriptionPickerText: String {
        switch self {
        case .barTeslimat:
            return String(localized: "RTDTTeslimatDurumBar")
        case .pieTeslimat:
            return String(localized: "RTDTTeslimatDurumPie")
        case .lineHesaplananToplananKm:
            return String(localized: "RTDTHesaplananToplananKM")
        case .barHesaplananToplananSaat:
            return String(localized: "RTDTHesaplananToplananSaat")
        case .barAdresSkor:
            return String(localized: "RTDTAdresSkor")
        case .barOrtalamaGeofence:
            return String(localized: "RTDTOrtalamaGeofence")
        case .barAracVerimlilik:
            return String(localized: "RTDTAracBasinaVerimlilik")
        case .barSeferBBB:
            return String(localized: "RTDTSeferBBB")
        case .barDuraklama:
            return "Duraklama"
        case .barKumeleme:
            return "Kümeleme"
        case .barOrtalamaTeslimat:
            return "Ortalama Teslimat"
        }
    }
    
    var count: Int {
        switch self {
        case .barTeslimat:
            return 6
        case .pieTeslimat:
            return 6
        case .lineHesaplananToplananKm:
            return 2
        case .barHesaplananToplananSaat:
            return 2
        case .barAdresSkor:
            return 3
        case .barOrtalamaGeofence:
            return 5
        case .barAracVerimlilik:
            return 1
        case .barSeferBBB:
            return 3
        case .barDuraklama:
            return 3
        case .barKumeleme:
            return 1
        case .barOrtalamaTeslimat:
            return 1
        }
    }
}

enum ReportValue {
    case intValues([Int])
    case doubleValues([Double])
}

struct ChartDetailModel: Identifiable {
    let id = UUID()
    var chartTitle: String
    var groupArray: [[String]]
    var descArray: [String]
    var valueArray: [ReportValue]
    
    init() {
        chartTitle = ""
        groupArray = []
        descArray = []
        valueArray = []
    }
    
    init(chartTitle: String, groupArray: [[String]], descArray: [String], valueArray: [ReportValue]) {
        self.chartTitle = chartTitle
        self.groupArray = groupArray
        self.descArray = descArray
        self.valueArray = valueArray
    }
}

func getChartDetails(isReportOneDay: Bool, groupType: Int, reportType: ReportType, report: [ReportModel]) -> ChartDetailModel {
    var descArray: [String] = []
    var chartTitle: String = ""
    switch reportType {
    case .barTeslimat:
        descArray = [String(localized: "RLOlumluAdet"), String(localized: "RLOlumsuzAdet"), String(localized: "RLDevamEdenAdet"), String(localized: "Farklı Gün"), String(localized: "Farklı Araç"), String(localized: "Duraklama")]
        chartTitle = reportType.description
    case .barHesaplananToplananSaat:
        descArray = [String(localized: "RLHesaplananSaat"), String(localized: "RLToplananSaat")]
        chartTitle = reportType.description
    case .barAdresSkor:
        descArray = [String(localized: "RLYeterliAdres"), String(localized: "RLKismiYeterliAdres"), String(localized: "RLYetersizAdres")]
        chartTitle = reportType.description
    case .barOrtalamaGeofence:
        descArray = [String(localized: "RLNoktaAtisi"), String(localized: "RLYakin"), String(localized: "RLUzak"), String(localized: "RLHataliKullanim"), String(localized: "RLGeofenceHesaplanmayan")]
        chartTitle = reportType.description
    case .barSeferBBB:
        descArray = [String(localized: "RLSeferBaslat"), String(localized: "RLSeferBaslatmayan"), String(localized: "RLSeferBitis")]
        chartTitle = reportType.description
    case .barAracVerimlilik:
        descArray = [String(localized: "RLAracBasinaVerimlilik")]
        chartTitle = reportType.description
    case .lineHesaplananToplananKm:
        descArray = [String(localized: "RLHesaplananKm"), String(localized: "Araç Takip Toplanan KM")]
        chartTitle = reportType.description
    case .pieTeslimat:
        descArray = [String(localized: "RLOlumluAdet"), String(localized: "RLOlumsuzAdet"), String(localized: "RLDevamEdenAdet"), String(localized: "Farklı Gün"), String(localized: "Farklı Araç"), String(localized: "Duraklama")]
        chartTitle = reportType.description
    case .barDuraklama:
        descArray = ["Farklı Gün", "Farklı Araç", "Duraklama"]
        chartTitle = reportType.description
    case .barKumeleme:
        descArray = ["Kümele"]
        chartTitle = reportType.description
    case .barOrtalamaTeslimat:
        descArray = ["Teslimat Performans"]
        chartTitle = reportType.description
    default:
        descArray = []
    }
    
    var valueArray: [ReportValue] = []
    var groupArray: [[String]] = []
    for d in report {
        if groupType == 0 {
            if isReportOneDay {
                switch reportType {
                case .barTeslimat:
                    groupArray = [["Değer", "Olumlu"], ["Değer", "Olumsuz"], ["Değer", "Devam"], ["Değer", "FarklıG"], ["Değer", "FarklıA"], ["Değer", "Durak"]]
                case .pieTeslimat:
                    groupArray = [["Değer", "Olumlu"], ["Değer", "Olumsuz"], ["Değer", "Devam"], ["Değer", "FarklıG"], ["Değer", "FarklıA"], ["Değer", "Durak"]]
                case .lineHesaplananToplananKm:
                    groupArray = [["Değer", "Hesaplanan"], ["Değer", "Toplanan"]]
                case .barHesaplananToplananSaat:
                    groupArray = [["Değer", "Hesaplanan"], ["Değer", "Toplanan"]]
                case .barAdresSkor:
                    groupArray = [["Değer", "Yeterli"], ["Değer", "Kısmi"], ["Değer", "Yetersiz"]]
                case .barOrtalamaGeofence:
                    groupArray = [["Değer", "Nokta"], ["Değer", "Yakın"], ["Değer", "Uzak"], ["Değer", "Hatalı"], ["Değer", "Hesaplanmayan"]]
                case .barAracVerimlilik:
                    groupArray = [["Değer", "Verimlilik"]]
                case .barSeferBBB:
                    groupArray = [["Değer", "Başlatan"], ["Değer", "Başlatmayan"], ["Değer", "Bitiren"]]
                case .barDuraklama:
                    groupArray = [["Değer", "FarklıG"], ["Değer", "FarklıA"], ["Değer", "Duraklama"]]
                case .barKumeleme:
                    groupArray = [["Değer", "Kümeleme"]]
                case .barOrtalamaTeslimat:
                    groupArray = [["Değer", "Teslimat Per"]]
                }
            } else {
                groupArray.append(["Araç", d.aracPlaka])
            }
        } else {
            if isReportOneDay {
                switch reportType {
                case .barTeslimat:
                    groupArray = [["Değer", "Olumlu"], ["Değer", "Olumsuz"], ["Değer", "Devam"], ["Değer", "FarklıG"], ["Değer", "FarklıA"], ["Değer", "Durak"]]
                case .pieTeslimat:
                    groupArray = [["Değer", "Olumlu"], ["Değer", "Olumsuz"], ["Değer", "Devam"], ["Değer", "FarklıG"], ["Değer", "FarklıA"], ["Değer", "Durak"]]
                case .lineHesaplananToplananKm:
                    groupArray = [["Değer", "Hesaplanan"], ["Değer", "Toplanan"]]
                case .barHesaplananToplananSaat:
                    groupArray = [["Değer", "Hesaplanan"], ["Değer", "Toplanan"]]
                case .barAdresSkor:
                    groupArray = [["Değer", "Yeterli"], ["Değer", "Kısmi"], ["Değer", "Yetersiz"]]
                case .barOrtalamaGeofence:
                    groupArray = [["Değer", "Nokta"], ["Değer", "Yakın"], ["Değer", "Uzak"], ["Değer", "Hatalı"], ["Değer", "Hesaplanmayan"]]
                case .barAracVerimlilik:
                    groupArray = [["Değer", "Verimlilik"]]
                case .barSeferBBB:
                    groupArray = [["Değer", "Başlatan"], ["Değer", "Başlatmayan"], ["Değer", "Bitiren"]]
                case .barDuraklama:
                    groupArray = [["Değer", "FarklıG"], ["Değer", "FarklıA"], ["Değer", "Duraklama"]]
                case .barKumeleme:
                    groupArray = [["Değer", "Kümeleme"]]
                case .barOrtalamaTeslimat:
                    groupArray = [["Değer", "Teslimat Per"]]
                }
            } else {
                groupArray.append(["Araç", d.aracPlaka])
            }
            //groupArray.append(["Depo", d.depo])
        }
        switch reportType {
        case .barTeslimat:
            valueArray.append(.intValues([d.olumluAdet, d.olumsuzAdet, d.devamEdenAdet, d.farkliGun, d.farkliArac, d.duraklama]))
        case .barHesaplananToplananSaat:
            valueArray.append(.doubleValues([d.planlananKM, d.gerceklesenKM]))
        case .barAdresSkor:
            valueArray.append(.intValues([d.yesil, d.turuncu, d.kirmizi]))
        case .barOrtalamaGeofence:
            valueArray.append(.intValues([d.noktaAtisi, d.yakin, d.uzak, d.hataliKullanim, d.geofenceHesaplanmayan]))
        case .barSeferBBB:
            valueArray.append(.intValues([d.seferBaslatAdet, d.seferBaslatmayanAdet, d.seferBitisAdet]))
        case .barAracVerimlilik:
            valueArray.append(.intValues([d.dropSayisi]))
        case .lineHesaplananToplananKm:
            valueArray.append(.doubleValues([d.planlananKM, d.gerceklesenKM]))
        case .pieTeslimat:
            valueArray.append(.intValues([d.olumluAdet, d.olumsuzAdet, d.devamEdenAdet, d.farkliGun, d.farkliArac, d.duraklama]))
        case .barDuraklama:
            valueArray.append(.intValues([d.farkliGun, d.farkliArac, d.duraklama]))
        case .barKumeleme:
            valueArray.append(.intValues([d.farkliGun]))
        case .barOrtalamaTeslimat:
            valueArray.append(.intValues([d.toplamAdet]))
        default:
            valueArray.append(.intValues([]))
        }
    }
    
    let returnDetail: ChartDetailModel = ChartDetailModel(chartTitle: chartTitle, groupArray: groupArray, descArray: descArray, valueArray: valueArray)
    
    
    return returnDetail
}

func value3(_ d: ReportValue) -> ReportValue {
    switch d {
    case .intValues(let array):
        return .intValues(array)
    case .doubleValues(let array):
        return .doubleValues(array)
    }
}

func titleToColor(data5: ChartDetailModel) -> KeyValuePairs<String, Color> {
    var pairs: KeyValuePairs<String, Color> = [:]
    
    let count = data5.descArray.count

    if count > 0 {
        pairs = KeyValuePairs<String, Color>(dictionaryLiteral: (data5.descArray[0], Color.ChartColors.color1))
    }
    if count > 1 {
        pairs = KeyValuePairs<String, Color>(dictionaryLiteral: (data5.descArray[0], Color.ChartColors.color1), (data5.descArray[1], Color.ChartColors.color2))
    }
    if count > 2 {
        pairs = KeyValuePairs<String, Color>(dictionaryLiteral: (data5.descArray[0], Color.ChartColors.color1), (data5.descArray[1], Color.ChartColors.color2), (data5.descArray[2], Color.ChartColors.color3))
    }
    if count > 4 {
        pairs = KeyValuePairs<String, Color>(dictionaryLiteral: (data5.descArray[0], Color.ChartColors.color1), (data5.descArray[1], Color.ChartColors.color2), (data5.descArray[2], Color.ChartColors.color3), (data5.descArray[3], Color.ChartColors.color4), (data5.descArray[4], Color.ChartColors.color5))
    }
    if count > 5 {
        pairs = KeyValuePairs<String, Color>(dictionaryLiteral: (data5.descArray[0], Color.ChartColors.color1), (data5.descArray[1], Color.ChartColors.color2), (data5.descArray[2], Color.ChartColors.color3), (data5.descArray[3], Color.ChartColors.color4), (data5.descArray[4], Color.ChartColors.color5), (data5.descArray[5], Color.ChartColors.color6))
    }

    return pairs
}

enum ChartType {
    case barChart
    case pieChart
    case lineChart
}

func returnChartType(reportType: ReportType) -> ChartType {
    switch reportType {
    case .barTeslimat, .barHesaplananToplananSaat, .barAdresSkor, .barOrtalamaGeofence, .barAracVerimlilik, .barSeferBBB, .barDuraklama, .barKumeleme, .barOrtalamaTeslimat:
        return .barChart
    case .pieTeslimat:
        return .pieChart
    case .lineHesaplananToplananKm:
        return .lineChart
    }
}

class ReportIndex {
    func indexSelectedReport(index: Int) -> ReportType {
        switch index {
        case 0:
            return .barTeslimat
        case 1:
            return .pieTeslimat
        case 2:
            return .lineHesaplananToplananKm
        case 3:
            return .barHesaplananToplananSaat
        case 4:
            return .barAdresSkor
        case 5:
            return .barOrtalamaGeofence
        case 6:
            return .barAracVerimlilik
        case 7:
            return .barSeferBBB
        case 8:
            return .barDuraklama
        case 9:
            return .barKumeleme
        case 10:
            return .barOrtalamaTeslimat
        default:
            return .barTeslimat
        }
    }

    func reverseIndexSelectedReport(report: ReportType) -> Int? {
        switch report {
        case .barTeslimat:
            return 0
        case .pieTeslimat:
            return 1
        case .lineHesaplananToplananKm:
            return 2
        case .barHesaplananToplananSaat:
            return 3
        case .barAdresSkor:
            return 4
        case .barOrtalamaGeofence:
            return 5
        case .barAracVerimlilik:
            return 6
        case .barSeferBBB:
            return 7
        case .barDuraklama:
            return 8
        case .barKumeleme:
            return 9
        case .barOrtalamaTeslimat:
            return 10
        }
    }
}


