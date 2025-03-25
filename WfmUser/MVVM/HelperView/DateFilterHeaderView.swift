//
//  DateFilterHeaderView.swift
//  WfmAdmin
//
//  Created by Mustafa Alper Aydin on 28.01.2025.
//

import SwiftUI

struct DateFilterHeaderView: View {
    
    var type: Int
    var storeAndUserFilter: Bool = false
    var zoneFilter: Bool = false
    var zoneAndDayFilter: Bool = false
    
    @State var filterOpen: Bool = true
    
    @State private var isToNewAPI: Bool = false
    
    @Binding var selectedDateType: SelectedDateType
    
    @Binding var selectedFirstDate: Date
    @Binding var selectedSecondDate: Date
    
    @Binding var selectedStoreArray: [Int]
    @Binding var selectedUserPlateArray: [String]
    
    @Binding var storeArray: [MasterCompanyModel]
    @Binding var userPlateArray: [PlateUserModel]

    @Binding var listReportType: Int
    
    @Binding var customDate1: Date
    @Binding var customDate2: Date
    
    var otoRefreshCheckbox: () -> Void = {}
    var otoRefreshSpinner: () -> Void = {}
    var otoRefreshManuel: () -> Void = {}
    
    var listZoneCheckbox: () -> Void = {}
    var listDayCheckbox: () -> Void = {}
    
    var selectStoreMenu: () -> Void = {}
    var selectPlateMenu: () -> Void = {}
    var selectZoneMenu: () -> Void = {}
    
    
    var dateFilterToday: () -> Void = {}
    var dateFilterTomorrow: () -> Void = {}
    var dateFilterLastWeek: () -> Void = {}
    var dateFilterLastMount: () -> Void = {}
    var dateFilterLastThreeMount: () -> Void = {}
    var dateFilterCustomDate: () -> Void = {}
    var dateFilterCustomDate1: () -> Void = {}
    
    var onAppearFunc: () -> Void = {}
    
    var body: some View {
        ZStack {
            VStack(spacing: 10) {
                
                if filterOpen {
                    HStack {
                        if storeAndUserFilter {
                            
                            DateFilterHeaderViewButton(text: selectedStoreArray.count == 0 ? String(localized: "DFHDepoSeciniz") : selectedStoreArray.count == 1 ? getSubCompanyNames(forSelectedCompanyIds: selectedStoreArray, from: storeArray) : String(localized: "DFHCokluSecim"), icon: ImageConstants.store.rawValue) {
                                selectStoreMenu()
                            }
                            
                            DateFilterHeaderViewButton(text: selectedUserPlateArray.count == 0 ? String(localized: "DFHKullanıcıSeciniz") : selectedUserPlateArray.count == 1 ? getSubPlate(forSelectedStaffIds: selectedUserPlateArray, from: userPlateArray) : String(localized: "DFHCokluSecim"), icon: ImageConstants.user.rawValue) {
                                selectPlateMenu()
                            }
                        }
                        
                        if zoneFilter {
                            DateFilterHeaderViewButton(text: "Bölge Seçiniz", icon: "xmark") {
                                selectZoneMenu()
                            }
                        }
                    }.padding(.top, 10)
                        .padding(.horizontal, 10)
                    
                    HStack(spacing: 0) {
                        
                        DateFilterHeaderViewDateButton(text: String(localized: "DFHBugün"), isSelected: selectedDateType == .today ? true : false) {
                            selectedDateType = .today
                            dateFilterToday()
                            if type == 0 {
                                preferences.set(true, forKey: "isToNewAPI1")
                                preferences.set(true, forKey: "isToNewAPI2")
                            } else if type == 1 {
                                preferences.set(true, forKey: "isToNewAPI0")
                                preferences.set(true, forKey: "isToNewAPI2")
                            } else {
                                preferences.set(true, forKey: "isToNewAPI0")
                                preferences.set(true, forKey: "isToNewAPI1")
                            }
                        }
                        
                        DateFilterHeaderViewDateButton(text: String(localized: "DFHDün"), isSelected: selectedDateType == .tomorrow ? true : false) {
                            selectedDateType = .tomorrow
                            dateFilterTomorrow()
                            if type == 0 {
                                preferences.set(true, forKey: "isToNewAPI1")
                                preferences.set(true, forKey: "isToNewAPI2")
                            } else if type == 1 {
                                preferences.set(true, forKey: "isToNewAPI0")
                                preferences.set(true, forKey: "isToNewAPI2")
                            } else {
                                preferences.set(true, forKey: "isToNewAPI0")
                                preferences.set(true, forKey: "isToNewAPI1")
                            }
                        }
                        
                        DateFilterHeaderViewDateButton(text: String(localized: "DFHGecenHafta"), isSelected: selectedDateType == .lastWeek ? true : false) {
                            selectedDateType = .lastWeek
                            dateFilterLastWeek()
                            if type == 0 {
                                preferences.set(true, forKey: "isToNewAPI1")
                                preferences.set(true, forKey: "isToNewAPI2")
                            } else if type == 1 {
                                preferences.set(true, forKey: "isToNewAPI0")
                                preferences.set(true, forKey: "isToNewAPI2")
                            } else {
                                preferences.set(true, forKey: "isToNewAPI0")
                                preferences.set(true, forKey: "isToNewAPI1")
                            }
                        }
                        
                        DateFilterHeaderViewDateButton(text: /*selectedDateType == .customDate ? "\(formatDate(selectedFirstDate))\n\(formatDate(selectedSecondDate))" : "Tarih Aralığı"*/ String(localized: "DFHTarihAraligi"), isSelected: false, customDate: selectedDateType == .customDate ? true : false) {
                            selectedFirstDate = customDate1 ?? Date()
                            selectedSecondDate = customDate2 ?? Date()
                            dateFilterCustomDate()
                        }.onTapGesture(perform: {
                            withAnimation {
                                dateFilterCustomDate1()
                                customDate1 = selectedFirstDate
                                customDate2 = selectedSecondDate
                            }
                        })
                    }.padding(.horizontal, 5)
                        .frame(maxWidth: .infinity, maxHeight: 45)
                        .background(Color.NewColor.dateFilterDateBg)
                        .cornerRadius(8)
                        .padding(.horizontal, 10)
                    
                    Button {
                        withAnimation {
                            filterOpen.toggle()
                        }
                    } label: {
                        VStack(spacing: 0) {
                            Image(ImageConstants.closeFilter.rawValue)
                                .offset(y: 3.5)
                            Image(ImageConstants.closeFilterLine.rawValue)
                        }
                    }
                } else {
                    HStack {
                        DateFilterHeaderSmallViewInfo(text: selectedDateType == .customDate ? "\(customDate1.ddMMYYFormat)\n\(customDate2.ddMMYYFormat)" : selectedDateType.description, icon: ImageConstants.calendar.rawValue)
                        
                        /*DateFilterHeaderSmallViewInfo(text: "\(selectedStoreArray.count)", icon: ImageConstants.store.rawValue)
                        
                        DateFilterHeaderSmallViewInfo(text: "\(selectedUserPlateArray.count)", icon: ImageConstants.user.rawValue) */
                        
                        Button {
                            withAnimation {
                                filterOpen.toggle()
                            }
                        } label: {
                            Image(ImageConstants.openFilter.rawValue)
                                .foregroundStyle(.black)
                                .frame(height: 50)
                                .padding(.horizontal, 10)
                                .background(Color.NewColor.dateFilterOpenCloseBg)
                        }

                    }
                    
                }
                
            }.background(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1))
                .cornerRadius(8)
                .padding(.horizontal, 10)
                
        }.onAppear {
            if type == 0 {
                if preferences.bool(forKey: "isToNewAPI0") {
                    onAppearFunc()
                    preferences.set(false, forKey: "isToNewAPI0")
                }
            } else if type == 1 {
                if preferences.bool(forKey: "isToNewAPI1") {
                    onAppearFunc()
                    preferences.set(false, forKey: "isToNewAPI1")
                }
            } else if type == 2 {
                if preferences.bool(forKey: "isToNewAPI2") {
                    onAppearFunc()
                    preferences.set(false, forKey: "isToNewAPI2")
                }
            }
        }
    }
}

/*
#Preview {
    DateFilterHeaderView(type: 1, storeAndUserFilter: true, selectedDateType: .constant(SelectedDateType.today), isOtoRefresh: .constant(false), otoRefreshSelectIndex: .constant(nil), selectedFirstDate: .constant(Date()), selectedSecondDate: .constant(Date()), selectedStoreArray: .constant([]), selectedUserPlateArray: .constant([]), storeArray: .constant(localMasterCompanyModel), userPlateArray: .constant(localPlateModel), rafBolgeModel: .constant([]), selectedZoneArray: .constant([]), listReportType: .constant(1))
}
*/
struct DateFilterHeaderViewButton: View {
    var text: String
    var icon: String
    var onTap: () -> Void
    var body: some View {
        Button {
            onTap()
        } label: {
            HStack {
                Image(icon)
                    .resizable()
                    .frame(width: 25, height: 25)
                Text(text)
                    .font(.custom(fontsRegular, size: 13))
                    .lineLimit(1)
            }.foregroundStyle(.black)
                .padding(.vertical, 8)
                .frame(maxWidth: .infinity)
                .background(Color.NewColor.dateFilterStoreAndPlateBg)
                .cornerRadius(8.0)
        }
    }
}

struct DateFilterHeaderViewDateButton: View {
    var text: String
    var isSelected: Bool
    var customDate: Bool = false
    var onTap: () -> Void

    var body: some View {
        
        Button(action: {
            withAnimation {
                onTap()
            }
        }, label: {
            Text(text)
                .lineLimit(2)
                .font(.custom(fontsRegular, size: 13))
                .foregroundStyle(customDate ? Color.NewColor.dateFilterSelectedDate : isSelected ? Color.NewColor.dateFilterSelectedDate : .black)
                .frame(maxWidth: .infinity, maxHeight: 35)
                .background(customDate ? .white : isSelected ? .white : .clear)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(isSelected ? Color.NewColor.dateFilterSelectedDate : .clear, lineWidth: 1))
        }).frame(maxWidth: .infinity)
            .disabled(customDate ? false : isSelected)
    }
}

struct DateFilterHeaderSmallViewInfo: View {
    var text: String
    var icon: String

    var body: some View {
        
        HStack {
            Image(icon)
                .resizable()
                .frame(width: 30, height: 30)
            Text(text)
                .font(.custom(fontsMedium, size: 14))
        }.frame(maxWidth: .infinity)
    }
}

func getSubCompanyNames(forSelectedCompanyIds selectedIds: [Int], from storeModels: [MasterCompanyModel]) -> String {
    // MasterCompanyModel dizisini CompanyId'ye göre filtreleyerek uygun olanların SubCompanyName'lerini al
    let filteredMasterCompanyModels = storeModels.filter { store in
        selectedIds.contains(store.CompanyId)
    }
    // Filtrelenen MasterCompanyModel'lerden SubCompanyName'lerini çıkart
    let subCompanyNames = filteredMasterCompanyModels.map { $0.SubCompanyName }
    return subCompanyNames.first ?? ""
}

func getSubPlate(forSelectedStaffIds selectedIds: [String], from plateModels: [PlateUserModel]) -> String {
    // MasterCompanyModel dizisini CompanyId'ye göre filtreleyerek uygun olanların SubCompanyName'lerini al
    let filteredMasterCompanyModels = plateModels.filter { store in
        selectedIds.contains(store.StaffId)
    }
    // Filtrelenen MasterCompanyModel'lerden SubCompanyName'lerini çıkart
    let subCompanyNames = filteredMasterCompanyModels.map { $0.Plate }
    return subCompanyNames.first ?? ""
}

enum SelectedDateType: Int {
    
    case today = 0
    case tomorrow = 1
    case lastWeek = 2
    case customDate = 3
    case lastMount = 4
    case threeMount = 5
    
    var description: String {
        switch self {
        case .today:
            return String(localized: "DFHBugün")
        case .tomorrow:
            return String(localized: "DFHDün")
        case .lastWeek:
            return String(localized: "DFHGecenHafta")
        case .customDate:
            return String(localized: "DFHTarihAraligi")
        case .lastMount:
            return "Geçen Ay"
        case .threeMount:
            return "Üç Ay"
        }
    }

}
