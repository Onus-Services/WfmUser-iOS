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
    @State var selectedDay: Int = 0
    
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
                
            VStack {
                VStack {
                    /*Text(monthYearTitle)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding() */
                    
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
            }.frame(maxHeight: .infinity, alignment: .top)
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

