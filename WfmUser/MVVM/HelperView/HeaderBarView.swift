//
//  HeaderBarView.swift
//  WfmAdmin
//
//  Created by Mustafa Alper Aydin on 27.01.2025.
//

import SwiftUI

struct HeaderBarView: View {
    @Binding var showMenu: Bool
    @EnvironmentObject var mainPageVM: MainPageViewModel
    
    //var user = SQLiteCommands.getUser() ?? LoginUser()
    
    var body: some View {
        HStack {
            
            HeaderCustomButton(icon: ImageConstants.headerMenuNew.rawValue) {
                showMenu = true
            }.environmentObject(mainPageVM)
            
            VStack {
                switch mainPageVM.mainPageType {
                case .anasayfa:
                    HeaderCustomText(content: "\(String(localized: "Anasayfa"))")
                case .haftalikPlan:
                    HeaderCustomText(content: "\(String(localized: "HaftalıkPlan"))")
                case .raporlar:
                    HeaderCustomText(content: "\(String(localized: "Raporlar"))")
                case .aylik:
                    HeaderCustomText(content: "\(String(localized: "AylıkPlan"))")
                }
                
                /*if [MainPageTypes.anasayfa, MainPageTypes.anasayfaHarita, MainPageTypes.liste, MainPageTypes.listeBolge, MainPageTypes.listeArac, MainPageTypes.uyariMesajlar, MainPageTypes.listeUyariMesajlar, MainPageTypes.durumMesajlar].contains(mainPageVM.mainPageType) {
                    switch mainPageVM.globalSelectedDateType {
                    case .today:
                        HeaderCustomText1(content: "\(String(localized: "HBBugününToplam"))")
                    case .tomorrow:
                        HeaderCustomText1(content: "\(String(localized: "HBDününToplam"))")
                    case .lastWeek:
                        HeaderCustomText1(content: "\(String(localized: "HBGecenHaftani"))")
                    case .customDate:
                        HeaderCustomText1(content: "\(mainPageVM.gloablSelectedFirstDate.dayMonthFormat) - \(mainPageVM.globalSelectedSecondDate.dayMonthFormat) \(String(localized: "HBTarihleriRaporlari"))")
                    case .lastMount:
                        HeaderCustomText1(content: "\(String(localized: "HBGecenAyin"))")
                    case .threeMount:
                        HeaderCustomText1(content: "\(String(localized: "HBSon3Ayin"))")
                    }
                } else {
                    HeaderCustomText1(content: "")
                } */
            }
            
            Image(ImageConstants.infoRotamen.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .padding(.trailing, 5)
            
            
            /*HeaderCustomButton(icon: ImageConstants.leftListBell.rawValue, type: 1) {
                mainPageVM.mainPageType = .showNotification
            }.environmentObject(mainPageVM) */
            
        }.padding(.vertical, 15)
            .background(Color.white)
            .clipShape(RoundedCorners(bl: 5, br: 5))
            .shadow(color: .gray, radius: 2, x: 0, y: 2)
            
    }
}

#Preview {
    HeaderCustomButton(icon: ImageConstants.leftListBell.rawValue, type: 1, onTap: {
        
    })
}

private struct HeaderCustomText: View {
    var content: String
    
    var body: some View {
        Text(content)
            .font(Font.custom(fontsSemiBold, size: 16))
            .foregroundColor(Color.black)
            .frame(maxWidth: .infinity, alignment: .center)
    }
}

private struct HeaderCustomText1: View {
    var content: String
    
    var body: some View {
        Text(content)
            .font(Font.custom(fontsRegular, size: 12))
            .foregroundColor(Color.black)
            .frame(maxWidth: .infinity, alignment: .center)
    }
}

private struct HeaderCustomButton: View {
    
    @EnvironmentObject var mainPageVM: MainPageViewModel
    var icon: String
    var type: Int = 0
    var onTap: () -> Void
    
    var body: some View {
        Button {
            withAnimation {
                onTap()
            }
        } label: {
            ZStack {
                Circle()
                    .frame(width: 35, height: 35)
                    .foregroundStyle(Color.NewColor.primary1)
                    .opacity(type == 1 ? 1.0 : 0.0)
                
                Image(icon)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 10)
                
                if type == 1 {
                    
                    ZStack {
                        Circle()
                            .frame(width: 18, height: 18)
                            .foregroundStyle(.red)
                        //Text("\(mainPageVM.isNotfCount)")
                        Text("")
                            .foregroundStyle(.white)
                            .font(.custom(fontsRegular, size: 10))
                    }.offset(x: 12, y: -14)
                        //.opacity(mainPageVM.isNotfCount < 1 ? 0.0 : 1.0)
                }
            }.padding(.trailing, type == 1 ? 5 : 0)
                
        }
    }
}
