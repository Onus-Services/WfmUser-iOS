//
//  HomePageView.swift
//  WfmUser
//
//  Created by Mustafa Alper Aydin on 14.03.2025.
//

import SwiftUI

struct HomePageView: View {
    @EnvironmentObject var homePageVM: HomePageViewModel
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea(.all)
            VStack(spacing: 0) {
                if homePageVM.homePagePageType == 0 {
                    HomePageRoutePageView().environmentObject(homePageVM)
                } else if homePageVM.homePagePageType == 1 {
                    NavigatePageView(selectedPoint: homePageVM.selectedPoint).environmentObject(homePageVM)
                }
            }.frame(maxHeight: .infinity, alignment: .top)
            
            if homePageVM.isAddNewAddressDialog {
                AddNewAddressDialogView().environmentObject(homePageVM)
            }
            
            if homePageVM.reRouteDialog {
                RerouteDialogView().environmentObject(homePageVM)
            }
            
            if homePageVM.isPickerViewOpen {
                if homePageVM.selectedFilterIndex != -1 {
                    PickerViewDialogCardView(title: homePageVM.newAddressFilter[homePageVM.selectedFilterIndex].filterName, isPickerViewOpen: $homePageVM.isPickerViewOpen, itemsDialog: homePageVM.newAddressFilter[homePageVM.selectedFilterIndex].parsAtt!.map { $0.value }, isPickerViewSelectedItems: $homePageVM.newAddressFilter[homePageVM.selectedFilterIndex].selectedItems).environmentObject(homePageVM)
                }
            }
        }
    }
}

#Preview {
    HomePageView().environmentObject(HomePageViewModel())
}

func currentWeekdayNumber() -> Int {
    let calendar = Calendar.current
    let weekday = calendar.component(.weekday, from: Date())
    return (weekday == 1) ? 7 : weekday - 1
}


struct HomePageTopBarButton: View {
    
    var text: String
    var isSelect: Bool
    var onTap: () -> Void = { }
    @EnvironmentObject var homePageVM: HomePageViewModel
    
    var body: some View {
        Button {
            withAnimation {
                onTap()
            }
        } label: {
            VStack {
                Text(text)
                    .font(.custom(fontsSemiBold, size: 12))
                    .foregroundStyle(isSelect ? .white : Color.MyColor.bottomMenuBlueColor)
            }.frame(maxWidth: .infinity)
                .frame(height: 40)
                .background(!isSelect ? .white : Color.MyColor.bottomMenuBlueColor)
        }.disabled(isSelect)
    }
}

struct HomePageBottomBar: View {
    
    @Binding var homePageType: Int
    @EnvironmentObject var homePageVM: HomePageViewModel
    
    var body: some View {
        HStack(spacing: 0) {
            HomePageBottomBarButton(text: String(localized: "\(String(localized: "Liste"))"), image: ImageConstants.bottomBarDashboard.rawValue, isSelect: homePageType == 0 ? true : false) {
                homePageType = 0
            }.environmentObject(homePageVM)
            HomePageBottomBarButton(text: String(localized: "\(String(localized: "Harita"))"), image: ImageConstants.bottomBarAdresDefteri.rawValue, isSelect: homePageType == 1 ? true : false) {
                homePageType = 1
            }.environmentObject(homePageVM)
        }
    }
}

struct HomePageBottomBarButton: View {
    
    var text: String
    var image: String
    var isSelect: Bool
    var onTap: () -> Void
    @EnvironmentObject var homePageVM: HomePageViewModel
    
    var body: some View {
        Button {
            withAnimation {
                onTap()
            }
        } label: {
            VStack {
                Image(image)
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundStyle(isSelect ? .white : Color.MyColor.bottomMenuBlueColor)
                
                Text(text)
                    .font(.custom(fontsSemiBold, size: 12))
                    .foregroundStyle(isSelect ? .white : Color.MyColor.bottomMenuBlueColor)
            }.frame(maxWidth: .infinity)
                .frame(height: 65)
                .background(!isSelect ? .white : Color.MyColor.bottomMenuBlueColor)
        }.disabled(isSelect)
    }
}

