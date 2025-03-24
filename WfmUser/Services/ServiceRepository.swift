//
//  ServiceRepository.swift
//  WfmAdmin
//
//  Created by Mustafa Alper Aydin on 27.01.2025.
//

import Foundation
import Moya
import Alamofire


protocol ServiceRepository {
    var provider : MoyaProvider<APIService> { get }
    
    func getLogin(username: String, password: String, MobileId: String, DeviceType: String, MobileName: String, pagetype: String, completion: @escaping (Result<Data, Error>) -> ())
    
    func sendCode(mobileNo: String, activationKod: Int, operationType: Int, mobileId: String, completion: @escaping (Result<Data, Error>) -> ())
    
    func executionV1MultiBody(executionId: CLong, mxRouteId: CLong, mxBlockId: Int, executionType: Int, executionStr: String, latitude: Float, longitude: Float, mxRoutePointIds: String, accuracy: Float, speed: Float, height: Float, mobileId: String, completion: @escaping (Result<Data, Error>) -> ())
   
}

class NetworkManager: ServiceRepository {
    var provider = MoyaProvider<APIService>(session: DefaultAlamofireSession.shared, plugins: [NetworkLoggerPlugin()])
    
    func getLogin(username: String, password: String, MobileId: String, DeviceType: String, MobileName: String, pagetype: String, completion: @escaping (Result<Data, Error>) -> ()) {
        request(target: .getLogin(username: username, password: password, MobileId: MobileId, DeviceType: DeviceType, MobileName: MobileName, pagetype: pagetype), completion: completion)
    }
    
    func sendCode(mobileNo: String, activationKod: Int, operationType: Int, mobileId: String, completion: @escaping (Result<Data, Error>) -> ()) {
        request(target: .sendCode(mobileNo: mobileNo, activationKod: activationKod, operationType: operationType, mobileId: mobileId), completion: completion)
    }
    
    func executionV1MultiBody(executionId: CLong, mxRouteId: CLong, mxBlockId: Int, executionType: Int, executionStr: String, latitude: Float, longitude: Float, mxRoutePointIds: String, accuracy: Float, speed: Float, height: Float, mobileId: String, completion: @escaping (Result<Data, Error>) -> ()) {
        request(target: .executionV1MultiBody(executionId: executionId, mxRouteId: mxRouteId, mxBlockId: mxBlockId, executionType: executionType, executionStr: executionStr, latitude: latitude, longitude: longitude, mxRoutePointIds: mxRoutePointIds, accuracy: accuracy, speed: speed, height: height, mobileId: mobileId), completion: completion)
    }
}

private extension NetworkManager {
    private func request<T: Decodable>(target: APIService, completion: @escaping (Result<T, Error>) -> ()) {

        print("sendingg")
        print(target)
        print(target.path)
        print(target.task)
        
        /*provider.request(target) { result in
            switch result {
            case let .success(response):
                completion(.success(response.data as! T))
            case let .failure(error):
                if let error = (error.errorUserInfo["NSUnderlyingError"] as? Alamofire.AFError)?.underlyingError as? NSError, error.domain == NSURLErrorDomain, error.code == NSURLErrorNotConnectedToInternet || error.code == NSURLErrorTimedOut || error.code == NSURLErrorNetworkConnectionLost {
                    print("-\(error.code) not connected")
                } else {
                    print("dedede")
                }
                switch error {
                case let err as MoyaError:
                    print("tttttt")
                    print(err.response)
                case let err as NSError:
                    print(err)
                    print(err.code)
                }
            }
        } */
        
        provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    print("responsee")
                    print(response.data.html2AttributedString)
                    print("**")
                    print(response.statusCode)
                    
                    completion(.success(response.data as! T))
                    
                } catch let error {
                    print("responsee-success-error")
                    print(error.localizedDescription)
                    completion(.failure(error))
                }
            case let .failure(error):
                print("AHAHAHAHA")
                
                print("responsee-error")
                print(error.localizedDescription)
                print("----")
                print(error)
                print("ddddddd")
                //handleError(error: error)
                print(error.errorCode)
                print("--")
                
                /*let networkError: NetworkError12
                if let moyaError = error as? MoyaError {
                    if let statusCode = moyaError.response?.statusCode,
                       let httpStatusCode = HTTPStatusCode(rawValue: statusCode) {
                        print("YAYYAYAYAYAYAYYA")
                        let message = localizedDescription(for: httpStatusCode)
                        print("HTTP Durum Kodu: \(statusCode) - \(message)")
                                        
                        switch httpStatusCode {
                        case .badRequest:
                            networkError = .badRequest(message)
                        case .unauthorized:
                            networkError = .unauthorized(message)
                        case .forbidden:
                            networkError = .forbidden(message)
                        case .notFound:
                            networkError = .notFound(message)
                        case .internalServerError:
                            networkError = .internalServerError(message)
                        case .serviceUnavailable:
                            networkError = .serviceUnavailable(message)
                        case .timeOut:
                            networkError = .timeOut(message)
                        default:
                            networkError = .unknown("Bilinmeyen bir hata oluştu.")
                        }
                    } else {
                        print("WYWUWUWUWUW")
                        networkError = .unknown("Bilinmeyen bir hata oluştu.")
                    }
                } else if let nsError = error as NSError?,
                          nsError.domain == NSURLErrorDomain,
                          nsError.code == NSURLErrorTimedOut {
                    networkError = .timeOut("İstek zaman aşımına uğradı.")
                } else {
                    print("AAATTTYYY")
                    networkError = .unknown("Bilinmeyen bir hata oluştu.")
                }
                print("UYUYUYUYUYUY")
                print(error)
                print("----")
                print(networkError)
                print(networkError.localizedDescription)
                completion(.failure(networkError)) */
                let err = handleMoyaError(err: error)
                completion(.failure(err))
                print("responsee-error")
                //print(error.localizedDescription)
                /*print(error)
                
                completion(.failure(error)) */
            }
        }
    }
}

enum NetworkError: Error {
    case notFound
    case unexpectedError
}

class DefaultAlamofireSession: Alamofire.Session {
    static let shared: DefaultAlamofireSession = {
        let configuration = URLSessionConfiguration.default
        configuration.headers = .default
        configuration.timeoutIntervalForRequest = 120 // as seconds, you can set your request timeout
        configuration.timeoutIntervalForResource = 120 // as seconds, you can set your resource timeout
        configuration.requestCachePolicy = .useProtocolCachePolicy
        return DefaultAlamofireSession(configuration: configuration)
    }()
}
