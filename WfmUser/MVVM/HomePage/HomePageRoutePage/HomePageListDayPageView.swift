//
//  HomePageListDayPageView.swift
//  WfmUser
//
//  Created by Mustafa Alper Aydin on 17.03.2025.
//

import SwiftUI

struct HomePageListDayPageView: View {
    @EnvironmentObject var homePageVM: HomePageViewModel
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                VStack(spacing: 5) {
                    HomePageListDayPageHeaderInfo().environmentObject(homePageVM)
                    HomePageListDayPageHeaderCompletePointInfo().environmentObject(homePageVM)
                    HomePageListDayPageHeaderFilterCard()
                }.padding(.vertical, 5)
                
                ScrollView {
                    VStack(spacing: 5) {
                        ForEach(0..<homePageVM.personelDayRoutePointArray.count, id:\.self) { i in
                            let cell = homePageVM.personelDayRoutePointArray[i]
                            if i == 0 {
                                HomePageRouteCellView(pastCell: cell, cell: cell).environmentObject(homePageVM)
                            } else {
                                let pastCell = homePageVM.personelDayRoutePointArray[i - 1]
                                HomePageRouteCellView(pastCell: pastCell, cell: cell).environmentObject(homePageVM)
                            }
                        }
                    }.padding(.horizontal, 5)
                }
                
            }.frame(maxHeight: .infinity, alignment: .top)
        }
    }
}

#Preview {
    //HomePageListDayPageView()
    //HomePageListDayPageHeaderInfo()
    HomePageListDayPageHeaderFilterCard()
}


struct HomePageListDayPageHeaderInfo: View {
    @EnvironmentObject var homePageVM: HomePageViewModel
    
    var body: some View {
        VStack {
            HStack {
                HomePageListDayPageHeaderInfoView(image: "calendar", text: "Gün", desc: "\(getDayName(for: currentWeekdayNumber()))")
                HomePageListDayPageHeaderInfoView(image: "number.circle", text: "Nokta",  desc: "\(homePageVM.personelRoutePointArray.filter { $0.haftaninGunu == "\(currentWeekdayNumber())" }.count - 2)")
                HomePageListDayPageHeaderInfoView(image: "scalemass", text: "Ağırlık", desc: "0")
                HomePageListDayPageHeaderInfoView(image: "turkishlirasign.circle", text: "Tutar", desc: "0 TL")
                HomePageListDayPageHeaderInfoView(image: "road.lanes", text: "Km", desc: "0")
                HomePageListDayPageHeaderInfoView(image: "clock.circle", text: "Süre", desc: "0")
            }
        }.padding(.horizontal, 5)
    }
}

struct HomePageListDayPageHeaderCompletePointInfo: View {
    @EnvironmentObject var homePageVM: HomePageViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Tamamlanan İşler: \(homePageVM.personelDayRoutePointArray.count - 2) / \(homePageVM.personelDayRoutePointArray.filter {[LecyStatus.olumluTeslimat, LecyStatus.olumsuzTeslimat].contains($0.executionStatusId)}.count)")
                    .font(.custom(fontsMedium, size: 14))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 5)
                    .background(.gray.opacity(0.2))
                    .customOverlayStyle(cornerRadius: 5, lineColor: .gray.opacity(0.5))
            }
        }.padding(.horizontal, 5)
    }
}

struct HomePageListDayPageHeaderFilterCard: View {
    
    @State private var ugranmisCheckboxChecked = false
    @State private var redAddressCheckboxChecked = false
    @State private var yellowAddressCheckboxChecked = false
    @State private var greenAddresCheckboxChecked = false
    
    @FocusState private var isTextFieldFocused: Bool
    
    @State private var searchText: String = ""
    
    var body: some View {
        VStack {
            HStack {
                VStack(spacing: 0) {
                    HeaderCheckboxView(checked: $ugranmisCheckboxChecked, color: .green)
                        .onChange(of: ugranmisCheckboxChecked) { newValue in
                            //mainPageVM.pointArray = mainPageVM.listfilter(allPoint: newValue, searchText: mainPageVM.searchText, redAddress: firstCheckboxChecked, yellowAddress: secondCheckboxChecked, greenAddress: fourthCheckboxChecked)
                        }
                    Text("ugranmis")
                        .font(Font.custom(fontsRegular, size: 8))
                }
                
                ZStack {
                    SearchTextField(text: $searchText)
                        .focused($isTextFieldFocused)
                        .onChange(of: searchText) { newValue in
                            //mainPageVM.pointArray = mainPageVM.listfilter(allPoint: thirdCheckboxChecked, searchText: mainPageVM.searchText, redAddress: firstCheckboxChecked, yellowAddress: secondCheckboxChecked, greenAddress: fourthCheckboxChecked)
                        }
                    
                    if isTextFieldFocused {
                        HStack {
                            Spacer()

                            Button {
                                if searchText != "" {
                                    searchText = ""
                                } else {
                                    isTextFieldFocused = false
                                }
                            } label: {
                                Image(systemName: "xmark.circle")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.gray)
                            }.padding(.trailing, 10)
                        }
                    }
                }
                
                
                if !isTextFieldFocused {
                    Text("adress")
                        .font(Font.custom(fontsRegular, size: 12))
                        .padding(.trailing, 8)

                    HeaderCheckboxView(checked: $redAddressCheckboxChecked, color: .red)
                        .onChange(of: redAddressCheckboxChecked) { newValue in
                            //mainPageVM.pointArray = mainPageVM.listfilter(allPoint: thirdCheckboxChecked, searchText: mainPageVM.searchText, redAddress: newValue, yellowAddress: secondCheckboxChecked, greenAddress: fourthCheckboxChecked)
                            
                        }
                    HeaderCheckboxView(checked: $yellowAddressCheckboxChecked, color: .orange)
                        .onChange(of: yellowAddressCheckboxChecked) { newValue in
                            //mainPageVM.pointArray = mainPageVM.listfilter(allPoint: thirdCheckboxChecked, searchText: mainPageVM.searchText, redAddress: firstCheckboxChecked, yellowAddress: newValue, greenAddress: fourthCheckboxChecked)
                            
                        }
                    
                    HeaderCheckboxView(checked: $greenAddresCheckboxChecked, color: .green)
                        .onChange(of: greenAddresCheckboxChecked) { newValue in
                            //mainPageVM.pointArray = mainPageVM.listfilter(allPoint: thirdCheckboxChecked, searchText: mainPageVM.searchText, redAddress: firstCheckboxChecked, yellowAddress: secondCheckboxChecked, greenAddress: newValue)
                        }
                    
                    HeaderRefreshButton(backgroundColor: Color.MyColor.colorGray2, icon: Image(systemName: "arrow.clockwise.circle"), text: NSLocalizedString("refresh", comment: ""), onTap: {
                        /*mainPageVM.getPlannedList { result in
                            if result {
                                mainPageVM.pointArray = mainPageVM.listfilter(allPoint: thirdCheckboxChecked, searchText: mainPageVM.searchText, redAddress: firstCheckboxChecked, yellowAddress: secondCheckboxChecked, greenAddress: fourthCheckboxChecked)
                            }
                        } */
                    })
                }
            }
        }.padding(.horizontal, 5)
    }
}

struct HeaderCheckboxView: View {
    @Binding var checked: Bool
    var color: Color

    var body: some View {
        HStack {
            Image(systemName: checked ? "checkmark.square" : "square")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(color)
                .onTapGesture {
                    checked.toggle()
                }
        }
    }
}

struct HomePageListDayPageHeaderInfoView: View {
    
    var image: String
    var text: String = ""
    var desc: String
    
    var body: some View {
        VStack(spacing: 0) {
            Text(text)
                .font(.custom(fontsRegular, size: 12))
                .foregroundStyle(.black)
            Divider()
            Text(desc)
                .font(.custom(fontsRegular, size: 12))
                .foregroundStyle(.black)
        }.customOverlayStyle(cornerRadius: 5, lineColor: .gray.opacity(0.2))
        /*HStack(spacing: 5) {
            Image(systemName: image)
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundStyle(.white)
            
            /*Text(text)
                .font(.custom(fontsSemiBold, size: 14))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.white)
                .padding(.horizontal, 5) */
            
            Text(desc)
                .font(.custom(fontsSemiBold, size: 14))
                .foregroundStyle(.white)
            
        }.padding(.vertical, 5)
            .padding(.horizontal, 5)
            .background(Color.MyColor.releaseNoteBlueText)
            .customOverlayStyle(cornerRadius: 10, lineColor: Color.MyColor.releaseNoteBlueText) */
    }
}

private struct SearchTextField: View {
    @Binding var text: String
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass.circle")
                .resizable()
                .frame(width: 10, height: 10)
                .foregroundColor(.gray)
            
            TextField("\(NSLocalizedString("search", comment: ""))", text: $text)
                .font(Font.custom(fontsSemiBold, size: 14))
                .padding(.vertical, 5)
                .background(Color.white)
                
        }
        .padding(.horizontal, 5)
        .overlay(RoundedRectangle(cornerRadius: 3)
            .stroke(Color.gray, lineWidth: 1))
    }
}

private struct HeaderRefreshButton: View {
    var backgroundColor: Color
    var icon: Image
    var text: String
    var onTap: () -> Void
    var body: some View {
        Button {
            onTap()
        } label: {
            HStack {
                icon
                    .resizable()
                    .frame(width: 15, height: 15)
                    .foregroundColor(Color.black)
                    .padding(.vertical, 5)
                    //.padding(.leading, 5)
                    .padding(.horizontal, 5)

                /*Text(text)
                    .font(Font.custom(fontsSemiBold, size: 14))
                    .foregroundColor(Color.black)
                    .padding(.horizontal, 5) */
                    //.frame(maxWidth: .infinity, alignment: .center)
            }
            //.frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(CR.btn5)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.gray.opacity(0.4), lineWidth: 1) // Adjust the color and width as needed
            )
            
        }.buttonStyle(ScaleButtonStyle())
    }
}
