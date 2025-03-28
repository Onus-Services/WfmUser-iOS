//
//  AddNewAddressDialogView.swift
//  WfmUser
//
//  Created by Mustafa Alper Aydin on 21.03.2025.
//

import SwiftUI

struct AddNewAddressDialogView: View {
    
    @EnvironmentObject var homePageVM: HomePageViewModel
    @State private var adressIsim: String = ""
    @State private var newAddressPageType: Int = 0
    
    @State private var newAddressIsim: String = ""
    @State private var newAddressTakipId: String = ""
    @State private var newAddressIsSuresi: Set<String> = []
    
    
    var body: some View {
        ZStack {
            if homePageVM.editAddress {
                VStack(spacing: 0) {
                    DialogHeaderCard(text: String(localized: "DialogNoktaDüzenle"), background: Color.DialogColor.dialogHeaderDarkBlue) {
                        homePageVM.isAddNewAddressDialog = false
                    }
                    
                    HStack {
                        Text("AddNewAddressAddres")
                            .font(.custom(fontsSemiBold, size: 14))
                            .frame(width: 50)
                        
                        Text(homePageVM.addressOnCenterMap)
                            .font(.custom(fontsRegular, size: 14))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    HStack {
                        Text("\(String(localized: "AddNewAddressKonum")) \(homePageVM.place?.geoCoordinates)")
                            .foregroundStyle(.black)
                            .font(.custom(fontsRegular, size: 14))
                    }
                    
                    HStack {
                        Text("AddNewAddressBaslik")
                            .foregroundStyle(.black)
                            .font(.custom(fontsRegular, size: 14))
                        
                        TextEditor(text: $adressIsim)
                            .font(.custom(fontsSemiBold, size: 14))
                            .padding(.horizontal, 5)
                            .frame(maxHeight: 80) // Yüksekliği ayarlayabilirsin
                            .background(Color.white)
                            .customOverlayStyle(cornerRadius: 10, lineColor: .gray)
                            .padding(5)
                        
                    }.padding(5)
                    
                    HStack {
                        Button {
                            //
                        } label: {
                            Text("AddNewAddressDegisiklikOnay")
                                .font(.custom(fontsSemiBold, size: 16))
                                .foregroundStyle(.white)
                                .padding(10)
                                .background(Color.MyColor.colorGreen)
                                .customOverlayStyle(cornerRadius: 10, lineColor: Color.WarningColor.successWarningColor)
                        }
                    }.padding(5)
                }
            } else {
                VStack(spacing: 0) {
                    DialogHeaderCard(text: String(localized: "DialogNoktaEkle"), background: Color.DialogColor.dialogHeaderDarkBlue) {
                        homePageVM.isAddNewAddressDialog = false
                    }
                    
                    HStack {
                        Text("AddNewAddressAddres")
                            .font(.custom(fontsSemiBold, size: 14))
                            .frame(width: 50)
                        
                        Text(homePageVM.addressOnCenterMap)
                            .font(.custom(fontsRegular, size: 14))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    HStack {
                        Text("\(String(localized: "AddNewAddressKonum")) \(homePageVM.place?.geoCoordinates)")
                            .foregroundStyle(.black)
                            .font(.custom(fontsRegular, size: 14))
                    }
                    
                    if newAddressPageType == 0 {
                        ScrollView {
                            ForEach(Array($homePageVM.newAddressFilter.enumerated()), id: \.element.id) { index, $cell in
                                if [0, 1, 3, 5, 6, 7, 12].contains(cell.filterId) {
                                    switch cell.filterStyle {
                                    case 1:
                                        DeliveredDialogText(title: cell.filterName, text: $homePageVM.newAddressFilter[index].selectedValue)
                                    case 2:
                                        if cell.parsAtt != nil {
                                            CustomPickerViewDialog(title: cell.filterName, selectedItems: $homePageVM.newAddressFilter[index].selectedItems, items: homePageVM.newAddressFilter[index].parsAtt!.map { $0.value }, selectionMode: .multiple, index: index).environmentObject(homePageVM)
                                        }
                                    case 3:
                                        Text("Date")
                                    default:
                                        Text("aa")
                                    }
                                }
                            }
                        }
                    } else {
                        HStack {
                            Button(action: {
                                withAnimation {
                                    newAddressPageType = 0
                                }
                            }, label: {
                                Text("AddNewAddressGeri")
                                    .font(.custom(fontsRegular, size: 14))
                                    .foregroundStyle(.blue)
                                    .padding(5)
                                    
                            }).customOverlayStyle(cornerRadius: 10, lineColor: .blue)
                            
                            Spacer()
                        }.padding(5)
                        
                        ScrollView {
                            let columns = [
                                GridItem(.flexible(), spacing: 5),
                                GridItem(.flexible(), spacing: 5)
                            ]
                            ScrollView {
                                LazyVGrid(columns: columns, spacing: 10) {
                                    ForEach(Array($homePageVM.newAddressFilter.enumerated()), id: \.element.id) { index, $cell in
                                        if ![0, 1, 2, 5, 6, 7, 12].contains(cell.filterId) {
                                            switch cell.filterStyle {
                                            case 1:
                                                DeliveredDialogText(title: cell.filterName, text: $homePageVM.newAddressFilter[index].selectedValue)
                                            case 2:
                                                if cell.parsAtt != nil {
                                                    CustomPickerViewDialog(title: cell.filterName, selectedItems: $homePageVM.newAddressFilter[index].selectedItems, items: homePageVM.newAddressFilter[index].parsAtt!.map { $0.value }, selectionMode: .multiple, index: index).environmentObject(homePageVM)
                                                }
                                            case 3:
                                                Text("Date")
                                            default:
                                                Text("aa")
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                    if newAddressPageType == 0 {
                        Button(action: {
                            withAnimation {
                                newAddressPageType = 1
                            }
                        }, label: {
                            Text("AddNewAddressDigerOzellik")
                                .font(.custom(fontsRegular, size: 14))
                                .foregroundStyle(.blue)
                        })
                        .padding(.vertical, 5)
                    } else {
                        HStack(spacing: 10) {
                            Button {
                                homePageVM.isAddNewAddressDialog = false
                                homePageVM.addressOnCenterMap = "..."
                                homePageVM.place = nil
                            } label: {
                                Text("AddNewAddressKapat")
                                    .font(.custom(fontsSemiBold, size: 14))
                                    .foregroundStyle(.white)
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .padding(.vertical, 10)
                                    .background(Color.NewColor.redDark)
                                    .customOverlayStyle(cornerRadius: 10, lineColor: .clear)
                            }
                            Button {
                                if homePageVM.newAddressFilter[0].selectedValue == "" || homePageVM.newAddressFilter[1].selectedItems == [] || homePageVM.newAddressFilter[3].selectedValue == "" || homePageVM.newAddressFilter[5].selectedItems == [] || homePageVM.newAddressFilter[6].selectedItems == [] || homePageVM.newAddressFilter[7].selectedItems == [] || homePageVM.newAddressFilter[12].selectedItems == [] {
                                    homePageVM.showToast(message: String(localized: "ToastBosBırakılan"))
                                }
                                print("\(homePageVM.newAddressFilter)")
                            } label: {
                                Text("AddNewAddressKaydet")
                                    .font(.custom(fontsSemiBold, size: 14))
                                    .foregroundStyle(.white)
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .padding(.vertical, 10)
                                    .background(Color.NewColor.greenDark)
                                    .customOverlayStyle(cornerRadius: 10, lineColor: .clear)
                            }
                        }.padding(10)
                    }
                    
                }
            }
        }.background(Color.white)
            .customOverlayStyle(cornerRadius: CR.dlg10, lineColor: Color.DialogColor.dialogHeaderDarkBlue)
            .padding(.horizontal, 10)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color.DialogColor.dialogBackgorundOpacityColor
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation{
                            homePageVM.isAddNewAddressDialog = false
                        }
                    }
            )
            .customAppearAnimation2()
            .onAppear {
                if homePageVM.editAddress {
                    adressIsim = homePageVM.selectedPoint?.isim ?? ""
                }
            }
    }
}

#Preview {
    AddNewAddressDialogView()
}
