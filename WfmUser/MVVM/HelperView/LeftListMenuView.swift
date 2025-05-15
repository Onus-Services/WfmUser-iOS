//
//  LeftListMenuView.swift
//  WfmAdmin
//
//  Created by Mustafa Alper Aydin on 27.01.2025.
//

import SwiftUI

struct LeftListMenuView: View {
    
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var mainPageVM: MainPageViewModel
    @EnvironmentObject var homePageVM: HomePageViewModel
    
    @Binding var showMenu: Bool
    @Binding var pageType: Int
    
    //var user = SQLiteCommands.getUser() ?? LoginUser()
    var user = LoginUser()
    
    @State var currentLanguage: String = ""
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    ZStack {
                        Image(ImageConstants.leftListProfileBg.rawValue)
                            .resizable()
                            .frame(width: 75, height: 75)
                        
                        Image(ImageConstants.leftListProfile.rawValue)
                            .resizable()
                            .frame(width: 63, height: 60)
                            .offset(y: -5)
                    }
                    VStack {
                        Text("\(user.FirstName ?? "*") \(user.LastName ?? "*")")
                            .font(.custom(fontsBold, size: 18))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("\(user.UserName ?? "-")")
                            .font(.custom(fontsSemiBold, size: 14))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }.foregroundStyle(.white)
                        
                    
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .frame(height: 100)
                    .background(Color.NewColor.leftListMenuBg)
                
                VStack(alignment: .leading, spacing: screenWidth * 0.035) {
                    GenericMenuButton(showMenu: $showMenu, menuButtonIcon: ImageConstants.leftListHome.rawValue, menuButtonText: NSLocalizedString("LManasayfa", comment: "")) {
                        withAnimation {
                            mainPageVM.mainPageType = .anasayfa
                        }
                    }
                    
                    GenericMenuButton(showMenu: $showMenu, menuButtonIcon: ImageConstants.leftListHome.rawValue, menuButtonText: NSLocalizedString("LMhaftalik", comment: "")) {
                        withAnimation {
                            mainPageVM.mainPageType = .haftalikPlan
                        }
                    }
                    
                    GenericMenuButton(showMenu: $showMenu, menuButtonIcon: ImageConstants.leftListHome.rawValue, menuButtonText: NSLocalizedString("LMraporlar", comment: "")) {
                        withAnimation {
                            mainPageVM.mainPageType = .raporlar
                        }
                    }
                    
                    GenericMenuButton(showMenu: $showMenu, menuButtonIcon: ImageConstants.leftListHome.rawValue, menuButtonText: NSLocalizedString("LMaylik", comment: "")) {
                        withAnimation {
                            mainPageVM.mainPageType = .aylik
                        }
                    }
                    
                    GenericMenuButton(showMenu: $showMenu, menuButtonIcon: ImageConstants.leftListLogout.rawValue, menuButtonText: NSLocalizedString("LMcikisYap", comment: "")) {
                        withAnimation {
                            mainPageVM.isLogoutDialog = true
                            
                            /*appState.logout()
                            mainPageVM.mainPageType = MainPageTypes.anasayfa */
                        }
                    }
                    
                         
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        HStack {
                            Button(action: {
                                mainPageVM.isChangeLanguageInfoDialog = true
                            }, label: {
                                HStack {
                                    Image(ImageConstants.leftListTr.rawValue)
                                        .resizable()
                                        .frame(width: 28, height: 28)
                                    
                                    Text("TR")
                                        .font(.custom(fontsRegular, size: 20))
                                        .foregroundStyle(.black)
                                }.frame(width: 100, height: 40)
                                    .background(currentLanguage == "tr" ? .white : .clear)
                                    .cornerRadius(5)
                            })
                            
                            Button(action: {
                                mainPageVM.isChangeLanguageInfoDialog = true
                            }, label: {
                                HStack {
                                    Image(ImageConstants.leftListEng.rawValue)
                                        .resizable()
                                        .frame(width: 28, height: 28)
                                    
                                    Text("EN")
                                        .font(.custom(fontsRegular, size: 20))
                                        .foregroundStyle(.black)
                                }.frame(width: 100, height: 40)
                                    .background(currentLanguage == "en" ? .white : .clear)
                                    .cornerRadius(5)
                            })
                        }.padding(5)
                            .background(Color.NewColor.gray238)
                            .cornerRadius(5)
                        
                        Spacer()
                    }
                    
                    
                }.padding(.vertical, screenHeight * 0.02)
                    .padding(.leading, screenWidth * 0.07)
                
                HStack {
                    Image(ImageConstants.leftListFooterLogo.rawValue)
                        .resizable()
                        .frame(width: 70, height: 50)
                    VStack(alignment: .leading) {
                        Text("LMrotamenSaha")
                         
                        Text("©2002-\(String(Calendar.current.component(.year, from: Date())))")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                    }.font(Font.custom(fontsRegular, size: 8))
                        .foregroundColor(Color.white)
                        .padding(.leading, 10)
                        
                    
                }.padding(.horizontal, 10)
                .frame(maxWidth: .infinity, alignment: .leading)
                    .frame(height: 70)
                    .background(Color.NewColor.leftListMenuBg)
            }.frame(maxWidth: screenWidth * 0.85, maxHeight: .infinity)
                .background(.white)
                .clipShape(RoundedCorners(tr: 10, br: 10))
                .background(.gray.opacity(0.1))
                /*.background(
                ZStack{
                    Color.white
                    HStack{
                        Spacer()
                        Color.gray.opacity(0.2)
                            .frame(width: 2)
                            .frame(maxHeight: .infinity)
                    }.background(
                        Color.white
                            .shadow(color: Color.gray.opacity(0.2), radius: 0, x: 2, y: 0))
                    
                }.edgesIgnoringSafeArea(.all)
                ).padding(.trailing, screenWidth * 0.16) */
                
            
            Spacer()
            
        }.frame(maxWidth: .infinity)
            .background(
                Color.white
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.1)
                    .onTapGesture {
                        showMenu = false
                    }
            )
            .onAppear(perform: {
                self.currentLanguage = getCurrentLanguage()
            })
        
    }
}

struct LeftListMenuView_Previews: PreviewProvider {
    static var previews: some View {
        LeftListMenuView(showMenu: .constant(true), pageType: .constant(0)).environmentObject(AppState())
    }
}

struct GenericMenuButton: View {
    
    @Binding var showMenu: Bool
    var menuButtonIcon: String
    var menuButtonText: String
    var onTap: () -> Void
    
    var body: some View {
        Button {
            withAnimation {
                onTap()
                showMenu = false
            }
        } label: {
            HStack {
                if menuButtonIcon == "bell" {
                    Image(systemName: menuButtonIcon)
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.black)
                } else {
                    Image(menuButtonIcon)
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.black)
                }
                
                
                Text("\(menuButtonText)")
                    .font(Font.custom(fontsSemiBold, size: 14))
                    .foregroundColor(.black)
            }
        }

    }
}


struct LogoutDialogView: View {
    
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var mainPageVM: MainPageViewModel
    
    @State var isShowAnket: Bool = false
    
    var useFullScreenWrapper: Bool = true
    
    var body: some View {
        Group {
            if useFullScreenWrapper {
                ZStack {
                    contentView
                }
                .background(Color.white)
                    .customOverlayStyle(cornerRadius: CR.dlg10, lineColor: Color.DialogColor.dialogHeaderDarkBlue)
                    .padding(.horizontal, 10)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(
                        Color.DialogColor.dialogBackgorundOpacityColor
                            .ignoresSafeArea()
                            .onTapGesture {
                                withAnimation{
                                    mainPageVM.isLogoutDialog = false
                                }
                            }
                    )
                    .customAppearAnimation2()
                    .onAppear {
                        isShowAnket = preferences.bool(forKey: "logout_anket")
                    }
            } else {
                contentView
            }
        }
        
        
        /*ZStack {
            VStack(spacing: 0) {
                
                DialogHeaderCard(text: String(localized: "DialogCikis"), background: Color.DialogColor.dialogHeaderDarkBlue) {
                    mainPageVM.isLogoutDialog = false
                }
                
                VStack(spacing: 0) {
                    Text("CikisEminMisin")
                        .font(.custom(fontsRegular, size: 14))
                        .foregroundStyle(.black)
                        .padding(.vertical, 30)
                        .padding(.horizontal, 5)
                    
                    if !isShowAnket {
                        Text("Anket")
                        
                        Button {
                            withAnimation {
                                isShowAnket = true
                                preferences.set(true, forKey: "logout_anket")
                            }
                        } label: {
                            Text("Anketi tekrar gösterme göster")
                            
                        }
                    } else {
                        Button {
                            withAnimation {
                                isShowAnket = false
                                preferences.set(false, forKey: "logout_anket")
                            }
                        } label: {
                            Text("Anketi göster")
                            
                        }
                    }
                    
                    HStack(spacing: 10) {
                        Button {
                            withAnimation {
                                mainPageVM.isLogoutDialog = false
                            }
                        } label: {
                            Text("CikisKapat") //reddet - göster
                                .font(.custom(fontsMedium, size: 14))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 10)
                                .background(Color.WarningColor.successWarningColor)
                                .cornerRadius(CR.btn10)
                            
                        }
                        
                        Button {
                            withAnimation {
                                appState.logout()
                                mainPageVM.mainPageType = MainPageTypes.anasayfa
                                mainPageVM.isLogoutDialog = false
                            }
                        } label: {
                            Text("CikisCikis") //reddet - göster
                                .font(.custom(fontsMedium, size: 14))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 10)
                                .background(Color.WarningColor.warningWarningColor)
                                .cornerRadius(CR.btn10)
                               
                            
                        }
                        
                    }.padding(.horizontal, 20)
                        .padding(.vertical, 10)
                    
                }
                
            }.frame(maxWidth: screenHeight * 0.7)
        }.background(Color.white)
            .customOverlayStyle(cornerRadius: CR.dlg10, lineColor: Color.DialogColor.dialogHeaderDarkBlue)
            .padding(.horizontal, 10)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color.DialogColor.dialogBackgorundOpacityColor
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation{
                            mainPageVM.isLogoutDialog = false
                        }
                    }
            )
            .customAppearAnimation2()
            .onAppear {
                isShowAnket = preferences.bool(forKey: "logout_anket")
            } */
    }
    
    @ViewBuilder
    var contentView: some View {
        VStack(spacing: 0) {
            
            DialogHeaderCard(text: String(localized: "DialogCikis"), background: Color.DialogColor.dialogHeaderDarkBlue) {
                mainPageVM.isLogoutDialog = false
            }
            
            VStack(spacing: 0) {
                Text("CikisEminMisin")
                    .font(.custom(fontsRegular, size: 14))
                    .foregroundStyle(.black)
                    .padding(.vertical, 30)
                    .padding(.horizontal, 5)
                
                if !isShowAnket {
                    Text("Anket")
                    
                    Button {
                        withAnimation {
                            isShowAnket = true
                            preferences.set(true, forKey: "logout_anket")
                        }
                    } label: {
                        Text("Anketi tekrar gösterme göster")
                        
                    }
                } else {
                    Button {
                        withAnimation {
                            isShowAnket = false
                            preferences.set(false, forKey: "logout_anket")
                        }
                    } label: {
                        Text("Anketi göster")
                        
                    }
                }
                
                HStack(spacing: 10) {
                    Button {
                        withAnimation {
                            mainPageVM.isLogoutDialog = false
                        }
                    } label: {
                        Text("CikisKapat") //reddet - göster
                            .font(.custom(fontsMedium, size: 14))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 10)
                            .background(Color.WarningColor.successWarningColor)
                            .cornerRadius(CR.btn10)
                        
                    }
                    
                    Button {
                        withAnimation {
                            appState.logout()
                            mainPageVM.mainPageType = MainPageTypes.anasayfa
                            mainPageVM.isLogoutDialog = false
                        }
                    } label: {
                        Text("CikisCikis") //reddet - göster
                            .font(.custom(fontsMedium, size: 14))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 10)
                            .background(Color.WarningColor.warningWarningColor)
                            .cornerRadius(CR.btn10)
                           
                        
                    }
                    
                }.padding(.horizontal, 20)
                    .padding(.vertical, 10)
                
            }
            
        }.frame(maxWidth: screenHeight * 0.7)
    }
}
