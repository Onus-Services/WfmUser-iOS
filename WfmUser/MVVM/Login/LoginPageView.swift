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
            
            Image(ImageConstants.loginBackgroundImage.rawValue)
            
            VStack(spacing: 0) {
                
                VStack {
                    /*HStack {
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
                        .padding(.trailing, 20) */
                    HStack {
                        Spacer()
                        HStack(spacing: 5) {
                            languageButton(language: "TR", isSelected: currentLanguage == "tr")
                            languageButton(language: "EN", isSelected: currentLanguage == "en")
                        }
                        .padding(5)
                        .background(Color.white)
                        .cornerRadius(8)
                    }
                }.padding(.vertical, 5)
                
                ZStack {
                    
                    VStack{
                        Image(ImageConstants.rotamenLogo.rawValue)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        Text("LoginRotaPlanla")
                            .foregroundColor(.white)
                            .font(.custom(fontsMedium, size: 16))
                            .frame(maxWidth: .infinity)
                    }.frame(height: screenHeight * 0.1)
                        .padding()
                        .background(.white.opacity(0.3))
                        .customOverlayStyle(cornerRadius: 10, lineColor: .white)
                }//.frame(height: 150)
                
                VStack {
                    VStack {
                        Text("LoginHosGeldiniz")
                            .font(.custom(fontsBold, size: 20))
                            .foregroundColor(.black)
                        
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
                            Text("LoginBeniHatirla")
                                .font(Font.custom(fontsMedium, size: 12))
                                .foregroundColor(Color.black)
                            
                            Toggle(isOn: $loginPageVM.showGreeting) {
                                
                            }.labelsHidden()
                                .tint(Color.NewColor.primary1)
                            
                            Spacer()
                            Button(action: {
                                withAnimation {
                                    appState.pageType = 4
                                }
                            }, label: {
                                Text("LoginSifremiUnuttum")
                                    .foregroundStyle(.gray)
                                    .font(.custom(fontsSemiBold, size: 12))
                            })
                        }.padding(.horizontal, 5)
                        
                        HStack {
                            
                            
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
                                Text("LoginGiris")
                                    .fontWeight(.semibold)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.NewColor.primary1)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                        }
                    }.padding()
                        .background(.white)
                        .customOverlayStyle(cornerRadius: 10, lineColor: .gray)
                    Spacer()
                    Text("LoginRotamen")
                        .foregroundStyle(.white)
                        .font(.custom(fontsRegular, size: 10))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 20)
                    
                }.padding(.top, 100)
                
                
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
    
    private func languageButton(language: String, isSelected: Bool) -> some View {
        Button(action: {
            //currentLanguage = language.lowercased()
            loginPageVM.isChangeLanguageInfoDialog = true
        }) {
            HStack {
                Image(language == "TR" ? ImageConstants.leftListTr.rawValue : ImageConstants.leftListEng.rawValue)
                    .resizable()
                    .frame(width: 14, height: 14)
                Text(language)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(isSelected ? .white : .primary)
            }
            .frame(width: 50, height: 30)
            .background(isSelected ? Color.black : Color.clear)
            .cornerRadius(5)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(isSelected ? Color.white : Color.gray, lineWidth: 1)
            )
        }
    }
}

#Preview {
    LoginPageView()
    //LoginView()
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
                            .autocapitalization(.none)
                            .padding()
                    } else {
                        TextField("LPsifre", text: $text)
                            .autocapitalization(.none)
                            .padding()
                    }
                } else {
                    TextField("LPkullaniciAdi", text: $text)
                        .autocapitalization(.none)
                        .padding()
                }
                
                
            }.frame(height: 45)
            .padding(.horizontal, 5)
            .background(Color(.secondarySystemBackground))
            .customOverlayStyle(cornerRadius: 10, lineColor: .clear)
        }
    }
}
