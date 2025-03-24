//
//  ApiResponseFunc.swift
//  WfmAdmin
//
//  Created by Mustafa Alper Aydin on 27.01.2025.
//

import Foundation
import Moya
import Alamofire

class ApiResponseFunc {
    func jsonStringToModel<T: Decodable>(api: String, result: Result<Data, Error>, isList: Bool = true) -> ResponseResult<T> {
        
        guard isConnectedToNetwork() else {
            NotificationCenter.default.post(name: Notification.Name("isNetworkError"), object: true)
            if ["getRxTotal", "setSequenceTransfer", "getUserBlockInfo", "getUserPlannedList", "executionV1MultiBody", "setPointPod", "setBarcode"].contains(api) {
                return ResponseResult(data: [], isError: true, errorText: "Bu işlem offline gerçekleştirilemez.", errorCode: -10, errorType: ErrorTypes.FAILED)
            } else {
                return ResponseResult(data: [], isError: true, errorText: "Bu işlem offline gerçekleştirilemez.", errorCode: -1, errorType: ErrorTypes.FAILED)
            }
            
        }
        
        let decoder = JSONDecoder()
        switch result {
        case .success(let apiResponse):
            NotificationCenter.default.post(name: Notification.Name("isNetworkError"), object: false)
            if let jsonString = try? decoder.decode(String.self, from: apiResponse) {
                do {
                    // Parse JSON string
                    let jsonData = jsonString.data(using: .utf8)!
                    // Check for ErrorCodes
                    if let errorModel = try? decoder.decode([WebServiceError].self, from: jsonData) {
                        print("XXXDDDRRR44444")
                        let newE = nError(randomCode: errorModel.first!.ErrorCode)
                        if errorModel.first!.ErrorCode != -1808 && errorModel.first!.ErrorCode != -130116 {
                            // Handle error message
                            
                            return ResponseResult(data: [], isError: true, errorText: errorModel.first!.ErrorMessageStr, errorCode: errorModel.first!.ErrorCode, errorType: ErrorTypes.FAILED)
                        }
                        return ResponseResult(data: [], isError: true, errorText: errorModel.first!.ErrorMessageStr, errorCode: errorModel.first!.ErrorCode, errorType: ErrorTypes.FAILED)
                    } else if !jsonString.isEmpty {
                        // Parse data
                        print("XXXDDDRRR33333")
                        do {
                            let decodedData: T = try decoder.decode(T.self, from: jsonData)
                            if isList {
                                print("\(ResponseResult(data: [decodedData], isError: false, errorText: "", errorCode: 1, errorType: ErrorTypes.FAILED))")
                                return ResponseResult(data: [decodedData], isError: false, errorText: "", errorCode: 1, errorType: ErrorTypes.FAILED)
                            } else {
                                return ResponseResult(data: [decodedData], isError: false, errorText: "", errorCode: 1, errorType: ErrorTypes.FAILED)
                            }
                        } catch let DecodingError.dataCorrupted(context) {
                            print("Data corrupted: \(context.debugDescription)")
                            print("CodingPath: \(context.codingPath)")
                            return ResponseResult(data: [], isError: true, errorText: "\(context.debugDescription)", errorCode: 1, errorType: ErrorTypes.FAILED)
                        } catch let DecodingError.keyNotFound(key, context) {
                            print("Key '\(key)' not found: \(context.debugDescription)")
                            print("CodingPath: \(context.codingPath)")
                            return ResponseResult(data: [], isError: true, errorText: "\(context.debugDescription)", errorCode: 1, errorType: ErrorTypes.FAILED)
                        } catch let DecodingError.typeMismatch(type, context) {
                            print("Type '\(type)' mismatch: \(context.debugDescription)")
                            print("CodingPath: \(context.codingPath)")
                            return ResponseResult(data: [], isError: true, errorText: "\(context.debugDescription)", errorCode: 1, errorType: ErrorTypes.FAILED)
                        } catch let DecodingError.valueNotFound(value, context) {
                            print("Value '\(value)' not found: \(context.debugDescription)")
                            print("CodingPath: \(context.codingPath)")
                            return ResponseResult(data: [], isError: true, errorText: "\(context.debugDescription)", errorCode: 1, errorType: ErrorTypes.FAILED)
                        } catch {
                            print("XXXDDDRRR22222")
                            if api == "setPointAddress" {
                                return ResponseResult(data: [], isError: false, errorText: "", errorCode: 1, errorType: ErrorTypes.FAILED)
                            } else {
                                return ResponseResult(data: [], isError: true, errorText: "\(NSLocalizedString("loginResultBos", comment: ""))", errorCode: 1, errorType: ErrorTypes.FAILED)
                            }
                        }
                    } else {
                        print("XXXDDDRRR11111")
                        return ResponseResult(data: [], isError: false, errorText: "", errorCode: 1, errorType: ErrorTypes.FAILED)
                    }
                }
            } else {
                print("XXXDDDRRR")
                return ResponseResult(data: [], isError: true, errorText: "\(NSLocalizedString("resultBos", comment: ""))", errorCode: -101, errorType: ErrorTypes.FAILED)
            }
            
        case .failure(let error):
            NotificationCenter.default.post(name: Notification.Name("isNetworkError"), object: true)
            print("ASKDKAKSDKASKDKASKD")
            
            var newE = error as? nError
            return ResponseResult(data: [], isError: true, errorText: "\(newE!.errDesc)", errorCode: -1, errorType: ErrorTypes.FAILED)
        }
    }
    
    struct ResponseResult<T> {
        var data: [T]
        var isError: Bool
        var errorText: String
        var errorCode: Int
        var errorType: Int
    }
    
    struct WebServiceError: Decodable {
        var ErrorCode: Int
        var ErrorMessageStr: String
    }
    
    func isConnectedToNetwork() -> Bool {
        guard let url = URL(string: "https://www.google.com") else { return false }
        let session = URLSession(configuration: .default)
        let semaphore = DispatchSemaphore(value: 0)
        
        var isConnected = false
        let task = session.dataTask(with: url) { (_, response, error) in
            if let error = error {
                print("Internet Connection Error: \(error)")
            } else if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                isConnected = true
            }
            semaphore.signal()
        }
        task.resume()
        semaphore.wait()
        return isConnected
    }
    
}

var pendingTasks: [() -> Void] = []

func processNextTask() {
    print("🍀🍀🍀🍀processNextTaskprocessNextTask")
    if let nextTask = pendingTasks.first {
        print("✨✨✨✨nextTasknextTasknextTask")
        pendingTasks.removeFirst()
        nextTask()
    }
}

struct nError: Error {
    var errCode: HTTPStatusCode
    var errDesc: String = ""
    
    init(errCode: HTTPStatusCode) {
        self.errCode = errCode
        self.errDesc = WfmUser.localizedDescription(for: errCode)
    }
    
    init(randomCode: Int) {
        if let code = HTTPStatusCode(rawValue: randomCode) {
            self.errCode = code
        } else {
            // Eğer verilen randomCode enum içinde değilse, default bir değer atanabilir
            self.errCode = .internalServerError
        }
        self.errDesc = WfmUser.localizedDescription(for: self.errCode)
    }
    
}


enum HTTPStatusCode: Int {
    case ok = 200
    case created = 201
    case accepted = 202
    case noContent = 204
    case badRequest = 400
    case unauthorized = 401
    case forbidden = 403
    case notFound = 404
    case internalServerError = 500
    case serviceUnavailable = 503
    case timeOut = -1001
    // İhtiyacınıza göre diğer kodları da ekleyebilirsiniz.
}

// HTTP durum kodunu Türkçeleştiren fonksiyon
func localizedDescription(for code: HTTPStatusCode) -> String {
    print("TRTRTRTR")
    switch code {
    case .ok:
        return "İstek başarılı."
    case .created:
        return "Kaynak oluşturuldu."
    case .accepted:
        return "İstek kabul edildi."
    case .noContent:
        return "İçerik yok."
    case .badRequest:
        return "Geçersiz istek."
    case .unauthorized:
        return "Yetkisiz erişim."
    case .forbidden:
        return "Erişim yasak."
    case .notFound:
        return "Kaynak bulunamadı."
    case .internalServerError:
        return "Sunucu hatası."
    case .serviceUnavailable:
        return "Hizmet kullanılamıyor."
    case .timeOut:
        return "İstek zaman aşımına uğradı."
    }
}

func handleMoyaError(err: MoyaError) -> nError {
    var networkError: nError
    print("AAASDASDASDKKKK")
    if let error = (err.errorUserInfo["NSUnderlyingError"] as? Alamofire.AFError)?.underlyingError as? NSError, error.domain == NSURLErrorDomain, error.code == NSURLErrorNotConnectedToInternet || error.code == NSURLErrorTimedOut || error.code == NSURLErrorNetworkConnectionLost {
        print("AAASDASDASDKKKK1111111")
        let message = localizedDescription(for: .timeOut)
        networkError = nError(errCode: HTTPStatusCode.timeOut)
    } else {
        if let moyaError = err as? MoyaError {
            print("AAASDASDASDKKKK2222222")
            if let statusCode = moyaError.response?.statusCode,
               let httpStatusCode = HTTPStatusCode(rawValue: statusCode) {
                let message = localizedDescription(for: httpStatusCode)
                print("HTTP Durum Kodu: \(statusCode) - \(message)")
                networkError = nError(errCode: httpStatusCode)
            } else {
                print("AAASDASDASDKKKK666666666")
                //networkError = .unknown("Bilinmeyen bir hata oluştu.")
                networkError = nError(errCode: HTTPStatusCode.timeOut)
            }
        } else {
            print("AAASDASDASDKKKK44444444")
            //networkError = .unknown("Bilinmeyen bir hata oluştu.")
            networkError = nError(errCode: HTTPStatusCode.timeOut)
        }
    }
    
    return networkError
}
