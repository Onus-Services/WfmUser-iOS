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
                                .frame(width: 25, height: 30)
                                .foregroundStyle(.white)
                                .customOverlayStyle(cornerRadius: 10, lineColor: getDayColor(for: cell.haftaninGunu), lineWidth: 2)
                            
                            Text("\(cell.sira)")
                                .font(.custom(fontsSemiBold, size: 12))
                                .foregroundStyle(Color.init(hex1: cell.vehicleColor))
                        }.padding(.horizontal, 5)
                        
                        Text("\(cell.isim)")
                            .font(.custom(fontsSemiBold, size: 14))
                            .foregroundStyle(.black)
                            .frame(height: 50)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.center)
                    }
                    
                    /*HomePageRoutePagePointCellAracPlaka(colorStr: cell.vehicleColor, text: "Araç", desc: cell.arac)
                    HomePageRoutePagePointCellAracPlaka(text: "Gün", desc: getDayNameShort(for: cell.haftaninGunu), color: getDayColor(for: cell.haftaninGunu))
                    Spacer()
                    Text("| \(cell.baslangicZamani.formattedTimeYYYY_MM_DD()) - \(cell.bitisZamani.formattedTimeYYYY_MM_DD()) / (\(cell.calismaSuresiDK))")
                        .font(.custom(fontsRegular, size: 12))
                        .padding(.horizontal, 5)
                        .foregroundStyle(.black) */
                    
                    Divider()
                    HStack(spacing: 20) {
                        HStack(spacing: 5) {
                            Image(systemName: "road.lanes")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundStyle(.black)
                            Text("\(cell.mesafeKM) \(String(localized: "RoutePageKm"))")
                                .font(.custom(fontsSemiBold, size: 16))
                                .foregroundStyle(.black)
                        }.frame(maxWidth: .infinity, alignment: .leading)
                        HStack(spacing: 5) {
                            Image(systemName: "clock")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundStyle(.black)
                            Text("\(cell.sureDK) \(String(localized: "RoutePageDk"))")
                                .font(.custom(fontsSemiBold, size: 16))
                                .foregroundStyle(.black)
                        }.frame(maxWidth: .infinity, alignment: .leading)
                        HStack(spacing: 0) {
                            Image(systemName: "scalemass")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundStyle(.black)
                            Text("\(cell.kg) / \(cell.hacim)")
                                .font(.custom(fontsSemiBold, size: 16))
                                .foregroundStyle(.black)
                        }.frame(maxWidth: .infinity, alignment: .leading)
                    }.frame(maxWidth: .infinity, alignment: .leading)
                        .padding(5)
                    
                    HStack(spacing: 20) {
                        HStack(spacing: 5) {
                            Text("\(String(localized: "RoutePageSla")) \(cell.baslangicZamani.formattedTimeYYYY_MM_DD()) - \(cell.bitisZamani.formattedTimeYYYY_MM_DD())")
                                .font(.custom(fontsSemiBold, size: 16))
                                .foregroundStyle(.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("\(String(localized: "RoutePageIsSuresi")) \(cell.calismaSuresiDK) \(String(localized: "RoutePageDkKucuk"))")
                                .font(.custom(fontsSemiBold, size: 16))
                                .foregroundStyle(.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }.frame(maxWidth: .infinity, alignment: .leading)
                    }.frame(maxWidth: .infinity, alignment: .leading)
                        .padding(5)
                    
                    HStack(spacing: 0) {
                        HStack(spacing: 0) {
                            Text("\(cell.il.uppercased())/\(cell.ilce.uppercased())-\(cell.mahalle)")
                                .font(.custom(fontsRegular, size: 14))
                                .foregroundStyle(.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }.padding(.horizontal, 5)
                    
                    HStack(spacing: 0) {
                        HStack(spacing: 0) {
                            Text("RoutePageSiparisNot")
                                .font(.custom(fontsRegular, size: 14))
                                .foregroundStyle(.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }.padding(.horizontal, 5)
                    
                }.customOverlayStyle(cornerRadius: 10, lineColor: .black.opacity(0.3))
            //}
        }.onAppear {
            //loadUsers()
        }
    }
    
    func loadUsers() {
        guard let fileURL = Bundle.main.url(forResource: "wfmUser", withExtension: "txt") else {
            print("❌ Dosya bulunamadı!")
            return
        }

        do {
            let rawData = try Data(contentsOf: fileURL)
                
            // 1. JSON'u String olarak oku
            guard let jsonString = String(data: rawData, encoding: .utf8) else {
                print("❌ Dosya içeriği stringe çevrilemedi!")
                return
            }
                
            print("✅ JSON STRING OKUNDU: \(jsonString.prefix(200))...")  // İlk 200 karakteri göster (kontrol amaçlı)
                
            // 2. İlk JSON decode işlemi: String formatında saklanan JSON'u tekrar JSON'a çevir
            guard let jsonData = jsonString.data(using: .utf8) else {
                print("❌ JSON string, Data'ya çevrilemedi!")
                return
            }
                
            let jsonStringDecoded: String
            do {
                jsonStringDecoded = try JSONDecoder().decode(String.self, from: jsonData)
                print("✅ JSON STRING DECODE EDİLDİ")
            } catch {
                print("❌ İlk JSON decode hatası: \(error.localizedDescription)")
                return
            }
                
            // 3. İkinci JSON decode işlemi: Asıl JSON veri modeline çevir
            guard let finalJsonData = jsonStringDecoded.data(using: .utf8) else {
                print("❌ Final JSON data oluşturulamadı!")
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode([PointModel].self, from: finalJsonData)
                DispatchQueue.main.async {
                    //self.cell = decodedData.filter { $0.arac == "07 BDU 311" }[2]
                }
                print("✅ JSON BAŞARIYLA DECODE EDİLDİ!")
            } catch let DecodingError.dataCorrupted(context) {
                print("❌ Data Corrupted: \(context)")
            } catch let DecodingError.keyNotFound(key, context) {
                print("❌ Eksik Anahtar: \(key.stringValue) – Context: \(context.debugDescription)")
            } catch let DecodingError.typeMismatch(type, context) {
                print("❌ Tür Uyumsuzluğu: \(type) – Context: \(context.debugDescription)")
            } catch let DecodingError.valueNotFound(value, context) {
                print("❌ Değer Eksik: \(value) – Context: \(context.debugDescription)")
            } catch {
                print("❌ Genel JSON Decode Hatası: \(error.localizedDescription)")
            }
        } catch {
            print("❌ Dosya okuma hatası: \(error.localizedDescription)")
        }
    }
}


#Preview {
    HomePageRoutePagePointCellView(cell: PointModel(sira: "", baslangicZamani: "", calismaSuresiDK: "", bitisZamani: "", isim: "", gelenAdres: "", score: "", arac: "", baslangicNoktasi: "", bitisNoktasi: "", mesafeKM: "", masraf: "", sureDK: "", enlem: "", boylam: "", takipId: "", tip: "", frekans: "", sla: "", kritikGun: "", kritikArac: "", kritikNokta: "", adet: "", kg: "", hacim: "", noktaninAracTipi: "", maxAdet: "", maxKG: "", maxHacim: "", aracTipi: "", rotaNo: "", referansNo: "", kmAvantaj: "", maliyet: "", kmMaliyet: "", barkod: "", siparisNotu: "", siparisTarihi: "", mesaiSuresi: "", haftaninGunu: "", haftaNo: "", il: "", ilce: "", mahalle: "", mxBlockId: "", blockColor: "", vehicleColor: "", mxRoutePointsId: "", slot: "", temsilciAdi: "", degerDesi: "", isRspNavigated: "", vehicleId: "", realPalet: "", slaWaitTime: "", tacoWaitTime: "", mxRouteProcessedId: "", bayi: "", bolge: "", guzergah: "", maxPalet: "", rotaBaslangicTarih: "", odemeTipi: "", nitelik15: "", nitelik16: "", rff10: "", rff1: "", rff2: "", executionStatusId: -1))
}


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
        "1": String(localized: "DayPazartesiKisa"),
        "2": String(localized: "DaySaliKisa"),
        "3": String(localized: "DayCarsambaKisa"),
        "4": String(localized: "DayPersembeKisa"),
        "5": String(localized: "DayCumaKisa"),
        "6": String(localized: "DayCumartesiKisa"),
        "7": String(localized: "DayPazarKisa")
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
        1: String(localized: "DayPazartesi"),
        2: String(localized: "DaySali"),
        3: String(localized: "DayCarsamba"),
        4: String(localized: "DayPersembe"),
        5: String(localized: "DayCuma"),
        6: String(localized: "DayCumartesi"),
        7: String(localized: "DayPazar")
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
