//
//  ForgotPasswordPageViewModel.swift
//  WfmUser
//
//  Created by Mustafa Alper Aydin on 19.03.2025.
//

import Foundation

class ForgotPasswordPageViewModel: ObservableObject {
    
    @Published var showAlert = false
    @Published var error = ""
    @Published var errorType = 0
    @Published var errorCode = 0
    
    @Published var isLoading = false

    
    @Published var userName: String = ""
    @Published var password: String = ""
    @Published var passwordRepeat: String = ""
    
    private let networkManager: NetworkManager
    init(networkManager: NetworkManager = NetworkManager()) {
        print("init-LoginPageViewodel")
        self.networkManager = networkManager
        
    }
    
    
    func usernameControll(username: String, resultHandler:@escaping (Bool) -> ()) {
        if username == "" {
            self.error = String(localized: "ErrorKullaniciAdiBos")
            self.errorCode = -00
            self.errorType = ErrorTypes.FAILED
            self.showAlert = true
            resultHandler(false)
        } else {
            resultHandler(true)
            /*login(username: username, password: password) { result in
                if result != nil {
                    //print("PQPQPQPQQP")
                    resultHandler(true)
                }
            } */
        }
    }
    
    
    func getNewPass(password: String, passwordRepeat: String, resultHandler:@escaping (Bool) -> ()) {
        if password == "" || passwordRepeat == "" {
            self.error = String(localized: "ErrorSifrelerBos")
            self.errorCode = -00
            self.errorType = ErrorTypes.FAILED
            self.showAlert = true
            resultHandler(false)
        } else if password.count < 6 {
            self.error = String(localized: "ErrorSifre6")
            self.errorCode = -00
            self.errorType = ErrorTypes.FAILED
            self.showAlert = true
            resultHandler(false)
        } else if password != passwordRepeat {
            self.error = String(localized: "ErrorSifrelerUyusmuyor")
            self.errorCode = -00
            self.errorType = ErrorTypes.FAILED
            self.showAlert = true
            resultHandler(false)
        } else {
            resultHandler(true)
        }
    }
    
    func errorDialogCallFunc<T>(response: ApiResponseFunc.ResponseResult<T>) {
        self.error = response.errorText
        self.errorCode = response.errorCode
        self.errorType = response.errorType
        if errorCode != -10 {
            self.showAlert = true
        }
    }
    
    func login(username: String, password: String, resultHandler:@escaping (LoginUser?) -> ()){
        self.isLoading = true
        let mobileId: String = preferences.string(forKey: "token") ?? ""
        
        networkManager.getLogin(username: username, password: password, MobileId: mobileId, DeviceType: "", MobileName: "", pagetype: loginPageType, completion: { [weak self] result in
            guard self != nil else { return }
            
            let result1: ApiResponseFunc.ResponseResult<[LoginUser]> = ApiResponseFunc().jsonStringToModel(api: "login", result: result)
            if result1.isError {
                print("XADSADASDASDASDASDASDASd")
                print("result1 - \(result1)")
                self?.errorDialogCallFunc(response: result1)
                resultHandler(nil)
                self?.isLoading = false
            } else {
                if result1.data.first?.first?.UserID != nil {
                    print("result1 - \(result1.data) ")
                    let resultUser = result1.data.first?.first!
                    //SQLiteCommands.insertUser(resultUser!)
                    
                    resultHandler(resultUser)
                    self?.isLoading = false
                }
            }
        })
    }
    
}
