//
//  AppState.swift
//  WfmAdmin
//
//  Created by Mustafa Alper Aydin on 27.01.2025.
//

import Foundation
import heresdk

class AppState: ObservableObject {
    
    @Published var pageType: Int
    @Published var newLogin: Bool = false
    
    @Published var forgotPassPage: Bool = false
    @Published var forgotPassNewPass: Bool = false
    
        
    init(){
        
        pageType = preferences.integer(forKey: "page_type") //0 ise wellcome //1 ise login //2 ise main
        if pageType == 3 || pageType == 0 || pageType == 1 {
            if !hereInıtilaze {
                initializeHERESDK(type: 2)
            }
            //initializeHERESDK(type: 2)
        }
        
    }
    

    func initializeHERESDK(type: Int) {
        print("initializeHERESDK - \(type)")
        let accessKeyID = preferences.string(forKey: "accessKeyID") ?? ""
        let accessKeySecret = preferences.string(forKey: "accessKeySecret") ?? ""
        print("accessKeyIDaccessKeyID - \(accessKeyID) -- \(accessKeySecret)")
        let options = SDKOptions(accessKeyId: accessKeyID, accessKeySecret: accessKeySecret)
        
        do {
            try SDKNativeEngine.makeSharedInstance(options: options)
        } catch let engineInstantiationError {
            fatalError("Failed to initialize the HERE SDK. Cause: \(engineInstantiationError)")
        }
        
        let sdkEngine = SDKNativeEngine.sharedInstance
        sdkEngine!.enableUsageStats(enabled: true)
        hereInıtilaze = true
        
    }
    
    func goLogin() {
        DispatchQueue.main.async {
            preferences.set(1, forKey: "page_type")
            self.pageType = 1
        }
        
    }
    
    func logout() {
        DispatchQueue.main.async {
            preferences.set(1, forKey: "page_type")
            self.pageType = 1
            //_ = SQLiteCommands.deleteTable()
        }
        
    }
    
    func goSmsVerificationPage() {
        DispatchQueue.main.async {
            //preferences.set(2, forKey: "page_type")
            self.pageType = 2
        }
    }
    
    func successLogin(){
        if !hereInıtilaze {
            initializeHERESDK(type: 1)
        }
        DispatchQueue.main.async {
            preferences.set(3, forKey: "page_type")
            self.newLogin = true
            self.pageType = 3
        }
    }
}
