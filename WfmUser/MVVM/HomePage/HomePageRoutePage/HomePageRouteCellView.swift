//
//  HomePageRouteCellView.swift
//  WfmUser
//
//  Created by Mustafa Alper Aydin on 17.03.2025.
//

import SwiftUI
import CoreLocation

struct HomePageRouteCellView: View {
    @EnvironmentObject var homePageVM: HomePageViewModel
    var pastCell: PointModel
    @State var cell: PointModel
    @State var showHowGo: Bool = false
    @State var navigateType: Int = 1
    
    @State var pointsArray: [PointModel] = []
    @State var personelRoutePointArray: [PointModel] = []
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea(.all)
            //if let cell = homePageVM.cell {
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        ZStack {
                            Rectangle()
                                .frame(width: 40, height: 40)
                                .foregroundStyle(Color.MyColor.releaseNoteBlueText)
                                .customOverlayStyle(cornerRadius: 10, lineColor: Color.MyColor.releaseNoteBlueText)
                            
                            Text("\(cell.sira)")
                                .font(.custom(fontsMedium, size: 16))
                                .foregroundStyle(.white)
                        }
                        VStack {
                            Text("\(cell.takipId) - \(cell.isim)")
                                .font(.custom(fontsSemiBold, size: 14))
                                .foregroundStyle(.gray)
                        }.frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 10)
                        Button(action: {
                            //
                        }, label: {
                            Image(systemName: "info.circle")
                                .resizable()
                                .frame(width: 20, height: 20)
                        })
                    }.padding(.horizontal, 5)
                        .padding(.vertical, 3)
                    
                    VStack(spacing: 0) {
                        
                        HStack {
                            Text("\(cell.gelenAdres)")
                                .font(.custom(fontsRegular, size: 14))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.vertical, 3)
                            
                            if cell.executionStatusId == LecyStatus.olumluTeslimat {
                                Image(systemName: "checkmark.circle.fill")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundStyle(.green)
                            } else if cell.executionStatusId == LecyStatus.olumsuzTeslimat {
                                Image(systemName: "xmark.circle.fill")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundStyle(.red)
                            }
                        }
                        
                        
                        
                        HStack {
                            Image(systemName: "clock.circle")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundStyle(.gray)
                            
                            Text("\(cell.baslangicZamani.formattedTimeYYYY_MM_DD()) -- \(cell.bitisZamani.formattedTimeYYYY_MM_DD())")
                                .font(.custom(fontsRegular, size: 14))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            if homePageVM.personelDayRoutePointArray.count > 0 {
                                if cell.takipId == homePageVM.personelDayRoutePointArray[0].takipId || cell.takipId == homePageVM.personelDayRoutePointArray[homePageVM.personelDayRoutePointArray.count - 1].takipId {
                                    Image(systemName: "house.circle")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                        .foregroundStyle(.black)
                                }
                            }
                            
                        }.padding(.vertical, 3)
                        
                        HStack {
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
                            Spacer()
                            Button(action: {
                                withAnimation {
                                    navigateType = 2
                                    showHowGo = true
                                }
                            }, label: {
                                HStack {
                                    Image(systemName: "map.fill")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                    
                                    Text("\((Int(cell.sira) ?? 0) - 1) >> \(cell.sira) Güzergah")
                                        .font(.custom(fontsSemiBold, size: 14))
                                }
                            })//.opacity(Int(cell.sira) ?? 0 <= 1 ? 0.0 : 1.0)
                            .opacity(0.0)
                        }.padding(.vertical, 3)
                        
                    }.padding(.horizontal, 5)
                    
                    if homePageVM.personelDayRoutePointArray.count > 0 {
                        if cell.takipId == homePageVM.personelDayRoutePointArray[0].takipId || cell.takipId == homePageVM.personelDayRoutePointArray[homePageVM.personelDayRoutePointArray.count - 1].takipId {
                            
                        } else {
                            HStack(spacing: 0) {
                                if cell.executionStatusId == LecyStatus.yolda || cell.executionStatusId == LecyStatus.gitmedim {
                                    CellExecutionGidiyorum(point: cell).environmentObject(homePageVM)
                                } else if cell.executionStatusId == LecyStatus.gidiyorum {
                                    CellExecutionGeldim(point: cell).environmentObject(homePageVM)
                                    CellExecutionGelmedim(point: cell).environmentObject(homePageVM)
                                } else if cell.executionStatusId == LecyStatus.teslimatFormuDolduruluyor {
                                    CellExecutionGeldim(point: cell).environmentObject(homePageVM)
                                    CellExecutionGelmedim(point: cell).environmentObject(homePageVM)
                                }
                            }
                        }
                    }
                    
                    
                }.background(LecyViewModel().colorBackground(cell: cell))
                    .customOverlayStyle(cornerRadius: 10, lineColor: .gray.opacity(0.2))
                    .padding(.horizontal, 3)
            //}
            
        }.actionSheet(isPresented: $showHowGo){
            
            ActionSheet(
                title: Text("\(NSLocalizedString("birHaritaSec", comment: ""))"),
                buttons: NavigationManager.getNavigation(type: navigateType, pastPoint: pastCell, selectedPoint: cell)
            )
        }
        .onAppear {
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
                    self.pointsArray = decodedData
                    self.personelRoutePointArray = self.pointsArray.filter { $0.arac == "07 BDU 311" }
                    self.cell = self.personelRoutePointArray[2]
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
    HomePageRouteCellView(pastCell: PointModel(sira: "", baslangicZamani: "", calismaSuresiDK: "", bitisZamani: "", isim: "", gelenAdres: "", score: "", arac: "", baslangicNoktasi: "", bitisNoktasi: "", mesafeKM: "", masraf: "", sureDK: "", enlem: "", boylam: "", takipId: "", tip: "", frekans: "", sla: "", kritikGun: "", kritikArac: "", kritikNokta: "", adet: "", kg: "", hacim: "", noktaninAracTipi: "", maxAdet: "", maxKG: "", maxHacim: "", aracTipi: "", rotaNo: "", referansNo: "", kmAvantaj: "", maliyet: "", kmMaliyet: "", barkod: "", siparisNotu: "", siparisTarihi: "", mesaiSuresi: "", haftaninGunu: "", haftaNo: "", il: "", ilce: "", mahalle: "", mxBlockId: "", blockColor: "", vehicleColor: "", mxRoutePointsId: "", slot: "", temsilciAdi: "", degerDesi: "", isRspNavigated: "", vehicleId: "", realPalet: "", slaWaitTime: "", tacoWaitTime: "", mxRouteProcessedId: "", bayi: "", bolge: "", guzergah: "", maxPalet: "", rotaBaslangicTarih: "", odemeTipi: "", nitelik15: "", nitelik16: "", rff10: "", rff1: "", rff2: "", executionStatusId: 0), cell: PointModel(sira: "", baslangicZamani: "", calismaSuresiDK: "", bitisZamani: "", isim: "", gelenAdres: "", score: "", arac: "", baslangicNoktasi: "", bitisNoktasi: "", mesafeKM: "", masraf: "", sureDK: "", enlem: "", boylam: "", takipId: "", tip: "", frekans: "", sla: "", kritikGun: "", kritikArac: "", kritikNokta: "", adet: "", kg: "", hacim: "", noktaninAracTipi: "", maxAdet: "", maxKG: "", maxHacim: "", aracTipi: "", rotaNo: "", referansNo: "", kmAvantaj: "", maliyet: "", kmMaliyet: "", barkod: "", siparisNotu: "", siparisTarihi: "", mesaiSuresi: "", haftaninGunu: "", haftaNo: "", il: "", ilce: "", mahalle: "", mxBlockId: "", blockColor: "", vehicleColor: "", mxRoutePointsId: "", slot: "", temsilciAdi: "", degerDesi: "", isRspNavigated: "", vehicleId: "", realPalet: "", slaWaitTime: "", tacoWaitTime: "", mxRouteProcessedId: "", bayi: "", bolge: "", guzergah: "", maxPalet: "", rotaBaslangicTarih: "", odemeTipi: "", nitelik15: "", nitelik16: "", rff10: "", rff1: "", rff2: "", executionStatusId: 0))
}

struct CellExecutionGeldim: View {
    @EnvironmentObject var homePageVM: HomePageViewModel
    var point: PointModel
    var body: some View {
        Button {
            //AnalyticsManager.shared.logButtonClick(buttonName: .HomeCameButton, screenName: .HomeScreen)
            if !homePageVM.isExcLocationError(LecyStatus.teslimatFormuDolduruluyor) {
                let dif = 10.0/*CLLocation(latitude: lastLocation!.coordinate.latitude, longitude: lastLocation!.coordinate.longitude).distance(from: CLLocation(latitude: Double(point.enlem) ?? -1.0, longitude: Double(point.boylam) ?? -1.0)) / 1000 */
                let formattedDistance = String(format: "%.2f", dif)
                homePageVM.error = "\(formattedDistance)"
                homePageVM.errorType = ErrorTypes.WARNING
                homePageVM.errorCode = LecyStatus.teslimatFormuDolduruluyor
                homePageVM.dialogExcPoint = point
                homePageVM.showAlert = true
                homePageVM.selectedPoint = point
            }
            
        } label: {
            ExecutionButtonGenericText(title: "\(NSLocalizedString("geldim", comment: ""))", color1: Color.MyColor.newGeldimColor, color2: Color.MyColor.newGeldimColor1)

        }.buttonStyle(ScaleButtonStyle())

    }
}

struct CellExecutionGelmedim: View {
    @EnvironmentObject var homePageVM: HomePageViewModel
    var point: PointModel
    var body: some View {
        Button {
            //AnalyticsManager.shared.logButtonClick(buttonName: .HomeUndoButton, screenName: .HomeScreen)
            if !homePageVM.isExcLocationError(LecyStatus.gitmedim) {
                homePageVM.error = "Gelmedim Olarak Kaydedilecek.\nEmin Misiniz?"
                homePageVM.errorType = ErrorTypes.WARNING
                homePageVM.errorCode = LecyStatus.gitmedim
                homePageVM.dialogExcPoint = point
                homePageVM.showAlert = true
            }
            
            
        } label: {
            ExecutionButtonGenericText(title: "\(NSLocalizedString("gelmedim", comment: ""))", color1: Color.MyColor.newGelmedimColor, color2: Color.MyColor.newGelmedimColor1)
        }.buttonStyle(ScaleButtonStyle())

    }
}

struct CellExecutionOlumlu: View {
    @EnvironmentObject var homePageVM: HomePageViewModel
    var point: PointModel
    var body: some View {
        Button {
            //AnalyticsManager.shared.logButtonClick(buttonName: .HomeUndoButton, screenName: .HomeScreen)
            if !homePageVM.isExcLocationError(LecyStatus.gitmedim) {
                homePageVM.error = "Gelmedim Olarak Kaydedilecek.\nEmin Misiniz?"
                homePageVM.errorType = ErrorTypes.WARNING
                homePageVM.errorCode = LecyStatus.olumluTeslimat
                homePageVM.dialogExcPoint = point
                homePageVM.showAlert = true
            }
            
            
        } label: {
            ExecutionButtonGenericText(title: "\(NSLocalizedString("olumlutamamla", comment: ""))", color1: Color.MyColor.newGeldimColor, color2: Color.MyColor.newGeldimColor1)
        }.buttonStyle(ScaleButtonStyle())

    }
}

struct CellExecutionOlumsuz: View {
    @EnvironmentObject var homePageVM: HomePageViewModel
    var point: PointModel
    var body: some View {
        Button {
            //AnalyticsManager.shared.logButtonClick(buttonName: .HomeUndoButton, screenName: .HomeScreen)
            if !homePageVM.isExcLocationError(LecyStatus.gitmedim) {
                homePageVM.error = "Gelmedim Olarak Kaydedilecek.\nEmin Misiniz?"
                homePageVM.errorType = ErrorTypes.WARNING
                homePageVM.errorCode = LecyStatus.olumsuzTeslimat
                homePageVM.dialogExcPoint = point
                homePageVM.showAlert = true
            }
            
            
        } label: {
            ExecutionButtonGenericText(title: "\(NSLocalizedString("olumsuztamamla", comment: ""))", color1: Color.MyColor.newGelmedimColor, color2: Color.MyColor.newGelmedimColor1)
        }.buttonStyle(ScaleButtonStyle())

    }
}

struct CellExecutionGidiyorum: View {
    @EnvironmentObject var homePageVM: HomePageViewModel
    var point: PointModel
    var body: some View {
        Button {
            //AnalyticsManager.shared.logButtonClick(buttonName: .HomeGoingButton, screenName: .HomeScreen)
            if !homePageVM.isExcLocationError(LecyStatus.gidiyorum) {
                var pointError: Bool = false
                let todayList = homePageVM.personelDayRoutePointArray
                //let tempList = todayList.filter{ (($0.executionStatusId != LecyStatus.yolda && $0.executionStatusId != LecyStatus.gitmedim && $0.executionStatusId != LecyStatus.cozulmediDevamEt && $0.executionStatusId != LecyStatus.noNameStatus2 && $0.executionStatusId != LecyStatus.noNameStatus1 && $0.executionStatusId != LecyStatus.teslimEtMt && $0.executionStatusId != LecyStatus.kismiTeslimEtMt)) }
                let tempList = todayList.filter{ (($0.executionStatusId == LecyStatus.gidiyorum || $0.executionStatusId == LecyStatus.geldim)) }
                
                print("tempListtempList333 - \(tempList.count)")
                if tempList.count > 0 {
                    print("tempListtempList - \(tempList.count)")
                    if tempList.contains { $0.mxRoutePointsId == point.mxRoutePointsId } {
                        print("tempListtempList111")
                        if LecyStatus.gidiyorum == LecyStatus.gidiyorum {
                            homePageVM.selectedPoint = point
                        }else if LecyStatus.gidiyorum == LecyStatus.teslimEtMt || LecyStatus.gidiyorum == LecyStatus.kismiTeslimEtMt {
                            homePageVM.selectedPoints = []
                            homePageVM.selectedPoints.append(point)
                        }
                    } else {
                        pointError = true
                    }
                }
                
                ///TODO
                if pointError {
                    print("BİTMEMİŞ İŞİNİZ BULUNMAKTADI")
                    homePageVM.showToast(message: "\(NSLocalizedString("baskaAktifIs", comment: ""))")
                    homePageVM.showAlert = false
                    //homePageVM.pointExcDialog = false
                } else {
                    homePageVM.selectedPoint = point
                    homePageVM.error = "Gidiyorum Olarak Kaydedilecek.\nEmin Misiniz?"
                    homePageVM.errorType = ErrorTypes.WARNING
                    homePageVM.errorCode = LecyStatus.gidiyorum
                    homePageVM.dialogExcPoint = point
                    homePageVM.showAlert = true
                }
            }
            
            
        } label: {
            ExecutionButtonGenericText(title: "\(NSLocalizedString("gidiyorum", comment: ""))", color1: Color.MyColor.newGidiyorumColor, color2: Color.MyColor.newGidiyorumColor1)
        }
    }
}


struct ExecutionButtonGenericText: View {
    var title: String
    var color1: Color
    var color2: Color
    var gidiyorumIcon: Bool = false
    var body: some View {
        HStack {
            if gidiyorumIcon {
                Image(ImageConstants.gidiyorumIcon.rawValue)
                    .resizable()
                    .frame(width: 27, height: 20)
                    .padding(.trailing, 10)
            }
            Text(title)
                .font(.custom(fontsSemiBold, size: 14))
                .foregroundStyle(.white)
                
        }.frame(maxWidth: .infinity)
            .frame(height: 35)
            .background(
                LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .top, endPoint: .bottom)
            )
    }
}

class LecyViewModel: ObservableObject {
    
    
    
    func colorBackground(cell: PointModel) -> Color {
        
        if cell.executionStatusId == LecyStatus.gidiyorum {
            return Color.LecyCellBackground.backgroundColorGidiyorum
        }else if cell.executionStatusId == LecyStatus.gidiyorum {
            return Color.LecyCellBackground.backgroundColorGeldim
        }else if cell.executionStatusId == LecyStatus.teslimatFormuDolduruluyor {
            return Color.LecyCellBackground.backgroundColorTeslimatFormuDolduruluyor
        }else if cell.executionStatusId == LecyStatus.olumluTeslimat {
            return Color.LecyCellBackground.backgroundColorOlumluTeslimat
        }else if cell.executionStatusId == LecyStatus.problemFormuDolduruluyor {
            return Color.LecyCellBackground.backgroundColorProblemFormuDolduruluyor
        }else if cell.executionStatusId == LecyStatus.mtCevapBekleniyor {
            return Color.LecyCellBackground.backgroundColorCevapBekleniyorMt
        }else if cell.executionStatusId == LecyStatus.sorunluOlumluTeslimat {
            return Color.LecyCellBackground.backgroundColorSorunluOlumluTeslimat
        }else if cell.executionStatusId == LecyStatus.olumsuzTeslimat {
            return Color.LecyCellBackground.backgroundColorOlumsuzTeslimat
        }else if cell.executionStatusId == LecyStatus.depoyaCekMt || cell.executionStatusId == LecyStatus.depoyaIadeMt {
            return Color.LecyCellBackground.backgroundColorDepoyaCekMt
        }else if cell.executionStatusId == LecyStatus.teslimEtMt {
            return Color.LecyCellBackground.backgroundColorTeslimEtMt
        }else if cell.executionStatusId == LecyStatus.kismiTeslimEtMt {
            return Color.LecyCellBackground.backgroundColorKısmıTeslimEtMt
        }else if cell.executionStatusId == LecyStatus.gorusulduCozumBekleniyorMt {
            return Color.LecyCellBackground.backgroundColorGörüsüldüCözümBekleniyorMt
        }else if cell.executionStatusId == LecyStatus.cozulmediDevamEt {
            return Color.LecyCellBackground.backgroundColorCözülmediDevamEt
        }else if cell.executionStatusId == LecyStatus.kismiOlumluTeslimat {
            return Color.LecyCellBackground.backgroundColorKısmıOlumluTeslimat
        }else{
            return Color.LecyCellBackground.backgroundColorNormal
        }
        
    }
    
    func status(cell: PointModel) -> String{
        if cell.executionStatusId == LecyStatus.geldim {
            return "\(NSLocalizedString("geldim", comment: ""))"
        }else if cell.executionStatusId == LecyStatus.gidiyorum {
            return "\(NSLocalizedString("gidiyorum", comment: ""))"
        }else if cell.executionStatusId == LecyStatus.git {
            return "\(NSLocalizedString("gti1", comment: ""))"
        }else if cell.executionStatusId == LecyStatus.yolda{
            return "\(NSLocalizedString("yolda1", comment: ""))"
        }else if cell.executionStatusId == LecyStatus.barcode_okunacak {
            return "\(NSLocalizedString("gti1", comment: ""))"
        }else{
            return ""
        }
    }
}
