//
//  DropDownMenuItems.swift
//  WfmAdmin
//
//  Created by Mustafa Alper Aydin on 28.01.2025.
//

import Foundation
import SwiftUI

struct DropDownUserStoresMenu: View {
    
    @Binding var showUserStoresMenu: Bool
    @Binding var stores: [MasterCompanyModel]
    @Binding var selectedStores: [Int]
    var onTap: () -> Void
    
    @State private var searchStore: String = ""
    
    var filteredStores: [MasterCompanyModel] {
        if searchStore.isEmpty {
            return stores
        } else {
            return stores.filter { $0.SubCompanyName.lowercased().contains(searchStore.lowercased()) }
        }
    }
    
    var body: some View {
        ZStack {
            VStack {
                VStack(spacing: 0) {
                    OpenSelectedMenuSearchBarView(text: String(localized: "DPDepo"), searchText: $searchStore)
                    ScrollView {
                        
                        DropDownMenuCell1(text: String(localized: "DPHepsi"), isSelected: stores.count == selectedStores.count ? true : false) {
                            if stores.count != selectedStores.count {
                                for i in 0..<stores.count {
                                    //stores[i].isSelected = true
                                    if !selectedStores.contains(stores[i].CompanyId) {
                                        selectedStores.append(stores[i].CompanyId)
                                    }
                                }
                            } else {
                                selectedStores.removeAll()
                            }
                        }
                        ForEach(filteredStores.indices, id:\.self) { i in
                            DropDownMenuCell1(text: filteredStores[i].SubCompanyName, isSelected: selectedStores.contains(filteredStores[i].CompanyId) ? true : false) {
                                if let originalIndex = stores.firstIndex(where: { $0.CompanyId == filteredStores[i].CompanyId }) {
                                    //stores[originalIndex].isSelected.toggle()
                                    appendSelectedVehicle(id: stores[originalIndex].CompanyId)
                                }
                            }
                        }
                    }.frame(maxHeight: screenHeight * 0.2)
                    
                    HStack {
                        OpenSelectedMenuButtonView(type: 1) {
                            selectedStores.removeAll()
                        }
                        
                        OpenSelectedMenuButtonView(type: 2) {
                            showUserStoresMenu = false
                            onTap()
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
                        
                Spacer()
            }
        }
    }
    
    func appendSelectedVehicle(id: Int) {
        if let index = selectedStores.firstIndex(of: id) {
            selectedStores.remove(at: index)
        } else {
            selectedStores.append(id)
        }
    }
}

struct DropDownUserPlatesMenu: View {
    
    @Binding var showSelectUserPlateMenu: Bool
    @Binding var plates: [PlateUserModel]
    @Binding var selectedPlates: [String]
    var onTap: () -> Void
    
    @State private var searchStore: String = ""
    
    var filteredPlate: [PlateUserModel] {
        if searchStore.isEmpty {
            return plates
        } else {
            return plates.filter { $0.DriverName.lowercased().contains(searchStore.lowercased()) || $0.Plate.lowercased().contains(searchStore.lowercased()) }
        }
    }
    
    var body: some View {
        ZStack {
            VStack {
                VStack(spacing: 0) {
                    OpenSelectedMenuSearchBarView(text: String(localized: "DPPlaka"), searchText: $searchStore)
                    ScrollView {
                        
                        DropDownMenuCell1(text: String(localized: "DPHepsi"), isSelected: plates.count == selectedPlates.count ? true : false) {
                            if plates.count != selectedPlates.count {
                                for i in 0..<plates.count {
                                    //stores[i].isSelected = true
                                    if !selectedPlates.contains(plates[i].StaffId) {
                                        selectedPlates.append(plates[i].StaffId)
                                    }
                                }
                            } else {
                                selectedPlates.removeAll()
                            }
                        }
                        
                        ForEach(filteredPlate.indices, id:\.self) { i in
                            DropDownMenuCell1(text: "\(filteredPlate[i].DriverName) \(filteredPlate[i].DriverId) (\(filteredPlate[i].Plate))", isSelected: selectedPlates.contains(filteredPlate[i].StaffId) ? true : false) {
                                if let originalIndex = plates.firstIndex(where: { $0.MxRoutePointBookMasterId == filteredPlate[i].MxRoutePointBookMasterId }) {
                                    //stores[originalIndex].isSelected.toggle()
                                    appendSelectedVehicle(id: plates[originalIndex].StaffId)
                                }
                            }
                        }
                    }.frame(maxHeight: screenHeight * 0.2)
                    
                    HStack {
                        OpenSelectedMenuButtonView(type: 1) {
                            selectedPlates.removeAll()
                        }
                        
                        OpenSelectedMenuButtonView(type: 2) {
                            showSelectUserPlateMenu = false
                            onTap()
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
                Spacer()
            }//.padding(.top, 125)
        }
    }
    
    func appendSelectedVehicle(id: String) {
        if !selectedPlates.contains(id) {
            selectedPlates.append(id)
        } else {
            selectedPlates.removeAll { $0 == id }
        }
    }
}

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


struct DropDownMenuCell1: View {
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
                    .font(.custom(fontsRegular, size: 12))
                    .foregroundStyle(.black)
            }.foregroundStyle(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
        }).padding(.vertical, 2)
            .padding(.horizontal, 2)
    }
}

struct OpenSelectedMenuButtonView: View {
    var type: Int //1 temizle //2 onayla
    var onTap: () -> Void

    var body: some View {
        Button {
            onTap()
        } label: {
            Text(type == 1 ? String(localized: "DPTemizle") : String(localized: "DPOnayla"))
                .font(.custom(fontsRegular, size: 12))
                .foregroundStyle(type == 1 ? Color.NewColor.buttonEnable : Color.white)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.vertical, 5)
        }.background(type == 1 ? .white : Color.NewColor.buttonEnable)
            .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(type == 1 ? Color.NewColor.buttonEnable : Color.white, lineWidth: 1)
                )
    }
}

struct DropDownDatePickerMenu: View {
    
    var type: Int
    
    @Binding var showSelectDateMenu: Bool
    @Binding var firstDate: Date
    @Binding var secondDate: Date
    var onTap: () -> Void = { }
    
    var body: some View {
        VStack {
            VStack {
                DatePicker("\(String(localized: "DPBaslangic"))", selection: $firstDate, displayedComponents: [.date])
                .onChange(of: firstDate) { newValue in
                    if secondDate < newValue {
                        secondDate = newValue
                    }
                }
                let dateRange = firstDate...Calendar.current.date(byAdding: .day, value: 7, to: firstDate)!
                DatePicker("\(String(localized: "Bitiş"))", selection: $secondDate, in: dateRange, displayedComponents: [.date])
                .onChange(of: secondDate) { newValue in
                    if firstDate != secondDate {
                        withAnimation {
                            //showSelectDateMenu = false
                        }
                    }
                }
                
                HStack {
                    Spacer()
                    Button {
                        showSelectDateMenu = false
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
                        onTap()
                    } label: {
                        Text("DPTamam")
                    }

                }
                
            }.background(.white)
                .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1))
                    .padding(.horizontal, 10)
            Spacer()
        }
    }
}

