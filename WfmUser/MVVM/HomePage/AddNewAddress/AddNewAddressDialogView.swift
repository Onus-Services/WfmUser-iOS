//
//  AddNewAddressDialogView.swift
//  WfmUser
//
//  Created by Mustafa Alper Aydin on 21.03.2025.
//

import SwiftUI

struct AddNewAddressDialogView: View {
    
    @EnvironmentObject var homePageVM: HomePageViewModel
    
    var body: some View {
        ZStack {
            
            VStack(spacing: 0) {
                DialogHeaderCard(text: String(localized: "Nokta Ekle"), background: Color.DialogColor.dialogHeaderDarkBlue) {
                    homePageVM.isAddNewAddressDialog = false
                }
                
                HStack {
                    Text("Adres:")
                        .font(.custom(fontsSemiBold, size: 12))
                        .frame(width: 50)
                    
                    Text(homePageVM.addressOnCenterMap)
                        .font(.custom(fontsRegular, size: 10))
                        .frame(maxWidth: .infinity, alignment: .leading)
                       
                }
                
                HStack {
                    Text("Konum: \(homePageVM.place?.geoCoordinates)")
                }
                
                ScrollView {
                    let columns = [
                        GridItem(.flexible(), spacing: 5),
                        GridItem(.flexible(), spacing: 5)
                    ]
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 10) {
                            
                            ForEach(Array($homePageVM.newAddressFilter.enumerated()), id: \.element.id) { index, $cell in
                                
                                switch cell.filterStyle {
                                case 1:
                                    DeliveredDialogText(title: cell.filterName, text: $homePageVM.newAddressFilter[index].selectedValue)
                                        .disabled([5, 6, 7, 8, 26].contains(cell.filterId) ? true : false)
                                case 2:
                                    if cell.parsAtt != nil {
                                        CustomPickerViewDialog(title: cell.filterName, selectedItems: $homePageVM.newAddressFilter[index].selectedItems, items: homePageVM.newAddressFilter[index].parsAtt!.map { $0.value }, selectionMode: .multiple, index: index, disable: [5, 6, 7, 8, 26].contains(cell.filterId) ? true : false).environmentObject(homePageVM)
                                            .disabled([5, 6, 7, 8, 26].contains(cell.filterId) ? true : false)
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
                
                HStack(spacing: 10) {
                    Button {
                        homePageVM.isAddNewAddressDialog = false
                        homePageVM.addressOnCenterMap = "..."
                        homePageVM.place = nil
                    } label: {
                        Text("Kapat")
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.vertical, 10)
                            .background(Color.NewColor.redDark)
                            .customOverlayStyle(cornerRadius: 10, lineColor: .clear)
                    }
                    Button {
                        print("\(homePageVM.newAddressFilter)")
                    } label: {
                        Text("Kaydet")
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.vertical, 10)
                            .background(Color.NewColor.greenDark)
                            .customOverlayStyle(cornerRadius: 10, lineColor: .clear)
                    }
                }.padding(10)
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
    }
}

#Preview {
    AddNewAddressDialogView()
}
