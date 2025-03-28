//
//  ReportView.swift
//  RxAdmin
//
//  Created by Banu Ortac on 7.06.2024.
//

import SwiftUI

struct ReportView: View {
    @EnvironmentObject var homePageVM: HomePageViewModel
    
    @State var indexSelectedReport: Int?
    @State var indexSelectedGroup: Int? = 0
    var isReportOneDay: Bool = true
    var data: [ReportModel] //= localReportModel
    
    let reportTypes: [ReportType] = [.barTeslimat, .pieTeslimat, .lineHesaplananToplananKm, .barHesaplananToplananSaat, .barAdresSkor, .barOrtalamaGeofence, .barAracVerimlilik, .barSeferBBB, .barDuraklama, .barKumeleme, .barOrtalamaTeslimat]
    
    @State var raporDescriptions: [String] = []
    @State var selectedReport: ReportType? = .barTeslimat
    var reportIndex: Int
    
    var groupPickerData: [String] = ["Araç Plaka", "Depo"]
    
    //@State var plates: [Plates]
    @State var stores: [MasterCompanyModel]
    
    @State var plates: [PlateUserModel]
    
    @State var selectedPlate: [String] = []
    @State var showPlateMenu = false
    
    @State var selectedStore: [Int] = []
    @State var showStoreMenu = false
    
    @State private var raporDescriptionsLoad: Bool = false
    
    var isCompareReport: Bool = false
    
    @State private var lastSelectedReport: ReportType?
    
    var body: some View {
        //30+35+35
        ZStack {
            
            if raporDescriptionsLoad {
                VStack(spacing: 0) {
                    
                    HStack {
                        /*Text("RAPOR \(reportIndex + 1)")
                            .font(.custom(fontsMedium, size: 15)) */
                        
                        Text(selectedReport == nil ? "" : "\(selectedReport?.description ?? "")")
                            .font(.custom(fontsRegular, size: 14))
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .trailing) {
                            PickerTextField(data: raporDescriptions, placeholder: "\(String(localized: "ChartRaporTipi"))", type: 3, lastSelectedIndex: $indexSelectedReport) {
                                lastSelectedReport = selectedReport
                                selectedReport = ReportIndex().indexSelectedReport(index: indexSelectedReport!)
                                /*if homePageVM.addedReport.contains(ReportIndex().indexSelectedReport(index: indexSelectedReport!)) {
                                    //homePageVM.addedReport.removeAll { $0 == ReportIndex().indexSelectedReport(index: indexSelectedReport!) }
                                } else {
                                    homePageVM.addedReport.append(ReportIndex().indexSelectedReport(index: indexSelectedReport!))
                                } */
                                indexSelectedReport = nil
                            }.frame(maxWidth: 50)
                            Image(systemName: "arrowtriangle.down.fill")
                                .resizable()
                                .frame(width: 7, height: 7)
                                .foregroundColor(.black)
                                .padding(.leading, 6)
                        }.padding(.vertical, 5)
                            .padding(.horizontal, 10)
                            .background(.white)
                            .cornerRadius(5.0)
                            .frame(height: 20)
                            .padding(.horizontal, 10)
                        
                        if !isCompareReport {
                            
                            /*ReportViewHeaderSmallButton(icon: ImageConstants.raporKarsilastirma.rawValue) {
                                homePageVM.compareReportArray.append(selectedReport!)
                                homePageVM.compareReportGroups.append(indexSelectedGroup!)
                                homePageVM.compareReportSelectedPlates.append(selectedPlate)
                                homePageVM.compareReportSelectedStores.append(selectedStore)
                                //homePageVM.compareReportArray.append(selectedReport!)
                                homePageVM.compareReportGroups.append(indexSelectedGroup!)
                                homePageVM.compareReportSelectedPlates.append(selectedPlate)
                                homePageVM.compareReportSelectedStores.append(selectedStore)
                                homePageVM.isCompareReportView = true
                            } */
                            
                            if selectedReport != .barTeslimat && selectedReport != .lineHesaplananToplananKm {
                                ReportViewHeaderSmallButton(icon: homePageVM.localReport.contains(selectedReport!) ? ImageConstants.raporUnfavIcon.rawValue : ImageConstants.raporFavIcon.rawValue) {
                                    saveReportPreferences(selectedReport!)
                                    if homePageVM.localReport.contains(selectedReport!) {
                                        homePageVM.localReport.removeAll { $0 == selectedReport! }
                                    } else {
                                        homePageVM.localReport.append(selectedReport!)
                                        if lastSelectedReport != nil {
                                            homePageVM.addedReport.append(selectedReport!)
                                            selectedReport = lastSelectedReport
                                            
                                        }
                                    }
                                     
                                }
                            }
                            
                            ReportViewHeaderSmallButton(icon: ImageConstants.raporBuyutIcon.rawValue) {
                                homePageVM.fullScreenChartReportType = selectedReport!
                                homePageVM.fullScreenChartDetail = getChartDetails(isReportOneDay: isReportOneDay, groupType: indexSelectedGroup!, reportType: selectedReport!, report: filterReportData(selectedStore: selectedStore, selectedPlate: selectedPlate))
                                withAnimation {
                                    homePageVM.isFullScreenChart = true
                                }
                            }
                        }
                        
                    }.frame(height: 35)
                        .padding(.horizontal, 10)
                        .background(Color.NewColor.reportHeaderBg)
                        .clipShape(RoundedCorners(tl: 8, tr: 8, bl: 0, br: 0))
                    
                    HStack {
                        HStack(spacing: 0) {
                            ReportViewGroupButton(text: "Araç/Plaka", isSelected: indexSelectedGroup == 0 ? true : false) {
                                indexSelectedGroup = 0
                            }
                            
                            if returnChartType(reportType: selectedReport!) != .pieChart {
                                ReportViewGroupButton(text: "Depo", isSelected: indexSelectedGroup == 1 ? true : false) {
                                    indexSelectedGroup = 1
                                }
                            }
                            
                            
                        }.padding(.horizontal, 5)
                            .padding(.vertical, 5)
                            .frame(maxWidth: 150, maxHeight: 30)
                            .background(Color.NewColor.reportSubHeaderBg)
                            .overlay(
                                RoundedRectangle(cornerRadius: 3)
                                    .stroke(.gray, lineWidth: 1))
                            .padding(.vertical, 5)
                            .opacity(0.0)
                        Spacer()
                        ReportSelectPlateAndStoreButton(text: selectedStore.count == 0 ? "Depo Seç" : selectedStore.count == 1 ? "\(selectedStore[0])" : "Çoklu Seçim", count: selectedStore.count) {
                            showPlateMenu = false
                            showStoreMenu.toggle()
                        }.opacity(0.0)
                        
                        ReportSelectPlateAndStoreButton(text: selectedPlate.count == 0 ? "Kullanıcı Seç" : selectedPlate.count == 1 ? "\(selectedPlate[0])" : "Çoklu Seçim", count: selectedPlate.count) {
                            showStoreMenu = false
                            showPlateMenu.toggle()
                        }.opacity(0.0)
                    }.padding(.horizontal, 10)
                        .background(Color.NewColor.reportSubHeaderBg)
                    
                    
                    
                    VStack {
                        if selectedReport != nil {
                            switch returnChartType(reportType: selectedReport!) {
                            case .barChart:
                                BarChartsView(isReportOneDay: isReportOneDay, data: filterReportData(selectedStore: selectedStore, selectedPlate: selectedPlate), reportType: selectedReport!, groupType: indexSelectedGroup!, data5: getChartDetails(isReportOneDay: isReportOneDay, groupType: indexSelectedGroup!, reportType: selectedReport!, report: filterReportData(selectedStore: selectedStore, selectedPlate: selectedPlate))).environmentObject(homePageVM)
                            case .pieChart:
                                PieChartsView(data: filterReportData(selectedStore: selectedStore, selectedPlate: selectedPlate), reportType: selectedReport!, groupType: indexSelectedGroup!, data5: getChartDetails(isReportOneDay: isReportOneDay, groupType: indexSelectedGroup!, reportType: selectedReport!, report: filterReportData(selectedStore: selectedStore, selectedPlate: selectedPlate)))
                            case .lineChart:
                                LineChartsView(isReportOneDay: isReportOneDay, data: filterReportData(selectedStore: selectedStore, selectedPlate: selectedPlate), reportType: selectedReport!, groupType: indexSelectedGroup!, data5: getChartDetails(isReportOneDay: isReportOneDay, groupType: indexSelectedGroup!, reportType: selectedReport!, report: filterReportData(selectedStore: selectedStore, selectedPlate: selectedPlate)))
                            }
                        }
                    }
                    
                }.background(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.gray.opacity(0.5), lineWidth: 1))
                    .cornerRadius(5)
                    .padding(.horizontal, 5)
                    
            }
            
            
            /*
            if showPlateMenu {
                DropDownPlateMenu(reportType: selectedReport!, showPlateMenu: $showPlateMenu, plates: $plates, selectedPlate: $selectedPlate)
            }
            
            if showStoreMenu {
                DropDownStoreMenu(reportType: selectedReport!, showStoreMenu: $showStoreMenu, stores: $stores, selectedStore: $selectedStore)
            }
            */
            
        }//.frame(maxHeight: screenHeight * 0.4)
            .onAppear {
                raporDescriptions = reportTypes.map { $0.descriptionPickerText }
                raporDescriptionsLoad = true
                indexSelectedReport = ReportIndex().reverseIndexSelectedReport(report: selectedReport!)
            }
        
    }
    
    func filterReportData(selectedStore: [Int] = [], selectedPlate: [String] = []) -> [ReportModel] {
        var returnReportData: [ReportModel] = data
        if selectedStore != [] {
            returnReportData = returnReportData.filter { selectedStore.contains(Int($0.depo) ?? 0) }
            //returnReportData = returnReportData.filter { selectedStore.contains(Int($0.CompanyId) ?? 0) }
        }
        
        if selectedPlate != [] {
            returnReportData = returnReportData.filter { selectedPlate.contains($0.aracPlaka) }
        }
        
        if indexSelectedGroup == 1 {
            var newData: [ReportModel] = []
            for d in returnReportData {
                if !newData.contains(where: { $0.depo == d.depo }) {
                    newData.append(d)
                } else {
                    if let index = newData.firstIndex(where: { $0.depo == d.depo }) {
                        
                        newData[index].olumluAdet += d.olumluAdet
                        newData[index].kismiOlumluAdet += d.kismiOlumluAdet
                        newData[index].olumsuzAdet += d.olumsuzAdet
                        newData[index].ugranMamisAdet += d.ugranMamisAdet
                        newData[index].devamEdenAdet += d.devamEdenAdet
                    }
                }
            }
            //returnReportData = newData
        } else {
            var newData: [ReportModel] = []
            for d in returnReportData {
                if !newData.contains(where: { $0.aracPlaka == d.aracPlaka }) {
                    newData.append(d)
                } else {
                    if let index = newData.firstIndex(where: { $0.aracPlaka == d.aracPlaka }) {
                        
                        newData[index].olumluAdet += d.olumluAdet
                        newData[index].kismiOlumluAdet += d.kismiOlumluAdet
                        newData[index].olumsuzAdet += d.olumsuzAdet
                        newData[index].ugranMamisAdet += d.ugranMamisAdet
                        newData[index].devamEdenAdet += d.devamEdenAdet
                    }
                }
            }
            //returnReportData = newData
        }
        
        return returnReportData
    }
}

/*struct ReportViewCompare: View {
    @EnvironmentObject var homePageVM: MainPageViewModel
    
    @State var indexSelectedReport: Int?
    @Binding var indexSelectedGroup: Int
    
    var data: [ReportModel] //= localReportModel
    
    let reportTypes: [ReportType] = [.barTeslimat, .pieTeslimat, .lineHesaplananToplananKm, .barHesaplananToplananSaat, .barAdresSkor, .barOrtalamaGeofence, .barAracVerimlilik, .barSeferBBB, .barDuraklama, .barKumeleme, .barOrtalamaTeslimat]
    
    @State var raporDescriptions: [String] = []
    @Binding var selectedReport: ReportType
    var reportIndex: Int
    
    var groupPickerData: [String] = ["Araç Plaka", "Depo"]
    
    //@State var plates: [Plates]
    @State var stores: [MasterCompanyModel]
    
    @State var plates: [PlateUserModel]
    
    @Binding var selectedPlate: [String]
    @State var showPlateMenu = false
    
    @Binding var selectedStore: [Int]
    @State var showStoreMenu = false
    
    @State private var raporDescriptionsLoad: Bool = false
    
    var isCompareReport: Bool = false
    
    var body: some View {
        //30+35+35
        ZStack {
            
            if raporDescriptionsLoad {
                VStack(spacing: 0) {
                    
                    HStack {
                        /*Text("RAPOR \(reportIndex + 1)")
                            .font(.custom(fontsMedium, size: 15)) */
                        
                        Text(selectedReport == nil ? "" : "\(selectedReport.description ?? "")")
                            .font(.custom(fontsRegular, size: 14))
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .trailing) {
                            PickerTextField(data: raporDescriptions, placeholder: "Rapor Tipi", type: 3, lastSelectedIndex: $indexSelectedReport) {
                                selectedReport = ReportIndex().indexSelectedReport(index: indexSelectedReport!)
                                indexSelectedReport = nil
                            }.frame(maxWidth: 50)
                            Image(systemName: "arrowtriangle.down.fill")
                                .resizable()
                                .frame(width: 7, height: 7)
                                .foregroundColor(.black)
                                .padding(.leading, 6)
                        }.padding(.vertical, 5)
                            .padding(.horizontal, 10)
                            .background(.white)
                            .cornerRadius(5.0)
                            .frame(height: 20)
                            .padding(.horizontal, 10)
                        
                        /*if !isCompareReport {
                            
                            ReportViewHeaderSmallButton(icon: ImageConstants.raporKarsilastirma.rawValue) {
                                homePageVM.compareReportArray.append(selectedReport)
                                homePageVM.compareReportGroups.append(indexSelectedGroup)
                                homePageVM.compareReportSelectedPlates.append(selectedPlate)
                                homePageVM.compareReportSelectedStores.append(selectedStore)
                                homePageVM.compareReportGroups.append(indexSelectedGroup)
                                homePageVM.compareReportSelectedPlates.append(selectedPlate)
                                homePageVM.compareReportSelectedStores.append(selectedStore)
                                homePageVM.isCompareReportView = true
                            }
                            
                            ReportViewHeaderSmallButton(icon: homePageVM.localReport.contains(selectedReport) ? ImageConstants.raporUnfavIcon.rawValue : ImageConstants.raporFavIcon.rawValue) {
                                saveReportPreferences(selectedReport)
                                if homePageVM.localReport.contains(selectedReport) {
                                    homePageVM.localReport.removeAll { $0 == selectedReport }
                                } else {
                                    homePageVM.localReport.append(selectedReport)
                                }
                            }
                            
                            ReportViewHeaderSmallButton(icon: ImageConstants.raporBuyutIcon.rawValue) {
                                homePageVM.fullScreenChartReportType = selectedReport
                                homePageVM.fullScreenChartDetail = getChartDetails(groupType: indexSelectedGroup, reportType: selectedReport, report: filterReportData(selectedStore: selectedStore, selectedPlate: selectedPlate))
                                withAnimation {
                                    homePageVM.isFullScreenChart = true
                                }
                            }
                        } */
                        
                    }.frame(height: 35)
                        .padding(.horizontal, 10)
                        .background(Color.NewColor.reportHeaderBg)
                        .clipShape(RoundedCorners(tl: 8, tr: 8, bl: 0, br: 0))
                    
                    HStack {
                        HStack(spacing: 0) {
                            ReportViewGroupButton(text: "Araç/Plaka", isSelected: indexSelectedGroup == 0 ? true : false) {
                                indexSelectedGroup = 0
                            }
                            
                            if returnChartType(reportType: selectedReport) != .pieChart {
                                ReportViewGroupButton(text: "Depo", isSelected: indexSelectedGroup == 1 ? true : false) {
                                    indexSelectedGroup = 1
                                }
                            }
                            
                            
                        }.padding(.horizontal, 5)
                            .padding(.vertical, 5)
                            .frame(maxWidth: 150, maxHeight: 30)
                            .background(Color.NewColor.reportSubHeaderBg)
                            .overlay(
                                RoundedRectangle(cornerRadius: 3)
                                    .stroke(.gray, lineWidth: 1))
                            .padding(.vertical, 5)
                        Spacer()
                        ReportSelectPlateAndStoreButton(text: selectedStore.count == 0 ? "Depo Seç" : selectedStore.count == 1 ? "\(selectedStore[0])" : "Çoklu Seçim", count: selectedStore.count) {
                            showPlateMenu = false
                            showStoreMenu.toggle()
                        }
                        
                        ReportSelectPlateAndStoreButton(text: selectedPlate.count == 0 ? "Kullanıcı Seç" : selectedPlate.count == 1 ? "\(selectedPlate[0])" : "Çoklu Seçim", count: selectedPlate.count) {
                            showStoreMenu = false
                            showPlateMenu.toggle()
                        }
                    }.padding(.horizontal, 10)
                        .background(Color.NewColor.reportSubHeaderBg)
                    
                    
                    
                    VStack {
                        if selectedReport != nil {
                            switch returnChartType(reportType: selectedReport) {
                            case .barChart:
                                BarChartsView(data: filterReportData(selectedStore: selectedStore, selectedPlate: selectedPlate), reportType: selectedReport, groupType: indexSelectedGroup, data5: getChartDetails(isReportOneDay: isReportOneDay, groupType: indexSelectedGroup, reportType: selectedReport, report: filterReportData(selectedStore: selectedStore, selectedPlate: selectedPlate))).environmentObject(homePageVM)
                            case .pieChart:
                                PieChartsView(data: filterReportData(selectedStore: selectedStore, selectedPlate: selectedPlate), reportType: selectedReport, groupType: indexSelectedGroup, data5: getChartDetails(isReportOneDay: isReportOneDay, groupType: indexSelectedGroup, reportType: selectedReport, report: filterReportData(selectedStore: selectedStore, selectedPlate: selectedPlate)))
                            case .lineChart:
                                LineChartsView(data: filterReportData(selectedStore: selectedStore, selectedPlate: selectedPlate), reportType: selectedReport, groupType: indexSelectedGroup, data5: getChartDetails(isReportOneDay: isReportOneDay, groupType: indexSelectedGroup, reportType: selectedReport, report: filterReportData(selectedStore: selectedStore, selectedPlate: selectedPlate)))
                            }
                        }
                    }
                    
                }.padding(.horizontal, 3)
            }
            
            
            /*
            if showPlateMenu {
                DropDownPlateMenu(reportType: selectedReport, showPlateMenu: $showPlateMenu, plates: $plates, selectedPlate: $selectedPlate)
            }
            
            if showStoreMenu {
                DropDownStoreMenu(reportType: selectedReport, showStoreMenu: $showStoreMenu, stores: $stores, selectedStore: $selectedStore)
            }
            */
        }//.frame(maxHeight: screenHeight * 0.4)
            .onAppear {
                raporDescriptions = reportTypes.map { $0.descriptionPickerText }
                raporDescriptionsLoad = true
                indexSelectedReport = ReportIndex().reverseIndexSelectedReport(report: selectedReport)
            }
        
    }
    
    func filterReportData(selectedStore: [Int] = [], selectedPlate: [String] = []) -> [ReportModel] {
        var returnReportData: [ReportModel] = data
        
        if selectedStore != [] {
            returnReportData = returnReportData.filter { selectedStore.contains(Int($0.depo) ?? 0) }
            //returnReportData = returnReportData.filter { selectedStore.contains(Int($0.CompanyId) ?? 0) }
        }
        
        if selectedPlate != [] {
            returnReportData = returnReportData.filter { selectedPlate.contains($0.aracPlaka) }
        }
        
        if indexSelectedGroup == 1 {
            var newData: [ReportModel] = []
            for d in returnReportData {
                if !newData.contains(where: { $0.depo == d.depo }) {
                    newData.append(d)
                } else {
                    if let index = newData.firstIndex(where: { $0.depo == d.depo }) {
                        
                        newData[index].olumluAdet += d.olumluAdet
                        newData[index].kismiOlumluAdet += d.kismiOlumluAdet
                        newData[index].olumsuzAdet += d.olumsuzAdet
                        newData[index].ugranMamisAdet += d.ugranMamisAdet
                        newData[index].devamEdenAdet += d.devamEdenAdet
                    }
                }
            }
            returnReportData = newData
        } else {
            var newData: [ReportModel] = []
            for d in returnReportData {
                if !newData.contains(where: { $0.aracPlaka == d.aracPlaka }) {
                    newData.append(d)
                } else {
                    if let index = newData.firstIndex(where: { $0.aracPlaka == d.aracPlaka }) {
                        
                        newData[index].olumluAdet += d.olumluAdet
                        newData[index].kismiOlumluAdet += d.kismiOlumluAdet
                        newData[index].olumsuzAdet += d.olumsuzAdet
                        newData[index].ugranMamisAdet += d.ugranMamisAdet
                        newData[index].devamEdenAdet += d.devamEdenAdet
                    }
                }
            }
            returnReportData = newData
        }
        
        return returnReportData
    }
} */

struct Plates: Identifiable {
    var id: String
    var isSelected: Bool = false
}

struct Stores: Identifiable {
    var id: String
    var isSelected: Bool = false
}

struct DropDownMenuCell: View {
    var text: String
    var isSelected: Bool
    var onTap: () -> Void
    var body: some View {
        Button(action: {
            onTap()
        }, label: {
            HStack {
                Image(systemName: isSelected ? "checkmark.square" : "square")
                
                Text(text)
                    .font(.custom(fontsRegular, size: 8))
                    .foregroundStyle(.black)
            }.foregroundStyle(.black)
                .frame(maxWidth: screenWidth * 0.25, alignment: .leading)
        })
    }
}

struct ReportSelectPlateAndStoreButton: View {
    var text: String
    var count: Int = 0
    var onTap: () -> Void
    var body: some View {
        Button {
            onTap()
        } label: {
            HStack {
                Text(text)
                    .font(.custom(fontsRegular, size: 8))
                    .foregroundStyle(.black)
                
                Image(systemName: "chevron.down")
                    .resizable()
                    .frame(width: 10, height: 5)
                    .foregroundStyle(.black)
                
                /*if count > 0 {
                    ZStack {
                        Circle()
                            .frame(width: 16, height: 16)
                            .foregroundColor(.blue)
                        
                        Text("\(count)")
                            .font(.custom(fontsRegular, size: 10))
                            .foregroundStyle(.white)
                    }
                } */
            }.padding(.vertical, 5)
                .frame(maxWidth: 75)
                .background(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 3)
                        .stroke(.gray, lineWidth: 1))
                .cornerRadius(3)
        }
    }
}

/*
struct DropDownPlateMenu: View {
    
    var reportType: ReportType = .barTeslimat
    @Binding var showPlateMenu: Bool
    @Binding var plates: [PlateUserModel]
    @Binding var selectedPlate: [String]
    
    @State private var searchPlate: String = ""
    
    var filteredPlate: [PlateUserModel] {
        if searchPlate.isEmpty {
            return plates
        } else {
            return plates.filter { $0.DriverName.lowercased().contains(searchPlate.lowercased()) || $0.Plate.lowercased().contains(searchPlate.lowercased()) }
        }
    }
    
    var body: some View {
        ZStack {
            VStack {
                VStack(spacing: 0)  {
                    OpenSelectedMenuSearchBarView(text: "Plaka", searchText: $searchPlate)
                    ScrollView {
                        DropDownMenuCell1(text: "Hepsi", isSelected: plates.count == selectedPlate.count ? true : false) {
                            if plates.count != selectedPlate.count {
                                for i in 0..<plates.count {
                                    //stores[i].isSelected = true
                                    if !selectedPlate.contains(plates[i].StaffId) {
                                        selectedPlate.append(plates[i].StaffId)
                                    }
                                }
                            } else {
                                selectedPlate.removeAll()
                            }
                        }
                        ForEach(filteredPlate.indices, id:\.self) { i in
                            DropDownMenuCell1(text: "\(filteredPlate[i].DriverName) \(filteredPlate[i].DriverId) (\(filteredPlate[i].Plate))", isSelected: selectedPlate.contains(filteredPlate[i].StaffId) ? true : false) {
                                if let originalIndex = plates.firstIndex(where: { $0.MxRoutePointBookMasterId == filteredPlate[i].MxRoutePointBookMasterId }) {
                                    appendSelectedVehicle(plate: plates[originalIndex].StaffId)
                                }
                            }
                        }
                    }
                    
                    HStack {
                        OpenSelectedMenuButtonView(type: 1) {
                            selectedPlate.removeAll()
                        }
                        
                        OpenSelectedMenuButtonView(type: 2) {
                            showPlateMenu = false
                        }
                    }.padding(.horizontal, 10)
                        .padding(.bottom, 5)
                }.frame(maxWidth: .infinity, maxHeight: screenHeight * 0.2)
                    .background(.white)
                    .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1))
                        .padding(.horizontal, 10)
            }.padding(.top, reportType == .pieTeslimat ? 70 : 40)
        }.onAppear {
            /*if selectedPlate != [] {
                for plate in selectedPlate {
                    if let index = plates.firstIndex(where: { $0.StaffId == plate }) {
                        plates[index].isSelected = true
                    }
                }
            }*/
        }
    }
    
    func appendSelectedVehicle(plate: String) {
        if !selectedPlate.contains(plate) {
            selectedPlate.append(plate)
        } else {
            selectedPlate.removeAll { $0 == plate }
        }
    }
}

struct DropDownStoreMenu: View {
    
    var reportType: ReportType = .barTeslimat
    @Binding var showStoreMenu: Bool
    @Binding var stores: [MasterCompanyModel]
    @Binding var selectedStore: [Int]
    
    @State private var searchStore: String = ""
    
    var filteredStore: [MasterCompanyModel] {
        if searchStore.isEmpty {
            return stores
        } else {
            return stores.filter { $0.SubCompanyName.contains(searchStore) }
        }
    }
    
    var body: some View {
        ZStack {
            VStack {
                VStack(spacing: 0) {
                    OpenSelectedMenuSearchBarView(text: "Depo", searchText: $searchStore)
                    
                    ScrollView {
                        DropDownMenuCell1(text: "Hepsi", isSelected: stores.count == selectedStore.count ? true : false) {
                            if stores.count != selectedStore.count {
                                for i in 0..<stores.count {
                                    //stores[i].isSelected = true
                                    if !selectedStore.contains(stores[i].CompanyId) {
                                        selectedStore.append(stores[i].CompanyId)
                                    }
                                }
                            } else {
                                selectedStore.removeAll()
                            }
                        }
                        
                        ForEach(filteredStore.indices, id:\.self) { i in
                            DropDownMenuCell1(text: filteredStore[i].SubCompanyName, isSelected: selectedStore.contains(filteredStore[i].CompanyId) ? true : false) {
                                if let originalIndex = stores.firstIndex(where: { $0.CompanyId == filteredStore[i].CompanyId }) {
                                    //stores[originalIndex].isSelected.toggle()
                                    appendSelectedStore(store: stores[originalIndex].CompanyId)
                                }
                            }
                        }
                    }
                    
                    HStack {
                        OpenSelectedMenuButtonView(type: 1) {
                            selectedStore.removeAll()
                        }
                        
                        OpenSelectedMenuButtonView(type: 2) {
                            showStoreMenu = false
                        }
                    }.padding(.horizontal, 10)
                        .padding(.bottom, 5)
                }.frame(maxWidth: .infinity, maxHeight: screenHeight * 0.2)
                    .background(.white)
                    .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1))
                        .padding(.horizontal, 10)

            }.padding(.top, reportType == .pieTeslimat ? 70 : 40)
        }.onAppear {
            /*if selectedStore != [] {
                for plate in selectedStore {
                    if let index = stores.firstIndex(where: { $0.id == plate }) {
                        stores[index].isSelected = true
                    }
                }
            }*/
        }
    }
    
    func appendSelectedStore(store: Int) {
        if let index = selectedStore.firstIndex(of: store) {
            selectedStore.remove(at: index)
        } else {
            selectedStore.append(store)
        }
    }
}
*/

/*
#Preview {
    ReportView(indexSelectedReport: 1, reportIndex: 0, plates: [Plates(id: "1111"), Plates(id: "22222"), Plates(id: "3333")], stores: [Stores(id: "aaaaa"), Stores(id: "bbbbbb"), Stores(id: "cccccc")])
}
*/

func saveReportPreferences(_ first: ReportType) {
    let localReport = preferences.string(forKey: "reportPreferences") ?? ""
    print("localReport - \(localReport)")
    var preferencesArray = localReport.split(separator: ",").map { String($0) }
    
    if localReport.contains(first.rawValue) {
        print("first.rawValue - \(first.rawValue)")
        for i in 0..<preferencesArray.count {
            if first.rawValue == preferencesArray[i] {
                print("AAAAAAAAA")
                preferencesArray.remove(at: i)
            }
        }
    } else {
        print("ZZZZZZZZZ")
        preferencesArray.append(first.rawValue)
    }
    let joinedString = preferencesArray.joined(separator: ",")
    print("joinedString - \(joinedString)")
    preferences.set(joinedString, forKey: "reportPreferences")
}


struct ReportViewHeaderSmallButton: View {
    
    var icon: String
    var onTap: () -> Void
    
    var body: some View {
        Button {
            onTap()
        } label: {
            ZStack {
                /*Rectangle()
                    .frame(width: 25, height: 25)
                    .foregroundStyle(Color.NewColor.reportHeaderIconBg)
                    .cornerRadius(8) */
                
                Image(icon)
                    .resizable()
                    .frame(width: 25, height: 25)
                    .background(.white)
                    .cornerRadius(8)
            }
        }
    }
}

struct ReportViewGroupButton: View {
    var text: String
    var isSelected: Bool
    var onTap: () -> Void

    var body: some View {
        
        Button(action: {
            withAnimation {
                onTap()
            }
        }, label: {
            Text(text)
                .lineLimit(2)
                .font(.custom(fontsRegular, size: 10))
                .foregroundStyle(isSelected ? Color.NewColor.dateFilterSelectedDate : .black)
                .frame(maxWidth: .infinity, maxHeight: 35)
                .background(isSelected ? .white : .clear)
                .cornerRadius(3)
                .overlay(
                    RoundedRectangle(cornerRadius: 3)
                        .stroke(isSelected ? Color.NewColor.dateFilterSelectedDate : .clear, lineWidth: 1))
        }).frame(maxWidth: .infinity)
            .disabled(isSelected)
    }
}
