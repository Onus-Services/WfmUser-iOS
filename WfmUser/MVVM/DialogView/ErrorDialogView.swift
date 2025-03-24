//
//  ErrorDialogView.swift
//  WfmAdmin
//
//  Created by Mustafa Alper Aydin on 27.01.2025.
//

import Foundation
import SwiftUI

struct ErrorDialogView: View {
    
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var homePageVM: HomePageViewModel
    @Binding var isErrorDialog: Bool
    @Binding var isAnimate: Bool
    var type: Int
    var text: String
    var errorCode: Int
    
    @State private var isPressed: Bool = false
    @State private var isPressed1: Bool = false
    @State private var isPressed2: Bool = false
    
    @State var lastSelectedIndex: Int? = 0
    
    var body: some View {
        ZStack {
            VStack {
                VStack(spacing: 30) {
                    HStack {
                        Text(type == ErrorTypes.SUCCESS ? "\(String(localized: "EDBasarili"))" : type == ErrorTypes.WARNING ? "\(String(localized: "EDUyarı"))" : "\(String(localized: "EDHata"))")
                            .font(.custom(fontsMedium, size: 14))
                            .foregroundColor(type == ErrorTypes.SUCCESS ? Color.WarningColor.successWarningColor : type == ErrorTypes.WARNING ? Color.WarningColor.warningWarningColor : Color.WarningColor.failedWarningColor)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    
                    Image(systemName: type == ErrorTypes.SUCCESS ? "checkmark.circle.fill" : type == ErrorTypes.WARNING ? "exclamationmark.triangle.fill" : "xmark.circle.fill")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(type == ErrorTypes.SUCCESS ? Color.WarningColor.successWarningColor : type == ErrorTypes.WARNING ? Color.WarningColor.warningWarningColor : Color.WarningColor.failedWarningColor)
                    
                    
                    
                    if [LecyStatus.gidiyorum, LecyStatus.gitmedim, LecyStatus.teslimatFormuDolduruluyor, LecyStatus.teslimatFormuDolduruluyorCoklu, LecyStatus.birdenFazlaGeldim].contains(errorCode) {
                        
                        VStack {
                            if errorCode == LecyStatus.teslimatFormuDolduruluyor {
                                VStack(spacing: 0) {
                                    Text("\(NSLocalizedString("nokta1111", comment: "")) \(homePageVM.dialogExcPoint?.isim)")
                                        .font(.custom(fontsRegular, size: 15))
                                        //.frame(maxHeight: .infinity)
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.black)
                                    Text("\(NSLocalizedString("noktayaOlanUzakliginiz", comment: "")) \(text) \(NSLocalizedString("km", comment: ""))")
                                        .font(.custom(fontsRegular, size: 15))
                                        //.frame(maxHeight: .infinity)
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.black)
                                    (Text("noktayaD")
                                        .font(.custom(fontsRegular, size: 15))
                                    +
                                    Text("geldiginiziD")
                                        .font(.custom(fontsMedium, size: 17))
                                    +
                                    Text("onayliyorMusunuz")
                                        .font(.custom(fontsRegular, size: 15))
                                    )
                                        .padding(.horizontal, 10)
                                        //.frame(maxHeight: .infinity)
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.black)
                                }
                                
                            } else if errorCode == LecyStatus.teslimatFormuDolduruluyorCoklu {
                                VStack(spacing: 0) {
                                    Text(text)
                                        .font(.custom(fontsRegular, size: 15))
                                        //.frame(maxHeight: .infinity)
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.black)
                                }
                            } else if errorCode == LecyStatus.birdenFazlaGeldim {
                                VStack(spacing: 0) {
                                    Text(text)
                                        .font(.custom(fontsRegular, size: 15))
                                        //.frame(maxHeight: .infinity)
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.black)
                                }
                                
                            } else if [LecyStatus.gidiyorum, LecyStatus.gitmedim, LecyStatus.olumluTeslimat, LecyStatus.olumsuzTeslimat].contains(errorCode) {
                                if [LecyStatus.gidiyorum, LecyStatus.gitmedim].contains(errorCode) {
                                    (Text(errorCode == LecyStatus.gidiyorum ? "\(NSLocalizedString("gidiyorum", comment: ""))" : "\(NSLocalizedString("gelmedim", comment: "")) ")
                                        .font(.custom(fontsMedium, size: 17))
                                    +
                                    Text("\(NSLocalizedString("olarakKaydedilecek", comment: ""))\n\(NSLocalizedString("eminmisin", comment: ""))")
                                        .font(.custom(fontsRegular, size: 15))
                                    )
                                        .padding(.horizontal, 10)
                                        //.frame(maxHeight: .infinity)
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.black)
                                } else {
                                    (Text(errorCode == LecyStatus.olumluTeslimat ? "\(NSLocalizedString("olumlu", comment: ""))" : "\(NSLocalizedString("olumsuz", comment: "")) ")
                                        .font(.custom(fontsMedium, size: 17))
                                    +
                                    Text("\(NSLocalizedString("kapatılacak", comment: ""))\n\(NSLocalizedString("eminmisin", comment: ""))")
                                        .font(.custom(fontsRegular, size: 15))
                                    )
                                        .padding(.horizontal, 10)
                                        //.frame(maxHeight: .infinity)
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.black)
                                }
                            } else {
                                Text(text)
                                    .font(.custom(fontsRegular, size: 15))
                                    .padding(.horizontal, 10)
                                    //.frame(maxHeight: .infinity)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                            }
                        }.frame(maxHeight: 100)
                        
                    } else {
                        Text(text)
                            .font(.custom(fontsRegular, size: 15))
                            .padding(.horizontal, 10)
                            //.frame(maxHeight: .infinity)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .frame(maxHeight: 100)
                    }
                    HStack(spacing: 10) {
                        
                        Button {
                            isErrorDialog = false
                            if errorCode == -10101 {
                                appState.logout()
                            }
                        } label: {
                            Text("\(String(localized: "Kapat"))") //reddet - göster
                                .font(.custom(fontsMedium, size: 14))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 10)
                                .background(type == ErrorTypes.SUCCESS ? Color.WarningColor.successWarningColor : type == ErrorTypes.WARNING ? Color.WarningColor.warningWarningColor : Color.WarningColor.failedWarningColor)
                                .cornerRadius(CR.btn10)
                            
                        }.modifier(ButtonEffect(isPressed: $isPressed))
                            .disabled(isAnimate)
                        
                        if errorCode == LecyStatus.gidiyorum || errorCode == LecyStatus.teslimatFormuDolduruluyor || errorCode == LecyStatus.gitmedim || errorCode == LecyStatus.olumluTeslimat || errorCode == LecyStatus.olumsuzTeslimat {
                            Button {
                                if errorCode == LecyStatus.gidiyorum {
                                    print("homePageVM.dialogExcPoint - \(homePageVM.dialogExcPoint)")
                                    homePageVM.executionV1MultiBody(executionType: LecyStatus.gidiyorum, point: homePageVM.dialogExcPoint) { result in
                                        if let index = homePageVM.personelDayRoutePointArray.firstIndex(where: { $0.mxRoutePointsId == homePageVM.dialogExcPoint!.mxRoutePointsId }) {
                                            homePageVM.clickedPoint = homePageVM.personelDayRoutePointArray[index]
                                            //homePageVM.pointExcDialog = false
                                            isErrorDialog = false
                                            withAnimation {
                                                homePageVM.homePagePageType = 1
                                            }
                                        }
                                        isErrorDialog = false
                                        withAnimation {
                                            homePageVM.homePagePageType = 1
                                        }
                                    }
                                } else if errorCode == LecyStatus.teslimatFormuDolduruluyor {
                                    homePageVM.executionV1MultiBody(executionType: LecyStatus.teslimatFormuDolduruluyor, point: homePageVM.dialogExcPoint) { result in
                                        if result {
                                            if let index = homePageVM.personelDayRoutePointArray.firstIndex(where: { $0.mxRoutePointsId == homePageVM.dialogExcPoint?.mxRoutePointsId }) {
                                                homePageVM.dialogExcPoint = homePageVM.personelDayRoutePointArray[index]
                                            }
                                            isErrorDialog = false
                                            withAnimation {
                                                homePageVM.homePagePageType = 1
                                            }
                                            /*withAnimation {
                                                homePageVM.lecyPageType = 2
                                                homePageVM.pointExcDialog = false
                                                isErrorDialog = false
                                                homePageVM.openHeaderInfo = false
                                            } */
                                        }
                                    }
                                } else if errorCode == LecyStatus.gitmedim {
                                    homePageVM.executionV1MultiBody(executionType: LecyStatus.gitmedim, point: homePageVM.dialogExcPoint) { result in
                                        if result {
                                            if let index = homePageVM.personelDayRoutePointArray.firstIndex(where: { $0.mxRoutePointsId == homePageVM.dialogExcPoint?.mxRoutePointsId }) {
                                                homePageVM.dialogExcPoint = homePageVM.personelDayRoutePointArray[index]
                                                isErrorDialog = false
                                                //homePageVM.pointExcDialog = false
                                                /*withAnimation {
                                                    homePageVM.lecyPageType = 0
                                                    isErrorDialog = false
                                                    homePageVM.openHeaderInfo = false
                                                } */
                                            }
                                            isErrorDialog = false
                                            withAnimation {
                                                homePageVM.homePagePageType = 0
                                            }
                                        }
                                    }
                                } else if errorCode == LecyStatus.olumluTeslimat {
                                    homePageVM.executionV1MultiBody(executionType: LecyStatus.olumluTeslimat, point: homePageVM.dialogExcPoint) { result in
                                        if result {
                                            if let index = homePageVM.personelDayRoutePointArray.firstIndex(where: { $0.mxRoutePointsId == homePageVM.dialogExcPoint?.mxRoutePointsId }) {
                                                homePageVM.dialogExcPoint = homePageVM.personelDayRoutePointArray[index]
                                                isErrorDialog = false
                                                //homePageVM.pointExcDialog = false
                                                /*withAnimation {
                                                    homePageVM.lecyPageType = 0
                                                    isErrorDialog = false
                                                    homePageVM.openHeaderInfo = false
                                                } */
                                            }
                                            isErrorDialog = false
                                            withAnimation {
                                                homePageVM.homePagePageType = 0
                                            }
                                        }
                                    }
                                } else if errorCode == LecyStatus.olumsuzTeslimat {
                                    homePageVM.executionV1MultiBody(executionType: LecyStatus.olumsuzTeslimat, point: homePageVM.dialogExcPoint) { result in
                                        if result {
                                            if let index = homePageVM.personelDayRoutePointArray.firstIndex(where: { $0.mxRoutePointsId == homePageVM.dialogExcPoint?.mxRoutePointsId }) {
                                                homePageVM.dialogExcPoint = homePageVM.personelDayRoutePointArray[index]
                                                isErrorDialog = false
                                                //homePageVM.pointExcDialog = false
                                                /*withAnimation {
                                                    homePageVM.lecyPageType = 0
                                                    isErrorDialog = false
                                                    homePageVM.openHeaderInfo = false
                                                } */
                                            }
                                            isErrorDialog = false
                                            withAnimation {
                                                homePageVM.homePagePageType = 0
                                            }
                                        }
                                    }
                                }
                            } label: {
                                HStack {
                                    if isAnimate {
                                        ZStack {
                                            ProgressView()
                                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                                .scaleEffect(2.0, anchor: .center)
                                        }.padding(.leading, 10)
                                    }
                                    
                                    Text(errorCode == 99 ? "\(NSLocalizedString("kaydetmedenCik", comment: ""))" : "\(NSLocalizedString("onayla", comment: ""))")
                                        .font(.custom(fontsMedium, size: errorCode == 99 ? 8 : 14))
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity)
                                        .padding(.vertical, 10)
                                        
                                }.background(errorCode == 99 ? Color.MyColor.failedWarningColor : Color.MyColor.successWarningColor)
                                .cornerRadius(CR.btn10)
                                    
                            }
                            .modifier(ButtonEffect(isPressed: $isPressed1))
                            .disabled(isAnimate)
                        }
                        

                    }.padding(.horizontal, 10)
                        .padding(.bottom, 20)
                    
                    
                }.frame(maxWidth: .infinity/*, maxHeight: .infinity*/)
                    .background(.white)
                    .cornerRadius(CR.dlg10)
                    .padding(.top, 10)
                
            }.frame(width: screenWidth - 80/*, height: UIScreen.main.bounds.height * 0.5*/)
                .background(type == ErrorTypes.SUCCESS ? Color.WarningColor.successWarningColor : type == ErrorTypes.WARNING ? Color.WarningColor.warningWarningColor : Color.WarningColor.failedWarningColor)
                .cornerRadius(CR.dlg10)
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color.DialogColor.dialogBackgorundOpacityColor
                    .ignoresSafeArea()
                    .onTapGesture {
                        if (isAnimate) {
                            withAnimation{
                                isErrorDialog = false
                            }
                        }
                    }
            )
        .customAppearAnimation2()
    }
}
