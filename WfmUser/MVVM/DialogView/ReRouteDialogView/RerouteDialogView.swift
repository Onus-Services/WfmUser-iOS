//
//  RerouteDialogView.swift
//  Avansas-iOS
//
//  Created by Banu Ortac on 15.01.2024.
//

import SwiftUI

struct RerouteDialogView: View {
    
    @ObservedObject private var rerouteDialogVM = RerouteDialogViewModel()
    @EnvironmentObject var homePageVM: HomePageViewModel
    
    @State private var sortStepFirst: Bool = true
    
    @State private var lastSelectedStartPoint: Int?
    @State private var lastSelectedEndPoint: Int?
    
    var useFullScreenWrapper: Bool = true
    
    var body: some View {
        Group {
            if useFullScreenWrapper {
                ZStack {
                    contentView
                }
                .onAppear {
                    if [LecyStatus.startMission].contains(homePageVM.blockStatusId) {
                        sortStepFirst = false
                    } else {
                        if homePageVM.entryUpdate == 0 {
                            sortStepFirst = false
                        } else {
                            sortStepFirst = true
                        }
                    }
                    /*if [LecyStatus.startMission, LucyStatus.noNameStatus1, LucyStatus.noNameStatus2, LucyStatus.noNameStatus3, LucyStatus.noNameStatus4, LucyStatus.noNameStatus5, LucyStatus.noNameStatus6, LucyStatus.noNameStatus7, LucyStatus.noNameStatus8, LucyStatus.noNameStatus9, LucyStatus.noNameStatus10, LucyStatus.noNameStatus11, LucyStatus.noNameStatus12].contains(mainPageVM.blockStatusId) {
                        sortStepFirst = false
                    } else {
                        if mainPageVM.entryUpdate == 0 {
                            sortStepFirst = false
                        } else {
                            sortStepFirst = true
                        }
                    } */
                }
                .background(Color.white)
                .cornerRadius(CR.dlg10)
                .overlay(RoundedRectangle(cornerRadius: CR.dlg10)
                    .stroke(Color.DialogColor.dialogHeaderLightBlue, lineWidth: 1))
                .padding(.horizontal, 10)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    Color.DialogColor.dialogBackgorundOpacityColor
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation{
                                homePageVM.reRouteDialog.toggle()
                            }
                        }
                )
            } else {
                contentView
            }
        }
        
        /*ZStack{
            VStack{
                
                DialogHeaderCard(text: String(localized: "isListesiSiralama"), background: Color.DialogColor.dialogHeaderLightBlue) {
                    homePageVM.reRouteDialog.toggle()
                }
                
                if sortStepFirst {
                    Text("listeyiHazirlamakIcinTikla")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .font(.custom(fontsRegular, size: 16))
                    
                    HStack{
                        
                        Button(action: {
                            withAnimation{
                                
                            }
                        }){
                            HStack{
                                Text("close")
                                    .font(.custom(fontsRegular, size: 14))
                                    .foregroundColor(Color.white)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 10)
                            }
                        }.frame(width: 90)
                            .padding(1)
                            .background(LinearGradient(gradient: Gradient(colors: [Color.init(hex: "FF4B5C"), Color.init(hex: "C81D25")]), startPoint: .top, endPoint: .bottom))
                            .cornerRadius(CR.btn5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.DialogColor.reRouteListRed1, lineWidth: 1))
                        
                        
                        Button(action: {
                            homePageVM.entryRequestByMobile { result in
                                if result {
                                    //mainPageVM.getPlannedList{ result in }
                                    sortStepFirst = false
                                    homePageVM.entryUpdate = 0
                                }
                            }
                        }){
                            HStack{
                                Text("isListesiniHazirla")
                                    .font(.custom(fontsRegular, size: 14))
                                    .foregroundColor(Color.white)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 10)
                            }
                        }.frame(maxWidth: .infinity)
                            .padding(1)
                            .background(LinearGradient(gradient: Gradient(colors: [Color.init(hex: "FFC107"), Color.init(hex: "FF8C00")]), startPoint: .top, endPoint: .bottom))
                            .cornerRadius(CR.btn5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.DialogColor.reRouteListYellow1, lineWidth: 1))
                        
                    }.background(Color.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 5)
                        .padding(.bottom, 20)
                } else {
                    HStack{
                        Text("baslangicBitisSec")
                            .frame(maxWidth: .infinity, alignment: .center)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .font(.custom(fontsRegular, size: 16))
                    }
                    
                    if let result = rerouteDialogVM.getDataReroute(plannedList: homePageVM.personelDayRoutePointArray) as [String]? {
                        
                        HStack{
                            Text("baslangicYeri")
                                .font(.custom(fontsSemiBold, size: 16))
                                .padding(10)
                                .frame(width: 140, alignment: .leading)
                            
                            ZStack {
                                PickerTextField(data: result, placeholder: NSLocalizedString("seciniz", comment: ""), lastSelectedIndex: self.$lastSelectedStartPoint, doneClicked: {
                                    if lastSelectedStartPoint == lastSelectedEndPoint {
                                        homePageVM.showToast(message: String(localized: "ToastIkiNoktaAyni"))
                                        lastSelectedStartPoint = nil
                                    }
                                })
                                    .onChange(of: lastSelectedStartPoint) { _ in
                                        if lastSelectedStartPoint == lastSelectedEndPoint {
                                            homePageVM.showToast(message: String(localized: "ToastIkiNoktaAyni"))
                                        }
                                    }
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .frame(height: 30)
                                    .padding(.horizontal, 5)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color.gray, lineWidth: 1)
                                    )
                                
                                HStack {
                                    Spacer()
                                    Image(systemName: "arrowtriangle.down.fill")
                                        .resizable()
                                        .frame(width: 15, height: 10)
                                        .foregroundStyle(.gray)
                                }.padding(.trailing, 5)
                            }
                            
                                
                        }.background(Color.white)
                            .padding(.horizontal, 10)
                        
                        HStack{
                            Text("bitisYeri")
                                .font(.custom(fontsSemiBold, size: 16))
                                .padding(10)
                                .frame(width: 140, alignment: .leading)
                            ZStack {
                                PickerTextField(data: result, placeholder: NSLocalizedString("seciniz", comment: ""), lastSelectedIndex: self.$lastSelectedEndPoint, doneClicked: {
                                    if lastSelectedStartPoint == lastSelectedEndPoint {
                                        homePageVM.showToast(message: String(localized: "ToastIkiNoktaAyni"))
                                        lastSelectedEndPoint = nil
                                    }
                                })
                                    .onChange(of: lastSelectedEndPoint) { _ in
                                        if lastSelectedStartPoint == lastSelectedEndPoint {
                                            homePageVM.showToast(message: String(localized: "ToastIkiNoktaAyni"))
                                        }
                                    }
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .frame(height: 30)
                                    .padding(.horizontal, 5)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color.gray, lineWidth: 1)
                                    )
                                
                                HStack {
                                    Spacer()
                                    Image(systemName: "arrowtriangle.down.fill")
                                        .resizable()
                                        .frame(width: 15, height: 10)
                                        .foregroundStyle(.gray)
                                }.padding(.trailing, 5)
                            }
                            
                        }.background(Color.white)
                            .padding(.horizontal, 10)
                        
                        HStack{
                            
                            
                            Button(action: {
                                withAnimation{
                                    if lastSelectedEndPoint != nil || lastSelectedStartPoint != nil {
                                        lastSelectedEndPoint = nil
                                        lastSelectedStartPoint = nil
                                    } else {
                                        homePageVM.reRouteDialog.toggle()
                                    }
                                }
                            }){
                                HStack{
                                    Text(lastSelectedEndPoint != nil || lastSelectedStartPoint != nil ? "\(String(localized: "reset"))" : "\(String(localized: "close"))")
                                        .font(.custom(fontsRegular, size: 14))
                                        .foregroundColor(Color.white)
                                        .padding(.vertical, 10)
                                        .padding(.horizontal, 10)
                                }
                            }.frame(width: 90)
                                .padding(1)
                                .background(LinearGradient(gradient: Gradient(colors: [Color.init(hex: "FF4B5C"), Color.init(hex: "C81D25")]), startPoint: .top, endPoint: .bottom))
                                .cornerRadius(CR.btn5)
                                .overlay(RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.DialogColor.reRouteListRed1, lineWidth: 1))
                                
                            Button(action: {
                                if lastSelectedStartPoint == lastSelectedEndPoint {
                                    homePageVM.showToast(message: String(localized: "ToastIkiNoktaAyni"))
                                } else {
                                    homePageVM.setReRoute(lastSelectedStartPoint: lastSelectedStartPoint ?? -1, lastSelectedEndPoint: lastSelectedEndPoint ?? -1, dataHash: rerouteDialogVM.dataHash)
                                    homePageVM.reRouteDialog.toggle()
                                }
                            }){
                                HStack{
                                    Text("isListesiniSirala")
                                        .font(.custom(fontsRegular, size: 14))
                                        .foregroundColor(Color.white)
                                        .padding(.vertical, 10)
                                        .padding(.horizontal, 10)
                                }
                            }.frame(maxWidth: .infinity)
                                .padding(1)
                                .background(LinearGradient(gradient: Gradient(colors: [Color.init(hex: "28A745"), Color.init(hex: "196F3D")]), startPoint: .top, endPoint: .bottom))
                                .cornerRadius(CR.btn5)
                                .overlay(RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.DialogColor.reRouteListGreen1, lineWidth: 1))
                            
                        }.background(Color.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 5)
                            .padding(.bottom, 20)
                    }
                }
            }.cornerRadius(CR.btn10)
        }.onAppear {
            if [LecyStatus.startMission].contains(homePageVM.blockStatusId) {
                sortStepFirst = false
            } else {
                if homePageVM.entryUpdate == 0 {
                    sortStepFirst = false
                } else {
                    sortStepFirst = true
                }
            }
            /*if [LecyStatus.startMission, LucyStatus.noNameStatus1, LucyStatus.noNameStatus2, LucyStatus.noNameStatus3, LucyStatus.noNameStatus4, LucyStatus.noNameStatus5, LucyStatus.noNameStatus6, LucyStatus.noNameStatus7, LucyStatus.noNameStatus8, LucyStatus.noNameStatus9, LucyStatus.noNameStatus10, LucyStatus.noNameStatus11, LucyStatus.noNameStatus12].contains(mainPageVM.blockStatusId) {
                sortStepFirst = false
            } else {
                if mainPageVM.entryUpdate == 0 {
                    sortStepFirst = false
                } else {
                    sortStepFirst = true
                }
            } */
        }
        .background(Color.white)
        .cornerRadius(CR.dlg10)
        .overlay(RoundedRectangle(cornerRadius: CR.dlg10)
            .stroke(Color.DialogColor.dialogHeaderLightBlue, lineWidth: 1))
        .padding(.horizontal, 10)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color.DialogColor.dialogBackgorundOpacityColor
                .ignoresSafeArea()
                .onTapGesture {
                    withAnimation{
                        homePageVM.reRouteDialog.toggle()
                    }
                }
        )
        .customAppearAnimation2() */
    }
    
    @ViewBuilder
    var contentView: some View {
        VStack{
            
            DialogHeaderCard(text: String(localized: "isListesiSiralama"), background: Color.DialogColor.dialogHeaderLightBlue) {
                homePageVM.reRouteDialog.toggle()
            }
            
            if sortStepFirst {
                Text("listeyiHazirlamakIcinTikla")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .font(.custom(fontsRegular, size: 16))
                
                HStack{
                    
                    Button(action: {
                        withAnimation{
                            
                        }
                    }){
                        HStack{
                            Text("close")
                                .font(.custom(fontsRegular, size: 14))
                                .foregroundColor(Color.white)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 10)
                        }
                    }.frame(width: 90)
                        .padding(1)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.init(hex: "FF4B5C"), Color.init(hex: "C81D25")]), startPoint: .top, endPoint: .bottom))
                        .cornerRadius(CR.btn5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.DialogColor.reRouteListRed1, lineWidth: 1))
                    
                    
                    Button(action: {
                        homePageVM.entryRequestByMobile { result in
                            if result {
                                //mainPageVM.getPlannedList{ result in }
                                sortStepFirst = false
                                homePageVM.entryUpdate = 0
                            }
                        }
                    }){
                        HStack{
                            Text("isListesiniHazirla")
                                .font(.custom(fontsRegular, size: 14))
                                .foregroundColor(Color.white)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 10)
                        }
                    }.frame(maxWidth: .infinity)
                        .padding(1)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.init(hex: "FFC107"), Color.init(hex: "FF8C00")]), startPoint: .top, endPoint: .bottom))
                        .cornerRadius(CR.btn5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.DialogColor.reRouteListYellow1, lineWidth: 1))
                    
                }.background(Color.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .padding(.bottom, 20)
            } else {
                HStack{
                    Text("baslangicBitisSec")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .font(.custom(fontsRegular, size: 16))
                }
                
                if let result = rerouteDialogVM.getDataReroute(plannedList: homePageVM.personelDayRoutePointArray) as [String]? {
                    
                    HStack{
                        Text("baslangicYeri")
                            .font(.custom(fontsSemiBold, size: 16))
                            .padding(10)
                            .frame(width: 140, alignment: .leading)
                        
                        ZStack {
                            PickerTextField(data: result, placeholder: NSLocalizedString("seciniz", comment: ""), lastSelectedIndex: self.$lastSelectedStartPoint, doneClicked: {
                                if lastSelectedStartPoint == lastSelectedEndPoint {
                                    homePageVM.showToast(message: String(localized: "ToastIkiNoktaAyni"))
                                    lastSelectedStartPoint = nil
                                }
                            })
                                .onChange(of: lastSelectedStartPoint) { _ in
                                    if lastSelectedStartPoint == lastSelectedEndPoint {
                                        homePageVM.showToast(message: String(localized: "ToastIkiNoktaAyni"))
                                    }
                                }
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .frame(height: 30)
                                .padding(.horizontal, 5)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                            
                            HStack {
                                Spacer()
                                Image(systemName: "arrowtriangle.down.fill")
                                    .resizable()
                                    .frame(width: 15, height: 10)
                                    .foregroundStyle(.gray)
                            }.padding(.trailing, 5)
                        }
                        
                            
                    }.background(Color.white)
                        .padding(.horizontal, 10)
                    
                    HStack{
                        Text("bitisYeri")
                            .font(.custom(fontsSemiBold, size: 16))
                            .padding(10)
                            .frame(width: 140, alignment: .leading)
                        ZStack {
                            PickerTextField(data: result, placeholder: NSLocalizedString("seciniz", comment: ""), lastSelectedIndex: self.$lastSelectedEndPoint, doneClicked: {
                                if lastSelectedStartPoint == lastSelectedEndPoint {
                                    homePageVM.showToast(message: String(localized: "ToastIkiNoktaAyni"))
                                    lastSelectedEndPoint = nil
                                }
                            })
                                .onChange(of: lastSelectedEndPoint) { _ in
                                    if lastSelectedStartPoint == lastSelectedEndPoint {
                                        homePageVM.showToast(message: String(localized: "ToastIkiNoktaAyni"))
                                    }
                                }
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .frame(height: 30)
                                .padding(.horizontal, 5)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                            
                            HStack {
                                Spacer()
                                Image(systemName: "arrowtriangle.down.fill")
                                    .resizable()
                                    .frame(width: 15, height: 10)
                                    .foregroundStyle(.gray)
                            }.padding(.trailing, 5)
                        }
                        
                    }.background(Color.white)
                        .padding(.horizontal, 10)
                    
                    HStack{
                        
                        
                        Button(action: {
                            withAnimation{
                                if lastSelectedEndPoint != nil || lastSelectedStartPoint != nil {
                                    lastSelectedEndPoint = nil
                                    lastSelectedStartPoint = nil
                                } else {
                                    homePageVM.reRouteDialog.toggle()
                                }
                            }
                        }){
                            HStack{
                                Text(lastSelectedEndPoint != nil || lastSelectedStartPoint != nil ? "\(String(localized: "reset"))" : "\(String(localized: "close"))")
                                    .font(.custom(fontsRegular, size: 14))
                                    .foregroundColor(Color.white)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 10)
                            }
                        }.frame(width: 90)
                            .padding(1)
                            .background(LinearGradient(gradient: Gradient(colors: [Color.init(hex: "FF4B5C"), Color.init(hex: "C81D25")]), startPoint: .top, endPoint: .bottom))
                            .cornerRadius(CR.btn5)
                            .overlay(RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.DialogColor.reRouteListRed1, lineWidth: 1))
                            
                        Button(action: {
                            if lastSelectedStartPoint == lastSelectedEndPoint {
                                homePageVM.showToast(message: String(localized: "ToastIkiNoktaAyni"))
                            } else {
                                homePageVM.setReRoute(lastSelectedStartPoint: lastSelectedStartPoint ?? -1, lastSelectedEndPoint: lastSelectedEndPoint ?? -1, dataHash: rerouteDialogVM.dataHash)
                                homePageVM.reRouteDialog.toggle()
                            }
                        }){
                            HStack{
                                Text("isListesiniSirala")
                                    .font(.custom(fontsRegular, size: 14))
                                    .foregroundColor(Color.white)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 10)
                            }
                        }.frame(maxWidth: .infinity)
                            .padding(1)
                            .background(LinearGradient(gradient: Gradient(colors: [Color.init(hex: "28A745"), Color.init(hex: "196F3D")]), startPoint: .top, endPoint: .bottom))
                            .cornerRadius(CR.btn5)
                            .overlay(RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.DialogColor.reRouteListGreen1, lineWidth: 1))
                        
                    }.background(Color.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 5)
                        .padding(.bottom, 20)
                }
            }
        }.cornerRadius(CR.btn10)
    }
}

struct RerouteDialogView_Previews: PreviewProvider {
    static var previews: some View {
        RerouteDialogView()
    }
}
