//
//  MainPageView.swift
//  WfmAdmin
//
//  Created by Mustafa Alper Aydin on 28.01.2025.
//

import SwiftUI

struct MainPageView: View {
    
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var mainPageVM: MainPageViewModel
    @State var showMenu: Bool = false
    
    @StateObject var homePageVM: HomePageViewModel = HomePageViewModel()
    @StateObject var locationViewModel = LocationViewModel()
    @State private var isLocErr: Bool = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HeaderBarView(showMenu: $showMenu).environmentObject(mainPageVM)
                ZStack {
                    switch mainPageVM.mainPageType {
                    case .anasayfa:
                        HomePageView().environmentObject(homePageVM)
                    case .haftalikPlan:
                        HomePageListWeeklyPageView().environmentObject(homePageVM)
                    case .raporlar:
                        HomePageDashboard().environmentObject(homePageVM)
                    case .aylik:
                        MonthlyPageView(currentMonth: Date()).environmentObject(homePageVM)
                    }
                }
            }
            
            ZStack {
                if showMenu {
                    LeftListMenuView(showMenu: $showMenu, pageType: .constant(0)).environmentObject(mainPageVM).environmentObject(appState).environmentObject(homePageVM)
                }
            }
            
            if mainPageVM.isLogoutDialog {
                LogoutDialogView().environmentObject(appState).environmentObject(mainPageVM)
            }
            
            if homePageVM.showAlert {
                ErrorDialogView(isErrorDialog: $homePageVM.showAlert, isAnimate: $homePageVM.isButtonLoading, type: homePageVM.errorType, text: homePageVM.error, errorCode: homePageVM.errorCode).environmentObject(appState).environmentObject(homePageVM)
                    .customAppearAnimation2()
            }
            
            if homePageVM.isToastMessage {
                ToastView(isPresented: $homePageVM.isToastMessage, toastMessage: homePageVM.isToastMessageText, color: homePageVM.isToastMessageBgColor)
            }
            
            if homePageVM.isLoading {
                LoadingDialogView()
            }
            
            if mainPageVM.isChangeLanguageInfoDialog {
                ChangeLanguageInfoDialog(isChangeLanguageInfoDialog: $mainPageVM.isChangeLanguageInfoDialog)
            }
            
        }.onAppear {
            //homePageVM.getCompanyListByMasterCompany(firstLogin: appState.newLogin)
            homePageVM.addedReport = []
            var localReport = preferences.string(forKey: "reportPreferences") ?? ""
            if localReport == "" {
                localReport = "barTeslimat,lineHesaplananToplananKm"
                preferences.set(localReport, forKey: "reportPreferences")
            }
            let preferencesArray = localReport.split(separator: ",").map { String($0) }
            for i in 0..<preferencesArray.count {
                let firstReportType = ReportType(rawValue: preferencesArray[i])
                if firstReportType != nil {
                    homePageVM.addedReport.append(firstReportType!)
                    homePageVM.localReport.append(firstReportType!)
                }
            }
            print("localReport - \(localReport)")
        }.onAppear {
            //CameraPermissionManager().checkPermission()
            getCurrentLanguage()
            
            switch locationViewModel.authorizationStatus {
            case .notDetermined, .restricted, .denied:
                self.isLocErr = true
                homePageVM.isLocErrInfo = true
                //homePageVM.locationCloseNotification()
            case .authorizedAlways, .authorizedWhenInUse:
                self.isLocErr = false
                homePageVM.isLocErrInfo = false
                //homePageVM.locationCloseNotification(isLocationPermissionClose: false)
            default:
                self.isLocErr = true
                homePageVM.isLocErrInfo = true
                //homePageVM.locationCloseNotification()
            }
        }.onChange(of: locationViewModel.authorizationStatus, perform: { newValue in
            switch locationViewModel.authorizationStatus {
            case .notDetermined, .restricted, .denied:
                homePageVM.isLocErrInfo = true
                //homePageVM.locationCloseNotification()
            case .authorizedAlways, .authorizedWhenInUse:
                homePageVM.isLocErrInfo = false
                //homePageVM.locationCloseNotification(isLocationPermissionClose: false)
            default:
                homePageVM.isLocErrInfo = true
                //homePageVM.locationCloseNotification()
            }
        })
    }
}
