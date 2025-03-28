//
//  MonthlyPageView.swift
//  WfmUser
//
//  Created by Mustafa Alper Aydin on 21.03.2025.
//

import SwiftUI

struct MonthlyPageView: View {
    
    let calendar = Calendar.current
    let currentMonth: Date
        
    var daysInMonth: [Date] {
        guard let range = calendar.range(of: .day, in: .month, for: currentMonth) else { return [] }
        return range.compactMap { day -> Date? in
            var components = calendar.dateComponents([.year, .month], from: currentMonth)
            components.day = day
            return calendar.date(from: components)
        }
    }
    
    @EnvironmentObject var homePageVM: HomePageViewModel
    
    @State var selectedWeekIndex: Int = 0
    
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                
                VStack {
                    
                    ForEach(1..<5, id:\.self) { i in
                        MonthlyPageViewWeekTitleButton(weekIndex: i, selectedWeekIndex: selectedWeekIndex) {
                            if selectedWeekIndex == i {
                                selectedWeekIndex = 0
                            } else {
                                selectedWeekIndex = i
                            }
                        }.environmentObject(homePageVM)
                    }
                    
                }.padding(.horizontal, 5)
            }.frame(maxHeight: .infinity, alignment: .top)
                
            /*VStack {
                VStack {
                    
                    let columns = Array(repeating: GridItem(.flexible()), count: 7)
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(weekdays, id: \..self) { day in
                            Text(day)
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                        }
                            
                        ForEach(startPadding(), id: \..self) { _ in
                            Text("")
                                .frame(height: 40)
                        }
                            
                        ForEach(daysInMonth, id: \..self) { date in
                            Button(action: {
                                var day = getDayOfWeek(from: date)
                                if day == "Pazartesi" {
                                    selectedDay = 1
                                } else if day == "Salı" {
                                    selectedDay = 2
                                } else if day == "Çarşamba" {
                                    selectedDay = 3
                                } else if day == "Perşembe" {
                                    selectedDay = 4
                                } else if day == "Cuma" {
                                    selectedDay = 5
                                } else if day == "Cumartesi" {
                                    selectedDay = 6
                                } else if day == "Pazar" {
                                    selectedDay = 7
                                }
                            }, label: {
                                Text(dayFormatter.string(from: date))
                                    .frame(width: 40, height: 40)
                                    .background(date.dayMonthFormat == currentMonth.dayMonthFormat ? Color.green.opacity(0.2) : Color.blue.opacity(0.2))
                                    .cornerRadius(8)
                            })
                        }
                    }
                    .padding()
                }
                
                if selectedDay != 0 {
                    ScrollView {
                        VStack(spacing: 5) {
                            ForEach(0..<homePageVM.personelRoutePointArray.filter { $0.haftaninGunu == "\(selectedDay)" }.count, id:\.self) { i in
                                let cell = homePageVM.personelRoutePointArray.filter { $0.haftaninGunu == "\(selectedDay)" }[i]
                                Button {
                                    homePageVM.selectedPoint = cell
                                    homePageVM.isPointDialog = true
                                } label: {
                                    HomePageRoutePagePointCellView(cell: cell)
                                }
                            }
                        }.padding(.horizontal, 5)
                    }.padding(.top, 5)
                } else {
                    Text("Görüntülemek istediğiniz günü seçiniz.")
                        .font(.custom(fontsSemiBold, size: 14))
                        .foregroundStyle(.black)
                }
            }.frame(maxHeight: .infinity, alignment: .top) */
            
            
            
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
    
    func getDayOfWeek(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE" // Tam gün ismi (Pazartesi, Salı, vb.)
        dateFormatter.locale = Locale(identifier: "tr_TR") // Türkçe gün isimleri için
        return dateFormatter.string(from: date)
    }

        
    var monthYearTitle: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: currentMonth)
    }
        
    var weekdays: [String] {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "tr_TR")
        //return formatter.shortWeekdaySymbols
        return ["Pt", "Sa", "Ça", "Pe", "Cu", "Ct", "Pz"]
    }
        
    func startPadding() -> [Int] {
        guard let firstDay = daysInMonth.first else { return [] }
        let weekday = calendar.component(.weekday, from: firstDay)
        let adjustedWeekday = (weekday + 5) % 7 + 1 // Haftayı pazartesiden başlat
        return Array(repeating: 0, count: adjustedWeekday - 1)
    }
        
    let dayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter
    }()
}

#Preview {
    MonthlyPageView(currentMonth: Date())
}


struct MonthlyPageViewWeekTitleButton: View {
    
    @EnvironmentObject var homePageVM: HomePageViewModel
    var weekIndex: Int
    var selectedWeekIndex: Int
    @State var selectedDay: Int = -1
    var onTap: () -> Void
    
    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    onTap()
                }
            }, label: {
                VStack {
                    HStack {
                        VStack(spacing: 0) {
                            Text("\(weekIndex). \(String(localized: "MonthlyWeek")) tarih1-tarih2")
                                .font(.custom(fontsMedium, size: 14))
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(5)
                                
                            HStack {
                                Text("\(String(localized: "MonthlyKm")) \(String(format: "%.2f", homePageVM.personelRoutePointArray.compactMap { Double($0.mesafeKM) }.reduce(0, +)))")
                                    .font(.custom(fontsMedium, size: 14))
                                    .foregroundStyle(.white)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text("\(String(localized: "MonthlySure")) \(String(format: "%.2f", homePageVM.personelRoutePointArray.compactMap { Double($0.sureDK) }.reduce(0, +)))")
                                    .font(.custom(fontsMedium, size: 14))
                                    .foregroundStyle(.white)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }.padding(5)
                            
                        }.frame(maxWidth: .infinity)
                        
                        Image(systemName: selectedWeekIndex == weekIndex ? "chevron.up.circle.fill" : "chevron.down.circle.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundStyle(.white)
                            .padding(.horizontal, 5)
                    }
                }.background(Color.MyColor.bottomMenuBlueColor)
                    .customOverlayStyle(cornerRadius: 10, lineColor: Color.MyColor.bottomMenuBlueColor)
            })
            if selectedWeekIndex == weekIndex {
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
                                            Text("\(String(localized: "MonthlyKm")) \(String(format: "%.2f", i == 0 ? homePageVM.personelRoutePointArray.compactMap { Double($0.mesafeKM) }.reduce(0, +) : homePageVM.personelRoutePointArray.filter { $0.haftaninGunu == "\(i)" }.compactMap { Double($0.mesafeKM) }.reduce(0, +)))")
                                                .foregroundStyle(.black)
                                                .font(.custom(fontsRegular, size: 12))
                                            
                                            Text("\(String(localized: "MonthlySure")) \(String(format: "%.2f", i == 0 ? homePageVM.personelRoutePointArray.compactMap { Double($0.sureDK) }.reduce(0, +) : homePageVM.personelRoutePointArray.filter { $0.haftaninGunu == "\(i)" }.compactMap { Double($0.sureDK) }.reduce(0, +))) dk")
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
                    Text("MonthlyGoruntuleGun")
                        .font(.custom(fontsSemiBold, size: 14))
                        .foregroundStyle(.black)
                }
            }
        }
    }
}
