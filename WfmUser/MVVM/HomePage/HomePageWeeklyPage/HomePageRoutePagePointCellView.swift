//
//  HomePageRoutePagePointCellView.swift
//  WfmUser
//
//  Created by Mustafa Alper Aydin on 17.03.2025.
//

import SwiftUI

struct HomePageRoutePagePointCellView: View {
    var cell: PointModel
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea(.all)
            //if let cell = homePageVM.cell {
                VStack(spacing: 0) {
                    
                    HStack(spacing: 0) {
                        ZStack {
                            Rectangle()
                                .frame(width: 25, height: 25)
                                .foregroundStyle(.white)
                                .customOverlayStyle(cornerRadius: 8, lineColor: .black)
                            
                            Text("\(cell.sira)")
                                .font(.custom(fontsRegular, size: 12))
                                .foregroundStyle(.black)
                        }.padding(.horizontal, 5)
                        HomePageRoutePagePointCellAracPlaka(colorStr: cell.vehicleColor, text: "Araç", desc: cell.arac)
                        HomePageRoutePagePointCellAracPlaka(text: "Gün", desc: getDayNameShort(for: cell.haftaninGunu), color: getDayColor(for: cell.haftaninGunu))
                        Spacer()
                        Text("| \(cell.baslangicZamani.formattedTimeYYYY_MM_DD()) - \(cell.bitisZamani.formattedTimeYYYY_MM_DD()) / (\(cell.calismaSuresiDK))")
                            .font(.custom(fontsRegular, size: 12))
                            .padding(.horizontal, 5)
                            .foregroundStyle(.black)
                    }
                    Divider()
                    HStack(spacing: 0) {
                        Text("Müşteri Adı: ")
                            .font(.custom(fontsMedium, size: 12))
                            .foregroundStyle(.black)
                        Text("\(cell.isim)")
                            .font(.custom(fontsRegular, size: 12))
                            .foregroundStyle(.black)
                            .lineLimit(1)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }.padding(.horizontal, 5)
                    HStack(spacing: 0) {
                        HStack(spacing: 0) {
                            Text("İl: ")
                                .font(.custom(fontsMedium, size: 12))
                                .foregroundStyle(.black)
                            Text("\(cell.il)")
                                .font(.custom(fontsRegular, size: 12))
                                .foregroundStyle(.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        HStack(spacing: 0) {
                            Text("İlçe: ")
                                .font(.custom(fontsMedium, size: 12))
                                .foregroundStyle(.black)
                            Text("\(cell.ilce)")
                                .font(.custom(fontsRegular, size: 12))
                                .foregroundStyle(.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        HStack(spacing: 0) {
                            Text("Mah.: ")
                                .font(.custom(fontsMedium, size: 12))
                                .foregroundStyle(.black)
                            Text("\(cell.mahalle)")
                                .font(.custom(fontsRegular, size: 12))
                                .foregroundStyle(.black)
                                .lineLimit(1)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }.padding(.horizontal, 5)
                    HStack(spacing: 20) {
                        HStack(spacing: 0) {
                            Text("KM: ")
                                .font(.custom(fontsMedium, size: 12))
                                .foregroundStyle(.black)
                            Text("\(cell.mesafeKM)")
                                .font(.custom(fontsRegular, size: 12))
                                .foregroundStyle(.black)
                        }
                        HStack(spacing: 0) {
                            Text("DK: ")
                                .font(.custom(fontsMedium, size: 12))
                                .foregroundStyle(.black)
                            Text("\(cell.sureDK)")
                                .font(.custom(fontsRegular, size: 12))
                                .foregroundStyle(.black)
                        }
                        HStack(spacing: 0) {
                            Text("Frekans: ")
                                .font(.custom(fontsMedium, size: 12))
                                .foregroundStyle(.black)
                            Text("\(cell.frekans)")
                                .font(.custom(fontsRegular, size: 12))
                                .foregroundStyle(.black)
                        }
                        HStack(spacing: 0) {
                            Text("Ağırlık/Hacim: ")
                                .font(.custom(fontsMedium, size: 12))
                                .foregroundStyle(.black)
                            Text("\(cell.kg) / \(cell.hacim)")
                                .font(.custom(fontsRegular, size: 12))
                                .foregroundStyle(.black)
                        }
                    }.frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 5)
                    
                }.customOverlayStyle(cornerRadius: 10, lineColor: .black.opacity(0.3))
            //}
        }
    }
}

/*
#Preview {
    HomePageRoutePagePointCellView().environmentObject(HomePageViewModel())
}
*/

struct HomePageRoutePagePointCellAracPlaka: View {
    
    var colorStr: String = ""
    var text: String
    var desc: String
    var color: Color = .white
    
    var body: some View {
        HStack(spacing: 0) {
            if colorStr == "" {
                Rectangle()
                    .frame(width: 5, height: 30)
                    .foregroundStyle(color)
            } else {
                Rectangle()
                    .frame(width: 5, height: 30)
                    .foregroundStyle(Color.init(hex1: colorStr))
            }
            Text("\(text): \(desc)")
                .font(.custom(fontsMedium, size: 12))
                .foregroundStyle(.black)
                .padding(.horizontal, 5)
        }
    }
}

func getDayNameShort(for number: String) -> String {
    let dayMap: [String: String] = [
        "1": "Pzt.",
        "2": "Salı",
        "3": "Çarş.",
        "4": "Perş.",
        "5": "Cuma",
        "6": "Cts.",
        "7": "Pzr."
    ]
    
    return dayMap[number] ?? ""
}

func getDayColor(for number: String) -> Color {
    let colorMap: [String: Color] = [
        "1": Color(red: 236/255, green: 31/255, blue: 32/255),
        "2": Color(red: 21/255, green: 29/255, blue: 246/255),
        "3": Color(red: 53/255, green: 193/255, blue: 0/255),
        "4": Color(red: 212/255, green: 163/255, blue: 0/255),
        "5": Color(red: 0/255, green: 217/255, blue: 217/255),
        "6": Color(red: 207/255, green: 152/255, blue: 254/255),
        "7": Color(red: 238/255, green: 220/255, blue: 0/255)
    ]
    return colorMap[number] ?? Color.white
}

func getDayName(for number: Int) -> String {
    let dayMap: [Int: String] = [
        1: "Pazartesi",
        2: "Salı",
        3: "Çarşamba",
        4: "Perşembe",
        5: "Cuma",
        6: "Cumartesi",
        7: "Pazar"
    ]
    
    return dayMap[number] ?? ""
}

func getFrekansMatrixColor(for number: String) -> Color {
    let colorMap: [String: Color] = [
        "1": Color(red: 255/255, green: 157/255, blue: 157/255),
        "2": Color(red: 151/255, green: 255/255, blue: 158/255),
        "3": Color(red: 252/255, green: 255/255, blue: 161/255),
        "4": Color(red: 166/255, green: 169/255, blue: 255/255),
        "5": Color(red: 223/255, green: 159/255, blue: 255/255),
        "6": Color(red: 255/255, green: 207/255, blue: 143/255),
        "7": Color(red: 152/255, green: 238/255, blue: 255/255)
    ]
    
    return colorMap[number] ?? Color.white
}
