//
//  HomePageListWeeklyPageView.swift
//  WfmUser
//
//  Created by Mustafa Alper Aydin on 17.03.2025.
//

import SwiftUI

struct HomePageListWeeklyPageView: View {
    @EnvironmentObject var homePageVM: HomePageViewModel
    var personelRoutePointArray: [PointModel] = []
    @State var selectedDay: Int = -1
    @State var homePageType: Int = 0
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea(.all)
            VStack(spacing: 0) {
                VStack {
                    if homePageType == 0 {
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(0..<8, id:\.self) { i in
                                    Button(action: {
                                        selectedDay = i
                                    }, label: {
                                        VStack(spacing: 0) {
                                            HStack(spacing: 0) {
                                                HStack {
                                                    
                                                }.frame(width: 5, height: 100)
                                                    .background(getDayColorAll(for: "\(i)"))
                                                    
                                                VStack {
                                                    Text("\(String(localized: "WeeklyKm")) \(String(format: "%.2f", i == 0 ? homePageVM.personelRoutePointArray.compactMap { Double($0.mesafeKM) }.reduce(0, +) : homePageVM.personelRoutePointArray.filter { $0.haftaninGunu == "\(i)" }.compactMap { Double($0.mesafeKM) }.reduce(0, +)))")
                                                        .foregroundStyle(.black)
                                                        .font(.custom(fontsRegular, size: 12))
                                                    
                                                    Text("\(String(localized: "WeeklySure")) \(String(format: "%.2f", i == 0 ? homePageVM.personelRoutePointArray.compactMap { Double($0.sureDK) }.reduce(0, +) : homePageVM.personelRoutePointArray.filter { $0.haftaninGunu == "\(i)" }.compactMap { Double($0.sureDK) }.reduce(0, +))) \(String(localized: "WeeklySureKucuk"))")
                                                        .foregroundStyle(.black)
                                                        .font(.custom(fontsRegular, size: 12))
                                                    
                                                    Text("\(getDayNameAll(for: i))")
                                                        .font(.custom(fontsSemiBold, size: 12))
                                                        .foregroundStyle(.black)
                                                    
                                                    Text(i == 0 ? "\(homePageVM.personelRoutePointArray.count - 14)" : "\(homePageVM.personelRoutePointArray.filter { $0.haftaninGunu == "\(i)" }.count - 2)")
                                                        .font(.custom(fontsSemiBold, size: 12))
                                                        .foregroundStyle(.black)
                                                        .opacity(i == 0 ? 1.0 : homePageVM.personelRoutePointArray.filter { $0.haftaninGunu == "\(i)" }.count <= 0 ? 0.0 : 1.0)
                                                }.frame(maxWidth: .infinity)
                                            }
                                            
                                        }.frame(width: 100)
                                            .frame(height: 100)
                                            .background(selectedDay == i ? getDayColorAll(for: "\(i)").opacity(0.2) : .white)
                                            .customOverlayStyle(cornerRadius: 10, lineColor: getDayColorAll(for: "\(i)"), lineWidth: 2)
                                            //.background(getDayColorAll(for: "\(i)"))
                                    }).disabled(i == 0 ? false : (homePageVM.personelRoutePointArray.filter { $0.haftaninGunu == "\(i)" }.count <= 0 ? true : false))
                                }
                            }
                        }
                        
                        if selectedDay != -1 {
                            ScrollView {
                                VStack(spacing: 5) {
                                    if selectedDay == 0 {
                                        ForEach(0..<homePageVM.personelRoutePointArray.count, id:\.self) { i in
                                            let cell = homePageVM.personelRoutePointArray[i]
                                            Button {
                                                homePageVM.selectedPoint = cell
                                                homePageVM.isPointDialog = true
                                            } label: {
                                                HomePageRoutePagePointCellView(cell: cell)
                                            }
                                        }
                                    } else {
                                        ForEach(0..<homePageVM.personelRoutePointArray.filter { $0.haftaninGunu == "\(selectedDay)" }.count, id:\.self) { i in
                                            let cell = homePageVM.personelRoutePointArray.filter { $0.haftaninGunu == "\(selectedDay)" }[i]
                                            Button {
                                                homePageVM.selectedPoint = cell
                                                homePageVM.isPointDialog = true
                                            } label: {
                                                HomePageRoutePagePointCellView(cell: cell)
                                            }
                                        }
                                    }
                                }.padding(.horizontal, 5)
                            }.padding(.top, 5)
                        } else {
                            Text("WeeklyGoruntuleGun")
                                .font(.custom(fontsSemiBold, size: 14))
                                .foregroundStyle(.black)
                        }
                    } else {
                        ZStack {
                            HelperMainMapView(mapView: homePageVM.mapView, markerClicked: { mapMarker in
                                homePageVM.markerClicked(groupingList: mapMarker)
                            }, updateMapView: { map in
                                homePageVM.getWeeklyRoutePointMarker()
                            })
                            
                            if homePageVM.frekansDialogIsReady {
                                VStack {
                                    Spacer()
                                    HStack {
                                        FrekansMatrixDialogView().environmentObject(homePageVM)
                                        //Spacer()
                                    }
                                }.padding(5)
                            }
                            
                            
                        }
                        
                    }
                }.frame(maxHeight: .infinity, alignment: .top)
                
                HomePageBottomBar(homePageType: $homePageType).environmentObject(homePageVM)
                    .padding(.bottom, 1)
            }.frame(maxHeight: .infinity, alignment: .top)
            if homePageVM.isPointDialog {
                RoutePointDialogView().environmentObject(homePageVM)
            }
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
                    //self.personelRoutePointArray = decodedData.filter { $0.arac == "07 BDU 311" }
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
    HomePageListWeeklyPageView()//.environmentObject(HomePageViewModel())
}


func getDayNameAll(for number: Int) -> String {
    let dayMap: [Int: String] = [
        0: String(localized: "DayHafta"),
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

func getDayColorAll(for number: String) -> Color {
    let colorMap: [String: Color] = [
        "0": Color(red: 212/255, green: 217/255, blue: 32/255),
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
