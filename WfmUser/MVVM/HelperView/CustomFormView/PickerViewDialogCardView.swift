//
//  PickerViewDialogCardView.swift
//  WfmUser
//
//  Created by Mustafa Alper Aydin on 21.03.2025.
//

import SwiftUI

struct PickerViewDialogCardView: View {
    @EnvironmentObject var homePageVM: HomePageViewModel
    var type: Int = 1
    var filterType: Int = 0
    var title: String
    @Binding var isPickerViewOpen: Bool
    @State var itemsDialog: [String]
    @Binding var isPickerViewSelectedItems: Set<String>
    
    @State private var searchText: String = ""
    
    var filteredPlate: [String] {
        if searchText.isEmpty {
            return itemsDialog
        } else {
            return itemsDialog.filter { $0.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        
        ZStack {
            Color.gray.opacity(0.1)
                .ignoresSafeArea()
                .onTapGesture {
                    isPickerViewOpen = false
                }
            
            VStack {
                Spacer()
                VStack {
                    Text(title)
                        .font(.custom(fontsBold, size: 12))
                        .foregroundStyle(.black)
                    OpenSelectedMenuSearchBarView(text: String(localized: "ABFLAra"), searchText: $searchText)
                    ScrollView {
                        ForEach(filteredPlate.indices, id: \.self) { index in
                            //if index != 0 { // 0. indeksi atlıyoruz
                                Button(action: {
                                    selectItem(filteredPlate[index], selectionMode: type == 1 ? .multiple : .single)
                                }) {
                                    HStack {
                                        if isPickerViewSelectedItems.contains(filteredPlate[index]) {
                                            Image(systemName: "checkmark.circle")
                                        } else {
                                            Image(systemName: "circle")
                                        }
                                        Text(filteredPlate[index].description)
                                        Spacer()
                                        
                                    }.font(.custom(fontsRegular, size: 16))
                                        .foregroundStyle(.black)
                                }
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                            //}
                        }
                    }.frame(maxHeight: 100)
                }.background(.white)
                    .customOverlayStyle(cornerRadius: 20, lineColor: .white)
            }
            
        }
        
    }
    private func selectItem(_ item: String, selectionMode: SelectionMode) {
        switch selectionMode {
        case .single:
            isPickerViewSelectedItems = [item]
            /*if type == 2 {
                if let index = homePageVM.planPageRoutePlanPlateModel.firstIndex(where: { $0.Plate == item }) {
                    var cell = homePageVM.planPageRoutePlanPlateModel[index]
                    homePageVM.planPageSelectedVehicle = cell
                    homePageVM.routePlanSelectedVehicle(StaffId: "\(cell.StaffId)", MxRouteId: "\(cell.MxRouteId)", BlockId: "\(cell.BlockId)")
                    //homePageVM.isSelectedRoute = true
                    homePageVM.showSelectRouteDialog = false
                }
            } else if type == 3 {
                if filterType == 1 {
                    homePageVM.filterPageRowsNokta = isPickerViewSelectedItems
                    homePageVM.getNokta(type: 1, rows: item) { r in
                        //
                        homePageVM.filterCurrentPageNokta = 1
                        homePageVM.getAllMarker()
                        homePageVM.isShowFilterPageRows = false
                    }
                } else if filterType == 2 {
                    homePageVM.filterPageRowsTemsilci = isPickerViewSelectedItems
                    homePageVM.getTemsilci(type: 1, rows: item) { r in
                        //
                        homePageVM.filterCurrentPageTemsilci = 1
                        homePageVM.getAllMarker()
                        homePageVM.isShowFilterPageRows = false
                    }
                } else if filterType == 3 {
                    homePageVM.filterPageRowsDepo = isPickerViewSelectedItems
                    homePageVM.getDepo(type: 1, rows: item) { r in
                        //
                        homePageVM.filterCurrentPageDepo = 1
                        homePageVM.getAllMarker()
                        homePageVM.isShowFilterPageRows = false
                    }
                }
            } */
        case .multiple:
            if isPickerViewSelectedItems.contains(item) {
                isPickerViewSelectedItems.remove(item)
            } else {
                isPickerViewSelectedItems.insert(item)
            }
        }
    }
}

/*
#Preview {
    PickerViewDialogCardView()
} */

struct OpenSelectedMenuSearchBarView: View {
    var text: String
    @Binding var searchText: String
    var body: some View {
        HStack(spacing: 0) {
            Image(systemName: "magnifyingglass.circle")
                .resizable()
                .frame(width: 15, height: 15)
                .foregroundStyle(.gray)
                .padding(.leading, 5)
            
            TextField(text, text: $searchText)
                .padding(.all, 2)
                .cornerRadius(5)
                .padding(.horizontal)
            
            if searchText != "" {
                Button(action: {
                    searchText = ""
                }, label: {
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundStyle(.gray)
                }).padding(.trailing, 5)
            }
            
        }.background(Color.white)
            .cornerRadius(5)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1) // Çerçeve rengi ve genişliği
            )
            .padding(.vertical, 5)
            .padding(.horizontal, 10)
    }
}
