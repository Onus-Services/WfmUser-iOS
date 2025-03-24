//
//  LoginPageViewModel.swift
//  WfmAdmin
//
//  Created by Mustafa Alper Aydin on 27.01.2025.
//

import Foundation
import FirebaseRemoteConfig
import UIKit

class LoginPageViewModel: ObservableObject {
    
    @Published var showAlert = false
    @Published var error = ""
    @Published var errorType = 0
    @Published var errorCode = 0
    
    @Published var isLoading = false
    
    //@Published var user: LoginUser = LoginUser()
    
    let remoteConfig = RemoteConfig.remoteConfig()
    
    //alper_rxapi@rotamen.com
    
    @Published var userName: String = "alper_rxapi@rotamen.com"
    //@Published var userName: String = "onder_ozdemir@cloudrotamen.com"
    @Published var password: String = "123456"
    @Published var showGreeting = false
    
    @Published var isChangeLanguageInfoDialog: Bool = false
    
    private let networkManager: NetworkManager
    init(networkManager: NetworkManager = NetworkManager()) {
        print("init-LoginPageViewodel")
        self.networkManager = networkManager
        
        //user = SQLiteCommands.getUser(type: 10) ?? LoginUser()
        getRemoteConfig()
    }
    
    func getRemoteConfig() {
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
        
        remoteConfig.fetch { (status, error) -> Void in
            if status == .success {
                print("Config fetched!")
                self.remoteConfig.activate { changed, error in
                    let accessKeyID = self.remoteConfig.configValue(forKey: MapKey.keyID).stringValue ?? ""
                    let accessKeySecret = self.remoteConfig.configValue(forKey: MapKey.keySecret).stringValue ?? ""
                    let autoSuggestApiKey = self.remoteConfig.configValue(forKey: MapKey.autoSuggestKey).stringValue ?? ""
                    let is_crash_demo = self.remoteConfig.configValue(forKey: "is_crash_demo").boolValue
                    preferences.set(accessKeyID, forKey: "accessKeyID")
                    preferences.set(accessKeySecret, forKey: "accessKeySecret")
                    preferences.set(autoSuggestApiKey, forKey: "autoSuggestApiKey")
                    preferences.set(is_crash_demo, forKey: "is_crash_demo")
                }
            } else {
                preferences.set("", forKey: "accessKeyID")
                preferences.set("", forKey: "accessKeySecret")
                preferences.set("", forKey: "autoSuggestApiKey")
                print("Config not fetched11111")
                print("Error: \(error?.localizedDescription ?? "No error available.")")
            }
        }
    }
    
    func getLogin(username: String, password: String, resultHandler:@escaping (Bool) -> ()) {
        if username == "" || password == "" {
            if username == "" && password == "" {
                self.error = "Şifre ve Kullanıcı Adı Boş Bırakılamaz"
            } else if username == "" {
                self.error = "Kullanıcı Adı Boş Bırakılamaz"
            } else if password == "" {
                self.error = "Şifre Boş Bırakılamaz"
            }
            self.errorCode = -00
            self.errorType = ErrorTypes.FAILED
            self.showAlert = true
            resultHandler(false)
        } else if password.count < 6 {
            self.error = "Şifre 6 Karakterden küçük olamaz"
            self.errorCode = -00
            self.errorType = ErrorTypes.FAILED
            self.showAlert = true
            resultHandler(false)
        } else {
            login(username: username, password: password) { result in
                if result != nil {
                    //print("PQPQPQPQQP")
                    resultHandler(true)
                }
            }
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
