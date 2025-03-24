//
//  ControllerView.swift
//  WfmAdmin
//
//  Created by Mustafa Alper Aydin on 28.01.2025.
//

import SwiftUI

struct ControllerView: View {
    
    @ObservedObject var appState = AppState()
    @State private var isFirstLogin : Bool = true
    
    @StateObject var mainPageVM: MainPageViewModel = MainPageViewModel()
    @StateObject var forgotPageVM: ForgotPasswordPageViewModel = ForgotPasswordPageViewModel()
    
    
    
    var body: some View {
        ZStack {
            if isFirstLogin {
                SplashPageView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            isFirstLogin = false
                        }
                    }
            } else {
                switch appState.pageType {
                case 0, 1:
                    LoginPageView().environmentObject(appState).environmentObject(mainPageVM)
                case 2:
                    SMSVerificationView(countryCode: "countryCode", phoneNumber: "phoneNumber", pageType: 1).environmentObject(appState)
                case 3:
                    MainPageView().environmentObject(appState).environmentObject(mainPageVM)
                case 4:
                    ForgotPasswordPageView().environmentObject(appState).environmentObject(forgotPageVM)
                default:
                    VStack {
                        Text("Geçersiz sayfa \(appState.pageType)")
                        Button {
                            appState.pageType = 2
                        } label: {
                            Text("Ana sayfaya dön")
                        }
                        
                        Button {
                            appState.logout()
                        } label: {
                            Text("Login")
                        }

                    }
                }
            }
        }
    }
}
