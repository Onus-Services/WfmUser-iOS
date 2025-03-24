//
//  HomePageDashboard.swift
//  WfmAdmin
//
//  Created by Mustafa Alper Aydin on 4.02.2025.
//

import SwiftUI

struct HomePageDashboard: View {
    @EnvironmentObject var homePageVM: HomePageViewModel
    
    @State var showSelectStoreMenu = false
    @State var showSelectUserPlateMenu = false
    @State var showSelectDateMenu = false
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea(.all)
            
            VStack(spacing: 3) {
                /*OtoRefreshCardView(otoResfreshSelected: $homePageVM.otoRefreshSelectIndex) {
                    //
                } onTapPicker: {
                    homePageVM.otoRefreshSelectIndex = homePageVM.otoRefreshSelectIndex
                    preferences.set(homePageVM.otoRefreshSelectIndex, forKey: "otoRefreshSelectIndex")
                    homePageVM.otoRefreshList(type: 1)
                } onTapRefresh: {
                    homePageVM.otoRefreshList(type: 0)
                }
                
                DateFilterHeaderView(type: 0, storeAndUserFilter: true, filterOpen: true, selectedDateType: $homePageVM.globalSelectedDateType, selectedFirstDate: $homePageVM.gloablSelectedFirstDate, selectedSecondDate: $homePageVM.globalSelectedSecondDate, selectedStoreArray: $homePageVM.globalSelectedStoreArray, selectedUserPlateArray: $homePageVM.globalSelectedUserPlateArray, storeArray: $homePageVM.globalStoreArray, userPlateArray: $homePageVM.globalUserPlateArray, listReportType: .constant(0), customDate1: $homePageVM.customDate1, customDate2: $homePageVM.customDate2) {
                    homePageVM.isOtoRefresh.toggle()
                    preferences.set(homePageVM.isOtoRefresh, forKey: "isOtoRefresh")
                    homePageVM.otoRefreshList(type: 1)
                } otoRefreshSpinner: {
                    homePageVM.selectOtoRefresh = homePageVM.otoRefreshSelectIndex!
                    preferences.set(homePageVM.selectOtoRefresh, forKey: "otoRefreshSelectIndex")
                } otoRefreshManuel: {
                    homePageVM.otoRefreshList(type: 2)
                } selectStoreMenu: {
                    showSelectUserPlateMenu = false
                    showSelectDateMenu = false
                    showSelectStoreMenu.toggle()
                } selectPlateMenu: {
                    showSelectStoreMenu = false
                    showSelectDateMenu = false
                    showSelectUserPlateMenu.toggle()
                } dateFilterToday: {
                    print("Bugün seçildi")
                    homePageVM.getReportAll(loading: true) { r in
                        //
                    }
                    homePageVM.otoRefreshList(type: 1)
                } dateFilterTomorrow: {
                    print("Dün seçildi")
                    homePageVM.getReportAll(loading: true) { r in
                        //
                    }
                    homePageVM.otoRefreshList(type: 1)
                } dateFilterLastWeek: {
                    print("Geçen hafta")
                    homePageVM.getReportAll(loading: true) { r in
                        //
                    }
                    homePageVM.otoRefreshList(type: 1)
                } dateFilterCustomDate: {
                    homePageVM.globalSelectedDateType = .customDate
                    showSelectStoreMenu = false
                    showSelectUserPlateMenu = false
                    showSelectDateMenu.toggle()
                    homePageVM.otoRefreshList(type: 1)
                } onAppearFunc: {
                    /*if !mainPageVM.firstOnAppearFunc {
                        print("AAAALALALALA")
                        homePageVM.getReportAll(loading: true) { r in
                            //
                        }
                    } */
                }.onChange(of: homePageVM.globalSelectedDateType) { _ in
                    if homePageVM.globalSelectedDateType == .today {
                        homePageVM.otoRefreshList(type: 1)
                    }
                } */
                
                if homePageVM.reportDetailArray.count < 1 {
                    NoValueDescView()
                } else {
                    ScrollView {
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(alignment: .top) {
                                ForEach(0..<homePageVM.widgets.count, id:\.self) { i in
                                    WidgetCardViewNew(widgets: homePageVM.widgets[i])
                                }
                            }
                        }.padding(10)
                            .background(.white)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.gray, lineWidth: 1) // Çerçeve rengi ve genişliği
                            )
                            .padding(.horizontal, 10)
                         
                        Spacer()
                        ScrollView {
                            ForEach(0..<homePageVM.addedReport.count, id:\.self) { i in
                                ReportView(data: homePageVM.reportDetailArray, selectedReport: homePageVM.addedReport[i], reportIndex: i, stores: [], plates: []).environmentObject(homePageVM)
                            }
                        }
                    }
                }
            }
            
            
            /*if showSelectStoreMenu {
                DropDownUserStoresMenu(showUserStoresMenu: $showSelectStoreMenu, stores: $homePageVM.globalStoreArray, selectedStores: $homePageVM.globalSelectedStoreArray) {
                    homePageVM.getMerchReport()
                    homePageVM.getReportAll(loading: true) { r in
                        //
                    }
                }.padding(.top, 117) //72
            }
            
            if showSelectUserPlateMenu {
                DropDownUserPlatesMenu(showSelectUserPlateMenu: $showSelectUserPlateMenu, plates: $homePageVM.globalUserPlateArray, selectedPlates: $homePageVM.globalSelectedUserPlateArray) {
                    homePageVM.getReportAll(loading: true) { r in
                        //
                    }
                }.padding(.top, 117)
            }
            
            if homePageVM.globalSelectedDateType == .customDate && showSelectDateMenu {
                CalendarSelectView(showSelectDateMenu: $showSelectDateMenu, firstSelectedDate: $homePageVM.customDate1, secondSelectedDate: $homePageVM.customDate2) {
                    showSelectDateMenu = false
                    let calendar = Calendar.current
                    let components = calendar.dateComponents([.day], from: homePageVM.customDate1!, to: homePageVM.customDate2!)
                    if let days = components.day, days > 7 {
                        if let adjustedDate = calendar.date(byAdding: .day, value: 7, to: homePageVM.customDate1!) {
                            homePageVM.customDate2 = adjustedDate
                        }
                    }
                    homePageVM.gloablSelectedFirstDate = homePageVM.customDate1!
                    homePageVM.globalSelectedSecondDate = homePageVM.customDate2!
                    
                    homePageVM.getReportAll(loading: true) { r in
                        //
                    }
                }.padding(.top, 172)
                /*DropDownDatePickerMenu(type: 0, showSelectDateMenu: $showSelectDateMenu, firstDate: $homePageVM.customDate1, secondDate: $homePageVM.customDate2) {
                    print("Özel Tarih")
                    let calendar = Calendar.current
                    let components = calendar.dateComponents([.day], from: homePageVM.customDate1, to: homePageVM.customDate2)
                    if let days = components.day, days > 7 {
                        if let adjustedDate = calendar.date(byAdding: .day, value: 7, to: homePageVM.customDate1) {
                            homePageVM.customDate2 = adjustedDate
                        }
                    }
                    homePageVM.gloablSelectedFirstDate = homePageVM.customDate1
                    homePageVM.globalSelectedSecondDate = homePageVM.customDate2
                    
                    homePageVM.getReportAll(loading: true) { r in
                        //
                    }
                }.padding(.top, 172) //127 */
            } */
        }
    }
}

#Preview {
    HomePageDashboard()
}
