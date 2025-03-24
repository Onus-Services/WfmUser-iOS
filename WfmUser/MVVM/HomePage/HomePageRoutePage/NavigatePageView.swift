//
//  NavigatePageView.swift
//  WfmUser
//
//  Created by Mustafa Alper Aydin on 20.03.2025.
//

import SwiftUI

struct NavigatePageView: View {
    
    @EnvironmentObject var homePageVM: HomePageViewModel
    
    var selectedPoint: PointModel?
    @State var pointsArray: [PointModel] = []
    @State var personelRoutePointArray: [PointModel] = []
    
    @State var showHowGo: Bool = false
    @State var navigateType: Int = 1
    
    @State var orderNote: String = ""
    
    var body: some View {
        ZStack {
            Color.clear
                .ignoresSafeArea(edges: .all)
            
            if let point = selectedPoint {
                VStack(spacing: 0) {
                    HStack {
                        Button(action: {
                            withAnimation {
                                homePageVM.homePagePageType = 0
                            }
                        }, label: {
                            HStack {
                                Image(systemName: "chevron.backward.circle")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundStyle(.blue)
                                
                                Text("Geri")
                                    .font(.custom(fontsRegular, size: 12))
                                    .foregroundStyle(.blue)
                            }.background(.white)
                                .padding(5)
                                .customOverlayStyle(cornerRadius: 10, lineColor: .blue)
                            
                        })
                        
                        Text("TakipId: \(point.takipId)")
                            .foregroundStyle(.black)
                            .font(.custom(fontsRegular, size: 12))
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Button(action: {
                            withAnimation {
                                if !homePageVM.isExcLocationError(LecyStatus.gitmedim) {
                                    homePageVM.error = "Gelmedim Olarak Kaydedilecek.\nEmin Misiniz?"
                                    homePageVM.errorType = ErrorTypes.WARNING
                                    homePageVM.errorCode = LecyStatus.gitmedim
                                    homePageVM.dialogExcPoint = point
                                    homePageVM.showAlert = true
                                }
                            }
                        }, label: {
                            Text("gelmedim")
                                .font(.custom(fontsRegular, size: 12))
                                .padding(.horizontal, 10)
                                .frame(height: 30)
                                .background(
                                    LinearGradient(gradient: Gradient(colors: [Color.MyColor.newGelmedimColor, Color.MyColor.newGelmedimColor1]), startPoint: .top, endPoint: .bottom)
                                )
                                //.font(.system(size: 12, weight: .light, design: .default))
                                .foregroundColor(Color.white)
                        }).cornerRadius(5)
                    }.padding(.horizontal, 10)
                        .padding(.vertical, 1)
                    
                    ZStack {
                        HelperMainMapView(mapView: homePageVM.mapView, updateMapView: { map in
                            homePageVM.getNavigateSelectedPointMarker()
                        })
                    }.frame(maxWidth: .infinity)
                        .frame(height: 300)
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            withAnimation {
                                navigateType = 1
                                showHowGo = true
                            }
                        }, label: {
                            HStack {
                                Image(systemName: "map.fill")
                                    .resizable()
                                    .frame(width: 15, height: 15)
                                    .foregroundStyle(Color.white)
                                
                                Text("Yol Tarifi")
                                    .font(.custom(fontsSemiBold, size: 14))
                                    .foregroundStyle(Color.white)
                            }.padding(10)
                                .background(Color.MyColor.releaseNoteBlueText)
                                .customOverlayStyle(cornerRadius: 10, lineColor: .clear)
                        })
                    }.padding(.horizontal, 10)
                        .padding(.vertical, 5)
                    
                    VStack(spacing: 0) {
                        NavigatePageViewTextView(text: "Başlık", desc: "\(point.isim)", bgColorIndex: 0).lineLimit(2)
                        NavigatePageViewTextView(text: "Adres", desc: "\(point.gelenAdres)", bgColorIndex: 1).lineLimit(2)
                        HStack(spacing: 0) {
                            NavigatePageViewTextView(text: "SLA", desc: "\(point.sla)", bgColorIndex: 0, hstack: true)
                            NavigatePageViewTextView(text: "İ.Süre", desc: "\(point.calismaSuresiDK)", bgColorIndex: 0, hstack: true)
                        }
                        HStack(spacing: 0) {
                            NavigatePageViewTextView(text: "Değer", desc: "\(point.degerDesi)", bgColorIndex: 1, hstack: true)
                            NavigatePageViewTextView(text: "Yük", desc: "0", bgColorIndex: 1, hstack: true)
                        }
                        HStack(spacing: 0) {
                            NavigatePageViewTextView(text: "Hacim", desc: "\(point.hacim)", bgColorIndex: 0, hstack: true)
                            NavigatePageViewTextView(text: "Adet", desc: "\(point.adet)", bgColorIndex: 0, hstack: true)
                        }
                        HStack(spacing: 0) {
                            NavigatePageViewTextView(text: "K.Gün", desc: "\(point.kritikGun)", bgColorIndex: 1, hstack: true)
                            NavigatePageViewTextView(text: "K.Araç", desc: "\(point.kritikArac)", bgColorIndex: 1, hstack: true)
                        }
                        HStack(spacing: 0) {
                            NavigatePageViewTextView(text: "K.Nokta", desc: "\(point.kritikNokta)", bgColorIndex: 0, hstack: true)
                            NavigatePageViewTextView(text: "Frekans", desc: "\(point.frekans)", bgColorIndex: 0, hstack: true)
                        }
                        
                        ZStack(alignment: .topLeading) {
                            TextEditor(text: $orderNote)
                                .font(.custom(fontsRegular, size: 14))
                                .padding(.horizontal, 5)
                                .frame(maxHeight: 50) // Yüksekliği ayarlayabilirsin
                                .background(Color.white)
                                .customOverlayStyle(cornerRadius: 10, lineColor: .gray)
                                .padding(5)
                            if orderNote.isEmpty {
                                Text("Nokta notu")
                                    .font(.custom(fontsRegular, size: 14))
                                    .foregroundColor(.gray)
                                    .padding(8)
                            }
                        }
                        
                    }.background(.white)
                        .customOverlayStyle(cornerRadius: 10, lineColor: .gray)
                        .padding(.horizontal, 10)
                    
                    VStack {
                        
                        HStack {
                            if point.executionStatusId == LecyStatus.gidiyorum {
                                CellExecutionGeldim(point: point).customOverlayStyle(cornerRadius: 10, lineColor: .clear).environmentObject(homePageVM)
                                CellExecutionGelmedim(point: point).customOverlayStyle(cornerRadius: 10, lineColor: .clear).environmentObject(homePageVM)
                            } else if point.executionStatusId == LecyStatus.teslimatFormuDolduruluyor {
                                CellExecutionOlumlu(point: point).customOverlayStyle(cornerRadius: 10, lineColor: .clear).environmentObject(homePageVM)
                                CellExecutionOlumsuz(point: point).customOverlayStyle(cornerRadius: 10, lineColor: .clear).environmentObject(homePageVM)
                            }
                        }
                        
                    }.padding(.horizontal, 10)
                        .padding(.vertical, 10)
                    
                    
                }.frame(maxHeight: .infinity, alignment: .top)
                    .actionSheet(isPresented: $showHowGo){
                        
                        ActionSheet(
                            title: Text("\(NSLocalizedString("birHaritaSec", comment: ""))"),
                            buttons: NavigationManager.getNavigation(type: 1, selectedPoint: point)
                        )
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
    NavigatePageView()
}

struct NavigatePageViewTextView: View {
    
    var text: String
    var desc: String
    var bgColorIndex: Int
    var hstack: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 5) {
                Text(text)
                    .font(.custom(fontsRegular, size: 12))
                    .foregroundStyle(.black)
                    .frame(maxWidth: 75, alignment: .leading)
                    .padding(.leading, 5)
                
                Divider()
                    .frame(height: 35)
                
                Text(desc)
                    .font(.custom(fontsRegular, size: 12))
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                if hstack {
                    Divider()
                        .frame(height: 35)
                }
            }.frame(maxWidth: .infinity)
            Divider()
        }.background(bgColorIndex == 0 ? .white : .gray.opacity(0.1))
    }
}
