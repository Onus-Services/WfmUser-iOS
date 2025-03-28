//
//  ForgotPasswordPageView.swift
//  WfmUser
//
//  Created by Mustafa Alper Aydin on 19.03.2025.
//

import SwiftUI

struct ForgotPasswordPageView: View {
    
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var forgotPageVM: ForgotPasswordPageViewModel
    @State private var isShowPass: Bool = true
    @State private var isShowPassRepeat: Bool = true
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea(edges: .all)
            
            if appState.forgotPassNewPass {
                
                VStack {
                    
                    ZStack {
                        CustomInputView(text: $forgotPageVM.password, isPass: true, isSecure: isShowPass)
                        
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
                    
                    ZStack {
                        CustomInputView(text: $forgotPageVM.passwordRepeat, isPass: true, isSecure: isShowPassRepeat)
                        
                        HStack {
                            Spacer()
                            Button {
                                isShowPassRepeat.toggle()
                            } label: {
                                Image(systemName: !isShowPassRepeat ? "eye.circle.fill" : "eye.slash.circle.fill")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.gray.opacity(0.3))
                            }

                        }.padding(.horizontal, 5)
                    }
                    
                    Button {
                        withAnimation {
                            forgotPageVM.getNewPass(password: forgotPageVM.password, passwordRepeat: forgotPageVM.passwordRepeat) { r in
                                if r {
                                    appState.pageType = 0
                                }
                            }
                        }
                    } label: {
                        Text("ForgotPassPSifreyiYenile")
                            .font(.custom(fontsSemiBold, size: 15))
                            .padding(.horizontal, 10)
                            .padding(.vertical, 20)
                            .foregroundColor(.white)
                            .background(Color.NewColor.primary1)
                            .cornerRadius(CR.btn5)
                    }
                }.padding(.horizontal, 5)
                
            } else {
                VStack {
                    CustomInputView(text: $forgotPageVM.userName)
                    
                    Button {
                        withAnimation {
                            forgotPageVM.usernameControll(username: forgotPageVM.userName) { r in
                                if r {
                                    appState.forgotPassPage = true
                                    appState.goSmsVerificationPage()
                                }
                            }
                        }
                    } label: {
                        Text("ForgotPassDogrulama")
                            .font(.custom(fontsSemiBold, size: 15))
                            .padding(.horizontal, 10)
                            .padding(.vertical, 20)
                            .foregroundColor(.white)
                            .background(Color.NewColor.primary1)
                            .cornerRadius(CR.btn5)
                    }

                }.padding(.horizontal, 5)
            }
            
            if forgotPageVM.showAlert {
                ErrorDialogView(isErrorDialog: $forgotPageVM.showAlert, isAnimate: .constant(false), type: forgotPageVM.errorType, text: forgotPageVM.error, errorCode: forgotPageVM.errorCode)
                    .customAppearAnimation2()
            }
            
            
            
        }
    }
}

#Preview {
    ForgotPasswordPageView().environmentObject(AppState()).environmentObject(ForgotPasswordPageViewModel())
}
