//
//  CompareReportDialogView.swift
//  RxAdmin
//
//  Created by Banu Ortac on 13.06.2024.
//

import SwiftUI

/*
struct CompareReportDialogView: View {
    
    @EnvironmentObject var homePageVM: HomePageViewModel
    
    @State private var showPlateMenu = false
    @State private var showStoreMenu = false
    
    //@State var plates: [Plates]
    @State var plates: [PlateUserModel]
    @State var stores: [MasterCompanyModel]
    
    @State private var isCompareReady: Bool = false
    
    //1. rapor için
    @State private var indexSelectedReport: Int?
    @State private var selectedReport: ReportType?
    @State private var raporDescriptions: [String] = []
    
    @State private var firstOrSecondReport: Int = 0
    
    @State private var raporDescriptionsLoad: Bool = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                /*HStack {
                    
                    Image(ImageConstants.raporKarsilastirma.rawValue)
                        .resizable()
                        .frame(width: 42, height: 42)
                    
                    VStack {
                        Text("CRDRaporKarsilastir")
                            .font(.custom(fontsSemiBold, size: 12))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("\(homePageVM.compareReportArray[0].description) \(String(localized: "CRDile"))")
                            .font(.custom(fontsRegular, size: 12))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }.foregroundStyle(.white)
                    
                    
                    
                    
                    Button(action: {
                        homePageVM.isCompareReportView = false
                    }, label: {
                        Image(ImageConstants.xSquare.rawValue)
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundStyle(.white)
                    })
                }.padding(.all, 5)
                    .background(Color.NewColor.primary1) */
                    
                    DialogHeaderCard(text: "CRDRaporKarsilastir", background: Color.NewColor.primary1) {
                        homePageVM.isCompareReportView = false
                    }
                    
                if isCompareReady {
                    ReportView(indexSelectedGroup: homePageVM.compareReportGroups[0], data: homePageVM.reportDetailArray, selectedReport: homePageVM.compareReportArray[0], reportIndex: 0, stores: homePageVM.globalStoreArray, plates: homePageVM.globalUserPlateArray, selectedPlate: homePageVM.compareReportSelectedPlates[0], selectedStore: homePageVM.compareReportSelectedStores[0], isCompareReport: true)
                        .padding(.top, 10)
                    if homePageVM.compareReportArray.count > 1 {
                        ReportView(indexSelectedGroup: homePageVM.compareReportGroups[1], data: homePageVM.reportDetailArray, selectedReport: homePageVM.compareReportArray[1], reportIndex: 1, stores: homePageVM.globalStoreArray, plates: homePageVM.globalUserPlateArray, selectedPlate: homePageVM.compareReportSelectedPlates[1], selectedStore: homePageVM.compareReportSelectedStores[1], isCompareReport: true)
                    }
                } else {
                    if raporDescriptionsLoad {
                        //if homePageVM.compareReportArray.count == 1 {
                            
                            VStack {
                                HStack {
                                    
                                    Image(ImageConstants.info.rawValue)
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                    
                                    Text("CRDLuftenFiltre")
                                        .foregroundStyle(.black)
                                        .lineLimit(2)
                                        .font(.custom(fontsRegular, size: 13))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }.padding(.top, 10)
                                
                                ReportViewCompare(indexSelectedGroup: $homePageVM.compareReportGroups[1], data: homePageVM.reportDetailArray, selectedReport: $homePageVM.compareReportArray[1], reportIndex: 1, stores: homePageVM.globalStoreArray, plates: homePageVM.globalUserPlateArray, selectedPlate: $homePageVM.compareReportSelectedPlates[1], selectedStore: $homePageVM.compareReportSelectedStores[1], isCompareReport: true)
                            }
                            
                            VStack {
                                //Text("2. Grafik Filtreleri")
                                /*ZStack(alignment: .trailing) {
                                    PickerTextField(data: raporDescriptions, placeholder: "", type: 1, lastSelectedIndex: $indexSelectedReport) {
                                        selectedReport = ReportIndex().indexSelectedReport(index: indexSelectedReport!)
                                    }.frame(maxWidth: .infinity)
                                    Image(systemName: "arrowtriangle.down.fill")
                                        .resizable()
                                        .frame(width: 7, height: 7)
                                        .foregroundColor(.white)
                                        .padding(.leading, 6)
                                }.padding(.vertical, 5)
                                    .padding(.horizontal, 10)
                                    .background(.gray.opacity(0.5))
                                    .cornerRadius(5.0)
                                    .frame(height: 20)
                                    .padding(.horizontal, 10) */
                                
                                /*HStack {
                                    Button {
                                        homePageVM.compareReportGroups[1] = 0
                                    } label: {
                                        
                                        Image(systemName: homePageVM.compareReportGroups[1] == 0 ? "checkmark.square" : "square")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                        Text("Araca Göre")
                                    }.foregroundStyle(.black)
                                    
                                    Button {
                                        homePageVM.compareReportGroups[1] = 1
                                    } label: {
                                        
                                        Image(systemName: homePageVM.compareReportGroups[1] == 1 ? "checkmark.square" : "square")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                        
                                        Text("Depoya Göre")
                                            
                                    }.foregroundStyle(.black)
                                } */
                                
                                /*HStack {
                                    ReportSelectPlateAndStoreButton(text: "Depo", count: homePageVM.compareReportSelectedStores[1].count) {
                                        firstOrSecondReport = 1
                                        showPlateMenu = false
                                        showStoreMenu.toggle()
                                    }
                                    
                                    ReportSelectPlateAndStoreButton(text: "Plaka", count: homePageVM.compareReportSelectedPlates[1].count) {
                                        firstOrSecondReport = 1
                                        showStoreMenu = false
                                        showPlateMenu.toggle()
                                    }
                                } */
                                
                                HStack {
                                    Spacer()
                                    
                                    Button {
                                        /*if selectedReport == nil {
                                            selectedReport = homePageVM.compareReportArray[0]
                                        }
                                        homePageVM.compareReportArray.append(selectedReport!)
                                        withAnimation {
                                            isCompareReady = true
                                        } */
                                        
                                        selectedReport = ReportIndex().indexSelectedReport(index: indexSelectedReport!)
                                        /*homePageVM.compareReportArray[1] = selectedReport!
                                        homePageVM.compareReportGroups[1] = homePageVM.compareReportGroups[1]
                                        homePageVM.compareReportSelectedPlates[1] = homePageVM.compareReportSelectedPlates[1]
                                        homePageVM.compareReportSelectedStores[1] = homePageVM.compareReportSelectedStores[1] */
                                        print("AHAHAHAHAHA - \(homePageVM.compareReportArray[1]) -- \(homePageVM.compareReportGroups[1])")
                                        isCompareReady = true
                                        
                                    } label: {
                                        HStack {
                                            Image(ImageConstants.simplification.rawValue)
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                            
                                            Text("KARŞILAŞTIR")
                                                .foregroundStyle(.white)
                                                .font(.custom(fontsRegular, size: 14))
                                        }.padding(.vertical, 5)
                                            .frame(width: 200)
                                            .background(Color.NewColor.primary1)
                                            .cornerRadius(5.0)
                                            .padding(.trailing, 5)
                                    }
                                }
                                

                            }/*.background(.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.blue, lineWidth: 1) // Çerçeve rengi ve genişliği
                                )
                                .padding(.horizontal, 10) */
                        //}
                    }
                }
                
        
                Spacer()
                
            }.frame(width: screenWidth - 20, height: isCompareReady ? screenHeight - 100 : screenHeight * 0.7)
                .background(.white)
                .cornerRadius(10)
            
            VStack {
                ZStack {
                    if showPlateMenu {
                        DropDownPlateMenu(showPlateMenu: $showPlateMenu, plates: $plates, selectedPlate: $homePageVM.compareReportSelectedPlates[firstOrSecondReport])
                            .padding(.top, 55)
                            .padding(.horizontal, 10)
                            
                    }
                    
                    if showStoreMenu {
                        DropDownStoreMenu(showStoreMenu: $showStoreMenu, stores: $stores, selectedStore: $homePageVM.compareReportSelectedStores[firstOrSecondReport])
                            .padding(.top, 55)
                            .padding(.horizontal, 10)
                    }
                }
                
            }
             
        }.onAppear(perform: {
            raporDescriptions = homePageVM.reportTypes.map { $0.description }
            print("raporDescriptions - \(raporDescriptions)")
            
            indexSelectedReport = ReportIndex().reverseIndexSelectedReport(report: homePageVM.compareReportArray[0])
            homePageVM.compareReportSelectedStores.append([])
            homePageVM.compareReportSelectedPlates.append([])
            homePageVM.compareReportGroups.append(0)
            homePageVM.compareReportArray.append(homePageVM.compareReportArray[0])
            homePageVM.compareReportGroups[1] = homePageVM.compareReportGroups[0]
            homePageVM.compareReportSelectedPlates[1] = homePageVM.compareReportSelectedPlates[0]
            homePageVM.compareReportSelectedStores[1] = homePageVM.compareReportSelectedStores[0]
            
            raporDescriptionsLoad = true
        })
        .onDisappear(perform: {
            homePageVM.compareReportArray = []
            homePageVM.compareReportSelectedStores = []
            homePageVM.compareReportSelectedPlates = []
            homePageVM.compareReportGroups = []
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color.DialogColor.dialogBackgorundOpacityColor
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            //homePageVM.isFullScreenChart = false
                        }
                    }
            )
    }
}

#Preview {
    CompareReportDialogView(plates: [], stores: []).environmentObject(MainPageViewModel())
}
*/
