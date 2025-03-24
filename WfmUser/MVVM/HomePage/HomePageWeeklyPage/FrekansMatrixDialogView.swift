//
//  FrekansMatrixDialogView.swift
//  WfmUser
//
//  Created by Mustafa Alper Aydin on 17.03.2025.
//

import SwiftUI

let satir1Width: CGFloat = 120
let satir2Width: CGFloat = 70
let satir1Height: CGFloat = 30
let dividerHeight: CGFloat = 30

struct FrekansMatrixDialogView: View {
    
    @EnvironmentObject var homePageVM: HomePageViewModel
    
    
    @State var selectedKritikGunAndFrekans: [String] = []
    
    @State var isFrekansDialogOpen: Bool = true
    @State var isFrekansDayOpen: Bool = false
    
    let gunler = ["Pt", "Sa", "Ca", "Pe", "Cu", "Ct", "Pz"]
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            if isFrekansDialogOpen {
                VStack(spacing: 0) {
                    ZStack {
                        DialogHeaderCard(text: "Frekans", background: Color.DialogColor.dialogHeaderDarkBlue) {
                            isFrekansDialogOpen.toggle()
                        }
                    }
                    
                    ScrollView {
                        ScrollView(.horizontal) {
                            VStack(spacing: 0) {
                                HStack(spacing: 0) {
                                    ForEach(-1...7, id: \.self) { i in
                                        HStack(spacing: 0) {
                                            Button(action: {
                                                withAnimation {
                                                    if i == -1 {
                                                        if isAllSelectedKritikGunAndFrekans() {
                                                            selectedKritikGunAndFrekans.removeAll()
                                                        } else {
                                                            for gun in gunler {
                                                                for i in 0...7 {
                                                                    if selectedKritikGunAndFrekans.contains("\(gun),\(i)") {
                                                                        
                                                                    } else {
                                                                        selectedKritikGunAndFrekans.append("\(gun),\(i)")
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    } else {
                                                        if isAllSelectedFrekans(i: i) {
                                                            for gun in gunler {
                                                                if selectedKritikGunAndFrekans.contains("\(gun),\(i)") {
                                                                    selectedKritikGunAndFrekans.removeAll { $0 == "\(gun),\(i)" }
                                                                } else {
                                                                    //
                                                                }
                                                            }
                                                        } else {
                                                            for gun in gunler {
                                                                if selectedKritikGunAndFrekans.contains("\(gun),\(i)") {
                                                                    //
                                                                } else {
                                                                    selectedKritikGunAndFrekans.append("\(gun),\(i)")
                                                                }
                                                            }
                                                        }
                                                    }
                                                    frekansMatrixFilter()
                                                }
                                            }, label: {
                                                HStack {
                                                    if i == -1 {
                                                        Text("ABFReTSec")
                                                        Image(systemName: isAllSelectedKritikGunAndFrekans() ? "checkmark.square.fill" : "square")
                                                            .resizable()
                                                            .frame(width: 15, height: 15)
                                                    } else {
                                                        Text("\(i)")
                                                        Image(systemName: isAllSelectedFrekans(i: i) ? "checkmark.square.fill" : "square")
                                                            .resizable()
                                                            .frame(width: 15, height: 15)
                                                    }
                                                    
                                                }.frame(width: i == -1 ? satir1Width : satir2Width, height: satir1Height)
                                                    .font(.custom(fontsRegular, size: 10))
                                                    .foregroundStyle(.black)
                                                    .background(getFrekansMatrixColor(for: "\(i)"))
                                            })
                                            Divider()
                                                .frame(height: dividerHeight)
                                        }
                                    }
                                }
                                Divider()
                                HStack(spacing: 0) {
                                    ForEach(-1...7, id: \ .self) { i in
                                        HStack(spacing: 0) {
                                            let count = homePageVM.personelRoutePointArray.filter { Int($0.frekans) == i }.count
                                            HStack(spacing: 0) {
                                                if i == -1 {
                                                    Text("\(count)")
                                                        .opacity(0.0)
                                                } else {
                                                    Text("\(count)")
                                                    Text("(\(count * i))")
                                                }
                                            }.frame(width: i == -1 ? satir1Width : satir2Width, height: satir1Height)
                                                .font(.custom(fontsRegular, size: 10))
                                                .background(getFrekansMatrixColor(for: "\(i)"))
                                                
                                            Divider()
                                                .frame(height: dividerHeight)
                                            
                                        }
                                    }
                                }
                                Divider()
                                
                                ForEach(1...7, id: \.self) { i in
                                    HStack(spacing: 0) {
                                        Button(action: {
                                            withAnimation {
                                                
                                                if i < 1 {
                                                    
                                                } else {
                                                    if isAllSelectedKritikGun(i: i) {
                                                        for j in 0...7 {
                                                            if selectedKritikGunAndFrekans.contains("\(gunler[i - 1]),\(j)") {
                                                                selectedKritikGunAndFrekans.removeAll { $0 == "\(gunler[i - 1]),\(j)" }
                                                            } else {
                                                                //
                                                            }
                                                        }
                                                    } else {
                                                        for j in 0...7 {
                                                            if selectedKritikGunAndFrekans.contains("\(gunler[i - 1]),\(j)") {
                                                                //
                                                            } else {
                                                                selectedKritikGunAndFrekans.append("\(gunler[i - 1]),\(j)")
                                                            }
                                                        }
                                                    }
                                                }
                                                frekansMatrixFilterKritikGun()
                                            }
                                        }, label: {
                                            HStack {
                                                
                                                Image(systemName: isAllSelectedKritikGun(i: i) ? "checkmark.square.fill" : "square")
                                                    .resizable()
                                                    .frame(width: 15, height: 15)
                                                
                                                if i < 1 {
                                                    Text("ABFReTSec")
                                                        .frame(maxWidth: .infinity)
                                                } else {
                                                    switch i {
                                                    case 1:
                                                        Text("ABFRePtsi")
                                                            .frame(maxWidth: .infinity)
                                                    case 2:
                                                        Text("ABFReSalı")
                                                            .frame(maxWidth: .infinity)
                                                    case 3:
                                                        Text("ABFReCars")
                                                            .frame(maxWidth: .infinity)
                                                    case 4:
                                                        Text("ABFRePers")
                                                            .frame(maxWidth: .infinity)
                                                    case 5:
                                                        Text("ABFReCuma")
                                                            .frame(maxWidth: .infinity)
                                                    case 6:
                                                        Text("ABFReCtsi")
                                                            .frame(maxWidth: .infinity)
                                                    case 7:
                                                        Text("ABFRePazr")
                                                            .frame(maxWidth: .infinity)
                                                    default:
                                                        Text("")
                                                            .frame(maxWidth: .infinity)
                                                    }
                                                }
                                            }.padding(.horizontal, 3)
                                                .frame(width: satir1Width, height: satir1Height)
                                                .font(.custom(fontsRegular, size: 10))
                                                .foregroundStyle(.white)
                                                .background(getDayColor(for: "\(i)"))
                                        })
                                        Divider()
                                            .frame(height: dividerHeight)
                                        ForEach(0...7, id: \.self) { j in
                                            let count = homePageVM.personelRoutePointArray.filter { Int($0.frekans) == j && $0.haftaninGunu == "\(i)"}.count
                                            Button {
                                                withAnimation {
                                                    let indexString = String(j)
                                                    let filterStr = "\(gunler[i - 1]),\(indexString)"
                                                    
                                                    if selectedKritikGunAndFrekans.contains(filterStr) {
                                                        selectedKritikGunAndFrekans.removeAll { $0 == filterStr }
                                                    } else {
                                                        selectedKritikGunAndFrekans.append(filterStr)
                                                    }
                                                    frekansMatrixFilter()
                                                }
                                            } label: {
                                                HStack(spacing: 0) {
                                                    HStack(spacing: 0) {
                                                        //Text("\(gunler[i - 1]),\(j)")
                                                        if i == -1 {
                                                            
                                                        } else {
                                                            Text("\(count)")
                                                            Text("(\(count * j))")
                                                        }
                                                    }.frame(maxWidth: .infinity)
                                                    Image(systemName: selectedKritikGunAndFrekans.contains("\(gunler[i - 1]),\(String(j))") ? "checkmark.square.fill" : "square")
                                                        .resizable()
                                                        .frame(width: 15, height: 15)
                                                }.padding(.horizontal, 5)
                                                    .frame(width: i == -1 ? satir1Width : satir2Width, height: satir1Height)
                                                    .font(.custom(fontsRegular, size: 10))
                                                    .foregroundStyle(.black)
                                            }
                                            Divider()
                                                .frame(height: dividerHeight)
                                        }
                                    }
                                    Divider()
                                }
                                
                            }
                        }
                    }.frame(maxHeight: screenHeight * 0.2)
                    
                }.background(.white)
                    .customOverlayStyle(cornerRadius: 10, lineColor: Color.DialogColor.dialogHeaderDarkBlue, lineWidth: 3)
                    
            } else {
                HStack {
                    Button(action: {
                        withAnimation {
                            isFrekansDialogOpen.toggle()
                        }
                    }, label: {
                        ZStack {
                            Text("")
                                .font(.custom(fontsSemiBold, size: 12))
                                .foregroundStyle(Color.DialogColor.dialogHeaderDarkBlue)
                                .rotationEffect(.degrees(-90))
                                .frame(width: 55, height: 90)
                                .background(.white)
                                .customOverlayStyle(cornerRadius: 10, lineColor: Color.DialogColor.dialogHeaderDarkBlue)
                            
                            Text("ABFReFrekans")
                                .font(.custom(fontsSemiBold, size: 12))
                                .foregroundStyle(.white)
                                .rotationEffect(.degrees(-90))
                                .frame(width: 50, height: 85)
                                .background(Color.DialogColor.dialogHeaderDarkBlue)
                                .customOverlayStyle(cornerRadius: 10, lineColor: Color.DialogColor.dialogHeaderDarkBlue)
                        }
                        
                            
                    })
                    Spacer()
                }
                
            }
        }.onChange(of: isFrekansDialogOpen, perform: { newValue in
            if isFrekansDialogOpen {
                for gun in gunler {
                    for i in 0...7 {
                        if selectedKritikGunAndFrekans.contains("\(gun),\(i)") {
                            
                        } else {
                            selectedKritikGunAndFrekans.append("\(gun),\(i)")
                        }
                    }
                }
            }
        })
        .onAppear(perform: {
            //loadUsers()
            for gun in gunler {
                for i in 0...7 {
                    if selectedKritikGunAndFrekans.contains("\(gun),\(i)") {
                        
                    } else {
                        selectedKritikGunAndFrekans.append("\(gun),\(i)")
                    }
                }
            }
        })
    }
    
    func isAllSelectedKritikGunAndFrekans() -> Bool {
        for gun in gunler {
            for i in 0...7 {
                if selectedKritikGunAndFrekans.contains("\(gun),\(i)") {
                    
                } else {
                    return false
                }
            }
        }
        return true
    }
    
    func isAllSelectedFrekans(i: Int) -> Bool {
        
        for gun in gunler {
            if selectedKritikGunAndFrekans.contains("\(gun),\(i)") {
                
            } else {
                return false
            }
        }
        
        return true
    }
    
    func isAllSelectedKritikGun(i: Int) -> Bool {
        for j in 0...7 {
            if selectedKritikGunAndFrekans.contains("\(gunler[i - 1]),\(j)") {
                
            } else {
                return false
            }
        }
        return true
    }
    
    func frekansMatrixFilter() {
        var filterArray: [PointModel] = []
        for filter in selectedKritikGunAndFrekans {
            let filterSp = filter.components(separatedBy: ",")
            
            if filterSp != [] {
                if let index = gunler.firstIndex(where: { $0 == filterSp[0] }) {
                    filterArray = filterArray + homePageVM.personelRoutePointArray.filter { nokta in
                        "\(index + 1)".contains(nokta.haftaninGunu) && filterSp[1].contains(nokta.frekans)
                    }
                } else {
                    
                }
            }
        }
        homePageVM.personelRoutePointArrayFrekansFilter = filterArray
        homePageVM.getWeeklyRoutePointMarker()
    }
    
    func frekansMatrixFilterKritikGun() {
        var filterArray: [PointModel] = []
        var kritikGun: [String] = []
        for filter in selectedKritikGunAndFrekans {
            let filterSp = filter.components(separatedBy: ",")
            
            if filterSp != [] {
                if let index = gunler.firstIndex(where: { $0 == filterSp[0] }) {
                    filterArray = filterArray + homePageVM.personelRoutePointArray.filter { nokta in
                        "\(index + 1)".contains(nokta.haftaninGunu) && filterSp[1].contains(nokta.frekans)
                    }
                }
                /*filterArray = filterArray + personelRoutePointArray.filter { nokta in
                    filterSp[0].contains(nokta.arac) && nokta.kritikGun.contains(filterSp[1])
                } */
            }
            if !kritikGun.contains(filterSp[1]) {
                kritikGun.append(filterSp[1])
            }
        }
        homePageVM.personelRoutePointArrayFrekansFilter = filterArray
        homePageVM.getWeeklyRoutePointMarker()
    }
    
    /*func loadUsers() {
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
    } */
}

#Preview {
    FrekansMatrixDialogView()
}
