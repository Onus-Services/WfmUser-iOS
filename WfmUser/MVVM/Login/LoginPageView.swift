//
//  LoginPageView.swift
//  WfmAdmin
//
//  Created by Mustafa Alper Aydin on 27.01.2025.
//

import SwiftUI

struct LoginPageView: View {
    
    @EnvironmentObject var appState: AppState
    @StateObject var loginPageVM: LoginPageViewModel = LoginPageViewModel()
    @EnvironmentObject var mainPageVM: MainPageViewModel
    @State private var isShowPass: Bool = true
    
    @State var currentLanguage: String = ""
    var body: some View {
        ZStack {
            VStack {
                
                ZStack {
                    Image(ImageConstants.rxAdminLogo1.rawValue)
                        .resizable()
                        .frame(width: 200, height: 100)
                    
                    VStack {
                        HStack {
                            Spacer()
                            HStack {
                                Button(action: {
                                    loginPageVM.isChangeLanguageInfoDialog = true
                                }, label: {
                                    HStack {
                                        Image(ImageConstants.leftListTr.rawValue)
                                            .resizable()
                                            .frame(width: 14, height: 14)
                                        
                                        Text("TR")
                                            .font(.custom(fontsRegular, size: 14))
                                            .foregroundStyle(.black)
                                    }.frame(width: 50, height: 20)
                                        .background(currentLanguage == "tr" ? .white : .clear)
                                        .cornerRadius(5)
                                })
                                
                                Button(action: {
                                    loginPageVM.isChangeLanguageInfoDialog = true
                                }, label: {
                                    HStack {
                                        Image(ImageConstants.leftListEng.rawValue)
                                            .resizable()
                                            .frame(width: 14, height: 14)
                                        
                                        Text("EN")
                                            .font(.custom(fontsRegular, size: 14))
                                            .foregroundStyle(.black)
                                    }.frame(width: 50, height: 20)
                                        .background(currentLanguage == "en" ? .white : .clear)
                                        .cornerRadius(5)
                                })
                            }.padding(5)
                                .background(Color.NewColor.gray238)
                                .cornerRadius(5)
                        }.padding(.top, 10)
                            .padding(.trailing, 20)
                        
                        Spacer()
                    }
                    
                        
                }.frame(height: 150)
                
                
                CustomInputView(text: $loginPageVM.userName, isSecure: false)
                
                ZStack {
                    CustomInputView(text: $loginPageVM.password, isPass: true, isSecure: isShowPass)
                    
                    HStack {
                        Spacer()
                        Button {
                            isShowPass.toggle()
                        } label: {
                            Image(systemName: !isShowPass ? "eye.circle.fill" : "eye.slash.circle.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.gray.opacity(0.3))
                        }

                    }.padding(.horizontal, 5)
                }
                
                HStack {
                    Spacer()
                    Button(action: {
                        withAnimation {
                            appState.pageType = 4
                        }
                    }, label: {
                        Text("Şifremi Unuttum")
                            .foregroundStyle(.gray)
                            .font(.custom(fontsSemiBold, size: 14))
                    })
                }.padding(.horizontal, 5)
                
                HStack {
                    Text("LPbenihatirla")
                        .font(Font.custom(fontsMedium, size: 14))
                        .foregroundColor(Color.black)
                        .padding(.leading, 20)
                    
                    Toggle(isOn: $loginPageVM.showGreeting) {
                        
                    }.labelsHidden()
                        .tint(Color.NewColor.primary1)
                    
                    Spacer()
                    Button {
                        loginPageVM.getLogin(username: loginPageVM.userName, password: loginPageVM.password) { result in
                            if result {
                                if loginPageVM.showGreeting {
                                    preferences.set(loginPageVM.showGreeting, forKey: "showGreeting")
                                    preferences.set(loginPageVM.userName, forKey: "userName")
                                    preferences.set(loginPageVM.password, forKey: "userPassword")
                                } else {
                                    preferences.set(loginPageVM.showGreeting, forKey: "showGreeting")
                                    preferences.set(loginPageVM.userName, forKey: "userName")
                                    preferences.set(loginPageVM.password, forKey: "userPassword")
                                }
                                appState.goSmsVerificationPage()
                                //appState.successLogin()
                                mainPageVM.mainPageType = MainPageTypes.anasayfa
                            }
                        }
                        hideKeyboard()
                    } label: {
                        Text("LPgiris")
                            .font(.custom(fontsSemiBold, size: 15))
                            .frame(width: 100, height: 50)
                            .foregroundColor(.white)
                            .background(Color.NewColor.primary1)
                            .cornerRadius(CR.btn5)
                    }
                }
                
                Spacer()
            }.padding(.top, screenHeight * 0.1)
                .padding(.horizontal, 20)
            
            if loginPageVM.showAlert {
                ErrorDialogView(isErrorDialog: $loginPageVM.showAlert, isAnimate: .constant(false), type: loginPageVM.errorType, text: loginPageVM.error, errorCode: loginPageVM.errorCode)
                    .customAppearAnimation2()
            }
            
            if loginPageVM.isChangeLanguageInfoDialog {
                ChangeLanguageInfoDialog(isChangeLanguageInfoDialog: $loginPageVM.isChangeLanguageInfoDialog)
            }
            
            if loginPageVM.isLoading {
                LoadingDialogView()
            }
            
        }
        .background(
            ZStack(alignment: Alignment(horizontal: .center, vertical: .top)){
                
                VStack{
                    Image(ImageConstants.loginBackground.rawValue)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        )
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            self.currentLanguage = getCurrentLanguage()
            loginPageVM.showGreeting = preferences.bool(forKey: "showGreeting")
            if loginPageVM.showGreeting {
                loginPageVM.userName = preferences.string(forKey: "userName") ?? ""
                loginPageVM.password = preferences.string(forKey: "userPassword") ?? ""
            }
        }
    }
}

#Preview {
    LoginPageView()
}

struct CustomInputView: View {
    @Binding var text: String
    var isPass: Bool = false
    var isSecure: Bool = false

    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Image(systemName: isPass ? "lock" : "person")
                    .foregroundColor(.gray)
                    .padding(.leading, 8)
                
                if isPass {
                    if isSecure {
                        SecureField("LPsifre", text: $text)
                    } else {
                        TextField("LPsifre", text: $text)
                    }
                } else {
                    TextField("LPkullaniciAdi", text: $text)
                }
                
                
            }.frame(height: 45)
            .padding(.horizontal, 5)
            .background(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 2))
        }
    }
}
