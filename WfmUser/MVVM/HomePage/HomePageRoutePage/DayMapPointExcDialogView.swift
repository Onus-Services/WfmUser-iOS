//
//  DayMapPointExcDialogView.swift
//  WfmUser
//
//  Created by Mustafa Alper Aydin on 20.03.2025.
//

import SwiftUI

struct DayMapPointExcDialogView: View {
    @EnvironmentObject var homePageVM: HomePageViewModel
    
    var selectedPoint: PointModel?
    @State var pointsArray: [PointModel] = []
    @State var personelRoutePointArray: [PointModel] = []
    
    var body: some View {
        ZStack {
            /*Color.white
                .ignoresSafeArea(edges: .all) */
            
            if let selectedPoint = selectedPoint {
                VStack {
                    VStack {
                        HStack {
                            ZStack(content: {
                                Rectangle()
                                    .frame(width: 30, height: 40)
                                    .foregroundStyle(.white)
                                    .customOverlayStyle(cornerRadius: 10, lineColor: .gray)
                                
                                Text("\(selectedPoint.sira)")
                                    .font(.custom(fontsRegular, size: 14))
                                    .foregroundStyle(.black)
                            })
                            
                            Text("\(selectedPoint.gelenAdres)")
                                .foregroundStyle(.black)
                                .font(.custom(fontsRegular, size: 12))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            if homePageVM.personelDayRoutePointArray.count > 0 {
                                if selectedPoint.takipId == homePageVM.personelDayRoutePointArray[0].takipId || selectedPoint.takipId == homePageVM.personelDayRoutePointArray[homePageVM.personelDayRoutePointArray.count - 1].takipId {
                                    Image(systemName: "house.circle")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                        .foregroundStyle(.black)
                                }
                            }
                            
                            
                            
                        }.padding(.vertical, 5)

                        if homePageVM.personelDayRoutePointArray.count > 0 {
                            if selectedPoint.takipId == homePageVM.personelDayRoutePointArray[0].takipId || selectedPoint.takipId == homePageVM.personelDayRoutePointArray[homePageVM.personelDayRoutePointArray.count - 1].takipId  {
                                
                            } else {
                                HStack(spacing: 0) {
                                    if selectedPoint.executionStatusId == LecyStatus.yolda || selectedPoint.executionStatusId == LecyStatus.gitmedim {
                                        CellExecutionGidiyorum(point: selectedPoint).environmentObject(homePageVM)
                                    } else if selectedPoint.executionStatusId == LecyStatus.gidiyorum {
                                        CellExecutionGeldim(point: selectedPoint).environmentObject(homePageVM)
                                        CellExecutionGelmedim(point: selectedPoint).environmentObject(homePageVM)
                                    } else if selectedPoint.executionStatusId == LecyStatus.teslimatFormuDolduruluyor {
                                        CellExecutionGeldim(point: selectedPoint).environmentObject(homePageVM)
                                        CellExecutionGelmedim(point: selectedPoint).environmentObject(homePageVM)
                                    }
                                }
                            }
                        }
                        
                        
                    }.customOverlayStyle(cornerRadius: 10, lineColor: .gray.opacity(0.2))
                        .padding(.horizontal, 5)
                    Spacer()
                }
            }
            
        }.onAppear(perform: {
            //loadUsers()
        })
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
                    self.pointsArray = decodedData
                    self.personelRoutePointArray = self.pointsArray.filter { $0.arac == "07 BDU 311" }
                    //self.selectedPoint = self.personelRoutePointArray[2]
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
    DayMapPointExcDialogView()
}
