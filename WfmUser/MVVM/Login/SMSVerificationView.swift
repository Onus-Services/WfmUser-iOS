//
//  SMSVerificationView.swift
//  WfmAdmin
//
//  Created by Mustafa Alper Aydin on 28.01.2025.
//

import SwiftUI
import SwiftUIIntrospect

struct SMSVerificationView: View {
    
    @EnvironmentObject var appState: AppState
    
    @StateObject var smsVerificationPageVM: SMSVerificationPageViewModel = SMSVerificationPageViewModel()
    @StateObject var otpVerificationVM = OTPVerificationViewModel()
    @State var isFocused = false
    
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var second: Int = 30
    
    let calendar = Calendar.current
    @State private var lastDate: Date = Date()
    
    var countryCode: String
    var phoneNumber: String
    
    let wellcomeText:LocalizedStringKey = "welcomeUpperCase"
    let topHeaderText:LocalizedStringKey = "phoneNumberValidation"
    let bottomHeaderText:LocalizedStringKey = "enterSmsCode"
    let infoText:LocalizedStringKey = "smsCodeEnterInfo"
    let info2Text:LocalizedStringKey = "notGotSmsCode"
    let codeInfoText:LocalizedStringKey = "sendSmsCodeAgain"
    let codeInfo2Text:LocalizedStringKey = "second"
    
    let smspDidntCode:LocalizedStringKey = "notGotSmsCode"
    
    let textBoxWidth = UIScreen.main.bounds.width / 6
    let textBoxHeight = UIScreen.main.bounds.width / 6
    let spaceBetweenBoxes: CGFloat = 20
    let paddingOfBox: CGFloat = 1
    var textFieldOriginalWidth: CGFloat {
        (textBoxWidth*4)+(spaceBetweenBoxes*3)+((paddingOfBox*2)*3)
    }
    
    var pageType: Int
    
    var body: some View {
        ZStack{
            
            GeometryReader { geo in
                VStack{
                    
                    Button(action: {
                        withAnimation{
                            //appState.pageType = PageTypes.login
                        }
                        
                    }){
                        HStack{
                            Image("xmark.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 16, height: 14)
                            
                            Text(wellcomeText)
                                .font(Font.custom(fontsBold, size: 14))
                                .foregroundColor(Color.white)
                            
                        }
                    }.frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, UIScreen.main.bounds.width * 0.072)
                        .padding(.top, UIScreen.main.bounds.height * 0.05)
                        .opacity(0.0)
                   
                    
                    VStack{
                        Text(topHeaderText)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(Font.custom(fontsRegular, size: 14))
                            .foregroundColor(Color.MyColor.colorBlack)
                            
                        Text(bottomHeaderText)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(Font.custom(fontsBold, size: 24))
                            .foregroundColor(Color.MyColor.colorBlack)
                        
                    }.frame(maxWidth: .infinity)
                        .padding(.horizontal, UIScreen.main.bounds.width * 0.053)
                        .padding(.top, UIScreen.main.bounds.height * 0.23)
                    
                    (Text(infoText)
                        .font(Font.custom(fontsRegular, size: 14))
                        .foregroundColor(Color.MyColor.colorBlack)
                     +
                     Text(String("\(countryCode) \(phoneNumber). "))
                        .font(Font.custom(fontsRegular, size: 14))
                        .foregroundColor(Color.MyColor.colorBlack)
                     /*+
                     Text(info2Text)
                        .font(Font.custom(fontsBold, size: 14))
                        .foregroundColor(Color.MyColor.colorGreen)*/
                    ).frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, UIScreen.main.bounds.width * 0.053)
                        .padding(.top, UIScreen.main.bounds.height * 0.002)
                    
                    
                    HStack{
                        VStack {
                            
                            ZStack {
                                
                                HStack (spacing: spaceBetweenBoxes){
                                    
                                    otpText(text: otpVerificationVM.otp1)
                                    otpText(text: otpVerificationVM.otp2)
                                    otpText(text: otpVerificationVM.otp3)
                                    otpText(text: otpVerificationVM.otp4)
                                }
                                
                                
                                TextField("", text: $otpVerificationVM.otpField)
                                    .frame(width: isFocused ? 0 : textFieldOriginalWidth, height: textBoxHeight)
                                    .disabled(otpVerificationVM.isTextFieldDisabled)
                                    .textContentType(.oneTimeCode)
                                    .foregroundColor(.clear)
                                    .accentColor(.clear)
                                    .background(Color.clear)
                                    .keyboardType(.numberPad)
                                    /*.introspectTextField { textField in
                                        textField.becomeFirstResponder()
                                    } */
                                 
                                
                            }
                            
                        }
                    }.padding(.top, UIScreen.main.bounds.height * 0.03)
                        .padding(.bottom, 20)
                    
                    
                    
                    HStack{
                        VStack {
                            Text(smspDidntCode)
                                .font(Font.custom(fontsSemiBold, size: 12))
                                .foregroundColor(Color.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            if second > 0{
                                (Text(codeInfoText)
                                    .font(Font.custom(fontsRegular, size: 12))
                                    .foregroundColor(Color.MyColor.colorGray2)
                                 +
                                 Text(String("\(second)"))
                                    .font(Font.custom(fontsBold, size: 12))
                                    .foregroundColor(Color.MyColor.colorGreen)
                                 +
                                 Text(codeInfo2Text)
                                    .font(Font.custom(fontsBold, size: 12))
                                    .foregroundColor(Color.MyColor.colorGreen)
                                ).frame(maxWidth: .infinity, alignment: .leading)
                            }else{
                                Button(action: {
                                    //kod yeniden gönderme apisine git
                                    smsVerificationPageVM.sendCode(mobileNo: String("\(countryCode)\(phoneNumber.filter("0123456789".contains))"), activationKod: -1, operationType: 2, resultHandler: {result in
                                        if result > 0{
                                            if let date = calendar.date(byAdding: .second, value: 32, to: Date()){
                                                lastDate = date
                                                timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                                                //self.timer.upstream.connect()
                                            }
                                        }
                                        
                                    })
                                    
                                }){
                                    Text(codeInfoText)
                                        .font(Font.custom(fontsRegular, size: 12))
                                        .foregroundColor(second > 0 ? Color.MyColor.colorGray2 : Color.MyColor.colorGreen)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                            }
                        }
                        
                        
                        
                        Spacer()
                        
                        if otpVerificationVM.otpField.count == 4{
                            
                            Button(action: {
                                //api çağıralacak
                                if Int(otpVerificationVM.otpField) == 1111 {
                                    if appState.forgotPassPage {
                                        appState.forgotPassNewPass = true
                                        appState.pageType = 4
                                    } else {
                                        appState.successLogin()
                                    }
                                    
                                } else {
                                    print("HATAHATA")
                                }
                                /*if pageType == 1 {
                                    smsVerificationPageVM.sendCode(mobileNo: String("\(countryCode)\(phoneNumber.filter("0123456789".contains))"), activationKod: Int(otpVerificationVM.otpField) ?? 0000, operationType: 3, resultHandler: {result in
                                        print("BBBBBBBB - \(result)")
                                        if result > 0{
                                            
                                            //appState.phoneNumber = phoneNumber.filter("0123456789".contains)
                                            withAnimation {
                                                //appState.pageType = PageTypes.userInfo
                                            }
                                            second = 0
                                            self.timer.upstream.connect().cancel()
                                        }
                                        
                                    })
                                   
                                } else if pageType == 2 {
                                    smsVerificationPageVM.sendCode(mobileNo: String("\(countryCode)\(phoneNumber.filter("0123456789".contains))"), activationKod: Int(otpVerificationVM.otpField) ?? 0000, operationType: 7, resultHandler: {result in
                                        
                                        if result > 0{
                                            second = 0
                                            self.timer.upstream.connect().cancel()
                                            //appState.phoneNumber = phoneNumber.filter("0123456789".contains)
                                            withAnimation {
                                                //appState.pageType = PageTypes.newPassword
                                            }
                                        }
                                    })
                                } */
                                
                            }){
                                Image(systemName: "checkmark.circle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: UIScreen.main.bounds.width * 0.06)
                                    .padding(UIScreen.main.bounds.width * 0.06)
                                    .background(
                                        Color.MyColor.buttonColor
                                            .cornerRadius(UIScreen.main.bounds.width * (0.06 + 0.06))
                                            .shadow(color: Color.MyColor.buttonShadowColor, radius: 6, x: 0, y: 5)
                                            
                                    )
                            }
                            
                            
                        }else{
                            Image("xmark.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: UIScreen.main.bounds.width * 0.06)
                                .padding(UIScreen.main.bounds.width * 0.06)
                                .background(
                                    Color.white
                                        .cornerRadius(UIScreen.main.bounds.width * (0.06 + 0.06))
                                        .shadow(color: Color.MyColor.colorGrayOp1, radius: 12, x: 0, y: 5)
                                        
                                )
                        }
                            
                        
                            
                        
                    }.padding(.horizontal, UIScreen.main.bounds.width * 0.063)
                    
                    Spacer()
                    
                }
                
                if smsVerificationPageVM.showAlert{
                    //AlertTypeDialogView(error: $smsVerificationPageVM.error, showAlertTypeDialogView: $smsVerificationPageVM.showAlert, errorType: $smsVerificationPageVM.errorType, errorCode: $smsVerificationPageVM.errorCode, alertLogout: .constant(false))
                    
                }
                
                
                if smsVerificationPageVM.isLoading {
                    LoadingDialogView()
                }
                
            }
            
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea(.keyboard)
            .ignoresSafeArea(.all)
            .navigationBarHidden(true)
            .onAppear{
                if let date = calendar.date(byAdding: .second, value: 30, to: Date()){
                    lastDate = date
                }
                
            }
            .onReceive(self.timer) {_ in
                do {
                    
                    let differenceInSeconds = Int(lastDate.timeIntervalSince(Date()))
                    
                    if differenceInSeconds > 0{
                        second = differenceInSeconds
                    }else{
                        second = 0
                        self.timer.upstream.connect().cancel()
                    }
                }catch {
                    
                }
            }
            //.trackScreenView(screenName: .smsVerification)
        
    }
    
    
    private func otpText(text: String) -> some View {
        
        HStack{
            if text.isEmpty{
                Text("-")
                    .font(Font.custom(fontsBold, size: 18))
                    .foregroundColor(Color.MyColor.colorGray2)
                    .frame(width: textBoxWidth, height: textBoxHeight)
                    .padding(paddingOfBox)
            }else{
                Text(text)
                    .font(Font.custom(fontsBold, size: 18))
                    .foregroundColor(Color.MyColor.colorGray2)
                    .frame(width: textBoxWidth, height: textBoxHeight)
                    .padding(paddingOfBox)
            }
            
        }.background(
          Color.white
              .cornerRadius(12)
              .shadow(color: Color.MyColor.colorGrayOp1, radius: 12, x: 0, y: 3))
        
    }

}
