//
//  SMSVerificationPageViewModel.swift
//  WfmAdmin
//
//  Created by Mustafa Alper Aydin on 28.01.2025.
//

import Foundation

class SMSVerificationPageViewModel: ObservableObject {
    
    @Published var showAlert = false
    @Published var error = ""
    @Published var errorType = 0
    @Published var errorCode = 0
    
    @Published var isLoading = false
    
    private let networkManager: NetworkManager
    init(networkManager: NetworkManager = NetworkManager()) {
        Logger.log("init-SMSVerificationPageViewModel")
        self.networkManager = networkManager
        
    }
    
    func errorDialogCallFunc<T>(response: ApiResponseFunc.ResponseResult<T>) {
        self.error = response.errorText
        self.errorCode = response.errorCode
        self.errorType = response.errorType
        self.showAlert = true
    }
    
    func sendCode(mobileNo: String, activationKod: Int, operationType: Int, resultHandler:@escaping (Int) -> ()){
        
        self.isLoading = true
        Logger.log(mobileNo)
        Logger.log("\(activationKod)")
        Logger.log("\(operationType)")
        
        networkManager.sendCode(mobileNo: mobileNo, activationKod: activationKod, operationType: operationType, mobileId: preferences.string(forKey: "token") ?? "eff65c27ffcd2412aab300e0d0c55fbef8e9dd4352bed120f7019437aa5d0597", completion: { [weak self] result in
            guard self != nil else { return }
            
            let result1: ApiResponseFunc.ResponseResult<Int> = ApiResponseFunc().jsonStringToModel(api: "sendCode", result: result)
            if result1.isError {
                self?.errorDialogCallFunc(response: result1)
                resultHandler(-1)
            } else {
                if result1.data.first != nil {
                    if result1.data.first! > 0{
                        resultHandler(result1.data.first!)
                        print("result1.data.first! - \(result1.data.first!)")
                    }
                }
            }
            self?.isLoading = false
        })
    }
}
