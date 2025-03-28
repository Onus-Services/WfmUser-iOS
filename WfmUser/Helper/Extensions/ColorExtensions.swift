//
//  ColorExtensions.swift
//  WfmAdmin
//
//  Created by Mustafa Alper Aydin on 27.01.2025.
//

import Foundation
import SwiftUI

extension Color {
    struct WarningColor {
        static var successWarningColor: Color { return Color(red: 13.0/255.0, green: 216.0/255.0, blue: 119.0/255.0) }
        static var failedWarningColor: Color { return Color(red: 255.0/255.0, green: 80.0/255.0, blue: 92.0/255.0) }
        //static var warningWarningColor: Color { return Color(red: 216.0/255.0, green: 216.0/255.0, blue: 24.0/255.0) } //sarı
        //static var warningWarningColor: Color { return Color(red: 242/255, green:135/255, blue:5/255) } //turuncu1
        static var warningWarningColor: Color { return Color(red: 242/255, green:203/255, blue:4/255) } //turuncu2
    }
    
    struct DialogColor {
        static var dialogBackgorundOpacityColor: Color { return Color.gray.opacity(0.5) }
        static var dialogHeaderLightBlue: Color { return Color(red: 100.0/255.0, green: 180.0/255.0, blue: 255.0/255.0) }
        static var dialogHeaderDarkBlue: Color { return Color(red: 0/255, green: 61/255, blue: 96/255) }
        static var reRouteHeaderBlue: Color { return Color(red: 130.0/255.0, green: 203.0/255.0, blue: 255.0/255.0) }
        static var reRouteListYellow1: Color { return Color(red: 255.0/255.0, green: 209.0/255.0, blue: 101.0/255.0) }
        static var reRouteListYellow2: Color { return Color(red: 255.0/255.0, green: 211.0/255.0, blue: 65.0/255.0) }
        static var reRouteListRed1: Color { return Color(red: 250.0/255.0, green: 88.0/255.0, blue: 70.0/255.0) }
        static var reRouteListRed2: Color { return Color(red: 155.0/255.0, green: 29.0/255.0, blue: 26.0/255.0) }
        static var reRouteListGreen1: Color { return Color(red: 40.0/255.0, green: 147.0/255.0, blue: 20.0/255.0) }
        static var reRouteListGreen2: Color { return Color(red: 172.0/255.0, green: 241.0/255.0, blue: 162.0/255.0) }
    }
    
    struct BarcodeColor {
        static var allNotDeliveredRed: Color { return Color(red: 180/255, green: 9/255, blue: 67/255) }
    }
    
    struct MyColor {
        
        static var successWarningColor: Color { return Color(red: 13.0/255.0, green: 216.0/255.0, blue: 119.0/255.0) }
        static var failedWarningColor: Color { return Color(red: 255.0/255.0, green: 80.0/255.0, blue: 92.0/255.0) }
        //static var warningWarningColor: Color { return Color(red: 216.0/255.0, green: 216.0/255.0, blue: 24.0/255.0) } //sarı
        //static var warningWarningColor: Color { return Color(red: 242/255, green:135/255, blue:5/255) } //turuncu1
        static var warningWarningColor: Color { return Color(red: 242/255, green:203/255, blue:4/255) } //turuncu2
        
        static var newGidiyorumColor: Color { return Color(red: 43/255, green: 93/255, blue: 207/255)}
        static var newGidiyorumColor1: Color { return Color(red: 25/255, green: 73/255, blue: 168/255)}
        static var newNavigasyonColor: Color { return Color(red: 217/255, green: 217/255, blue: 0/255)}
        static var newNavigasyonColor1: Color { return Color(red: 180/255, green: 180/255, blue: 0/255)}
        static var newGeldimColor: Color { return Color(red: 31/255, green: 209/255, blue: 24/255)}
        static var newGeldimColor1: Color { return Color(red: 8/255, green: 139/255, blue: 2/255)}
        static var newTeslimatFormuColor: Color { return Color(red: 31/255, green: 209/255, blue: 24/255)}
        static var newTeslimatFormuColor1: Color { return Color(red: 8/255, green: 139/255, blue: 2/255)}
        static var newProblemFormuColor: Color { return Color(red: 245/255, green: 150/255, blue: 42/255)}
        static var newProblemFormuColor1: Color { return Color(red: 197/255, green: 116/255, blue: 24/255)}
        static var newGelmedimColor: Color { return Color(red: 246/255, green: 31/255, blue: 31/255)}
        static var newGelmedimColor1: Color { return Color(red: 183/255, green: 27/255, blue: 27/255)}
        
        
        static var bottomMenuBlueColor: Color { return Color(red: 0/255, green: 70/255, blue: 140/255)}
        static var bottomMenuGrayColor: Color { return Color(red: 237/255, green: 234/255, blue: 235/255)}
        static var bottomMenuGray1Color: Color { return Color(red: 120/255, green: 118/255, blue: 119/255)}
        
        static var leftMenuFooterBackground: Color { return Color(red: 60/255, green: 64/255, blue: 198/255)}
        
        static var notificationBarBack1: Color { return Color(red: 228/255, green: 228/255, blue: 228/255) }
        static var notificationBarBack2: Color { return Color(red: 222/255, green: 222/255, blue: 222/255) }
        static var notificationBarBack3: Color { return Color(red: 191/255, green: 191/255, blue: 191/255) }
        static var notificationBarButton1: Color { return Color(red: 225/255, green: 225/255, blue: 225/255) }
        
        static var dialogBackgroundColor: Color { return Color(red: 231/255, green: 231/255, blue: 231/255) }
        static var colorBlack: Color { return Color(red: 48/255, green:48/255, blue:48/255) }
        static var buttonColor: Color { return Color(red: 67/255, green:54/255, blue:111/255) }
        static var buttonShadowColor: Color { return Color(red: 197/255, green:182/255, blue:254/255) }
        static var colorGray2: Color { return Color(red: 189/255, green:189/255, blue:189/255) }
        static var colorGreen: Color { return Color(red: 88/255, green:190/255, blue:63/255) }
        static var colorGrayOp1: Color { return Color(red: 48/255, green:48/255, blue:48/255).opacity(0.1) }
        
        static var aboutUsFirmaBackgorund: Color { return Color(red: 4.0/255.0, green: 154.0/255.0, blue: 221.0/255.0)}
        static var aboutUsFirmaTextColor: Color { return Color(red: 216.0/255.0, green: 27.0/255.0, blue: 96.0/255.0)}
        static var aboutUsContactBackgorund: Color { return Color(red: 30.0/255.0, green: 192.0/255.0, blue: 232.0/255.0)}
        static var aboutUsButtonModifier: Color { return Color(red: 223.0/255.0, green: 81.0/255.0, blue: 73.0/255.0)}
        static var releaseNoteBlueText: Color { return Color(red: 30.0/255.0, green: 136.0/255.0, blue: 229.0/255.0)}
    }
    
    struct ChartColors {
        //#2caffe olumluadet
        static var color1: Color { return Color(red: 44/255, green: 175/255, blue: 254/255)}
        //#00e272 kismiolumluadet
        static var color2: Color { return Color(red: 0/255, green: 226/255, blue: 114/255)}
        //#544fc5 olumsuzadet
        static var color3: Color { return Color(red: 102/255, green: 102/255, blue: 204/255)}
        //#fe6a35 ugranmamisadet
        static var color4: Color { return Color(red: 254/255, green: 106/255, blue: 53/255)}
        //#6b8abc devamedenadet
        static var color5: Color { return Color(red: 107/255, green: 138/255, blue: 188/255) }
        static var color6: Color { return Color(red: 255/255, green: 80/255, blue: 92/255) }
    }
    
    struct LecyCellBackground {
        static var backgroundColorGidiyorum: Color { return Color(red: 254.0/255.0, green: 225.0/255.0, blue: 133.0/255.0, opacity: 68.0/255.0) }
        static var backgroundColorGeldim: Color { return Color(red: 171.0/255.0, green: 206.0/255.0, blue: 241.0/255.0, opacity: 68.0/255.0) }
        static var backgroundColorTeslimatFormuDolduruluyor: Color { return Color(red: 126.0/255.0, green: 249.0/255.0, blue: 212.0/255.0, opacity: 68.0/255.0) }
        static var backgroundColorOlumluTeslimat: Color { return Color(red: 165.0/255.0, green: 252.0/255.0, blue: 165.0/255.0, opacity: 68.0/255.0) }
        static var backgroundColorProblemFormuDolduruluyor: Color { return Color(red: 249.0/255.0, green: 126.0/255.0, blue: 225.0/255.0, opacity: 68.0/255.0) }
        static var backgroundColorCevapBekleniyorMt: Color { return Color(red: 88.0/255.0, green: 69.0/255.0, blue: 210.0/255.0, opacity: 68.0/255.0) }
        static var backgroundColorSorunluOlumluTeslimat: Color { return Color(red: 255.0/255.0, green: 248.0/255.0, blue: 122.0/255.0, opacity: 68.0/255.0) }
        static var backgroundColorOlumsuzTeslimat: Color { return Color(red: 255.0/255.0, green: 192.0/255.0, blue: 192.0/255.0, opacity: 68.0/255.0) }
        static var backgroundColorDepoyaCekMt: Color { return Color(red: 218.0/255.0, green: 119.0/255.0, blue: 119.0/255.0, opacity: 68.0/255.0) }
        static var backgroundColorTeslimEtMt: Color { return Color(red: 139.0/255.0, green: 177.0/255.0, blue: 135.0/255.0, opacity: 68.0/255.0) }
        static var backgroundColorKısmıTeslimEtMt: Color { return Color(red: 203.0/255.0, green: 255.0/255.0, blue: 198.0/255.0, opacity: 68.0/255.0) }
        static var backgroundColorGörüsüldüCözümBekleniyorMt: Color { return Color(red: 205.0/255.0, green: 218.0/255.0, blue: 119.0/255.0, opacity: 68.0/255.0) }
        static var backgroundColorCözülmediDevamEt: Color { return Color(red: 135.0/255.0, green: 168.0/255.0, blue: 177.0/255.0, opacity: 68.0/255.0) }
        static var backgroundColorKısmıOlumluTeslimat: Color { return Color(red: 135.0/255.0, green: 200.0/255.0, blue: 177.0/255.0, opacity: 68.0/255.0) }
        static var backgroundColorNormal: Color { return Color(red: 245.0/255.0, green: 245.0/255.0, blue: 245.0/255.0) }
        
        static var backgroundColorStatus: Color { return Color(red: 38.0/255.0, green: 179.0/255.0, blue: 7.0/255.0) }
        
        static var cellInfoBlueColor: Color { return Color(red: 0/255, green: 47/255, blue: 167/255) }
        
        static var cellIVehicleLoadingGreen: Color { return Color(red: 80/255, green: 200/255, blue: 120/255) }
    }
    
    struct NewColor {
        static var backgorund: Color { return Color(red: 250/255, green: 250/255, blue: 250/255)} //FAFAFA
        static var primary1: Color { return Color(red: 1/255, green: 122/255, blue: 255/255)} //017AFF
        static var secondBG: Color { return Color(red: 255/255, green: 255/255, blue: 255/255)} //FFFFFF
        static var blueLight: Color { return Color(red: 230/255, green: 241/255, blue: 253/255)} //E6F1FD
        static var blueLight1: Color { return Color(red: 208/255, green: 235/255, blue: 253/255) } //D0EBFD
        static var blueDark: Color { return Color(red: 62/255, green: 125/255, blue: 195/255) } //3E7DC3
        static var greenlight: Color { return Color(red: 231/255, green: 249/255, blue: 235/255) } //E7F9EB
        static var greenDark: Color { return Color(red: 83/255, green: 202/255, blue: 108/255)} //53CA6C
        static var orangeLight: Color { return Color(red: 255/255, green: 250/255, blue: 237/255)} //FFFAED
        static var orangeDark: Color { return Color(red: 255/255, green: 188/255, blue: 7/255)} //FFBC07
        static var redLight: Color { return Color(red: 255/255, green: 229/255, blue: 230/255)} //FFE5E6
        static var redDark: Color { return Color(red: 219/255, green: 56/255, blue: 61/255) } //DB383D
        static var grayLight: Color { return Color(red: 237/255, green: 240/255, blue: 242/255) } //EDF0F2
        static var gray85: Color { return Color(red: 217/255, green: 217/255, blue: 217/255) } //D9D9D9
        static var gray95: Color { return Color(red: 242/255, green: 242/255, blue: 242/255) } //F2F2F2
        static var gray131: Color { return Color(red: 131/255, green: 131/255, blue: 131/255) } //838383
        static var gray238: Color { return Color(red: 238/255, green: 238/255, blue: 238/255) } //EEEEEE
        static var gray235: Color { return Color(red: 235/255, green: 239/255, blue: 245/255) } //EBEFF5
        static var buttonEnable: Color { return primary1 }
        
        static var blue235: Color { return Color(red: 209/255, green: 222/255, blue: 235/255) } //D1DEEB
        static var gray240: Color { return Color(red: 242/255, green: 240/255, blue: 240/255) } //F2F0F0
        
        static var temelBilgilerColor: Color { return Color(red: 71/255, green: 100/255, blue: 152/255) }
        static var noktaBilgilerColor: Color { return Color(red: 31/255, green: 78/255, blue: 120/255) }
        static var kapasiteBilgilerColor: Color { return Color(red: 179/255, green: 103/255, blue: 53/255) }
        static var ozelTanimlarColor: Color { return Color(red: 55/255, green: 86/255, blue: 35/255) }
        static var teslimatDetaylariColor: Color { return Color(red: 51/255, green: 63/255, blue: 79/255) }
        
        static var widgetTeslimat: Color { return Color(red: 127/255, green: 86/255, blue: 217/255) }
        static var widgetSefer: Color { return Color(red: 83/255, green: 202/255, blue: 108/255) }
        static var widgetOrtalama: Color { return Color(red: 255/255, green: 188/255, blue: 7/255) }
        static var widgetToplam: Color { return Color(red: 62/255, green: 125/255, blue: 195/255) }
        static var widgetRut: Color { return Color(red: 217/255, green: 85/255, blue: 80/255) }
        
        static var textGray: Color { return Color(red: 173/255, green: 173/255, blue: 173/255) }
        
        
        
        static var dateFilterStoreAndPlateBg: Color { return blueLight1 }
        static var dateFilterSelectedDate: Color { return primary1 }
        static var dateFilterDateBg: Color { return grayLight }
        static var dateFilterOpenCloseBg: Color { return gray85 }
        
        static var reportHeaderBg: Color { return primary1 }
        static var reportHeaderIconBg: Color { return blueLight }
        static var reportSubHeaderBg: Color { return gray95 }
        static var reportSubHeaderGroupBg: Color { return gray131 }
        
        static var statusMessageGreenDark: Color { return greenDark }
        static var statusMessageGreenLight: Color { return greenlight }
        static var statusMessageOrangeDark: Color { return orangeDark }
        static var statusMessageOrangeLight: Color { return orangeLight }
        static var statusMessageRedDark: Color { return redDark }
        static var statusMessageRedLight: Color { return redLight }
        static var statusMessageTabloHeaderBg: Color { return primary1 }
        
        static var leftListMenuBg: Color { return primary1 }
        
        static var listIconBg1: Color { return blueDark }
        static var listIconBg2: Color { return blueLight }
        static var listIconBg3: Color { return greenDark }
        static var listIconBg4: Color { return greenlight }
        static var listIconBg5: Color { return redDark }
        static var listIconBg6: Color { return redLight }
        static var listIconBg7: Color { return orangeLight }
    }
}



func getChartColorForIndex(i: Int) -> Color {
    switch i + 1 {
    case 1:
        return Color.ChartColors.color1
    case 2:
        return Color.ChartColors.color2
    case 3:
        return Color.ChartColors.color3
    case 4:
        return Color.ChartColors.color4
    case 5:
        return Color.ChartColors.color5
    case 6:
        return Color.ChartColors.color6
    default:
        return .red
    }
    
}

func generateColorPalette(steps: Int) -> [Color] {
    
    var colorList: [Color] = []
    let startHex = "ffff98"
    let endHEX = "9816a7"
    
    let colorStart = Color.init(hex: startHex)
    let colorEnd = Color.init(hex: endHEX)
    
    for i in 0..<steps{
        let ratio = Float(i) / Float(steps)
        let v1 = Float(colorEnd.components.red) * 255 * ratio + Float(colorStart.components.red) * 255 * (1 - ratio)
        let v2 = Float(colorEnd.components.green) * 255 * ratio + Float(colorStart.components.green) * 255 * (1 - ratio)
        let v3 = Float(colorEnd.components.blue) * 255 * ratio + Float(colorStart.components.blue) * 255 * (1 - ratio)
        
        let color = Color(red: Double(v1) / 255.0, green: Double(v2) / 255.0, blue: Double(v3) / 255.0)
        colorList.append(color)
        
    }
    return colorList
}
