//
//  ApiService.swift
//  WfmAdmin
//
//  Created by Mustafa Alper Aydin on 27.01.2025.
//

import Foundation
import Moya

var isDummyData: Bool = true

//var BASE_URL = "http://192.168.2.49/rotamenavswebapi/api/Business/" //lokall
//var BASE_URL = "http://192.168.2.36/kuryecepwebapi/api/" //test
var BASE_URL = "https://rx.rotamen.com/webapi/api/Business/" //cloud
//var BASE_URL = "http://192.168.2.86/rotamenwfmwebapi/api/Business/" //cloud


enum APIService {
    case getLogin(username: String, password: String, MobileId: String, DeviceType: String, MobileName: String, pagetype: String)
    
    case sendCode(mobileNo: String, activationKod: Int, operationType: Int, mobileId: String)
    
    case executionV1MultiBody(executionId: CLong, mxRouteId: CLong, mxBlockId: Int, executionType: Int, executionStr: String, latitude: Float, longitude: Float, mxRoutePointIds: String, accuracy: Float, speed: Float, height: Float, mobileId: String)

}


extension APIService: TargetType{
    
    var baseURL: URL {
        return URL(string: BASE_URL)!
    }
    //f8EuhhmWgEm-oRD-eygnq9:APA91bHQJgFS4jMaZ8HGS2bAOvgyPboGGQsyigvuYiPxeGcP2noeNr8aek4D9xQyFbAbpmLpQW0Mxf_JlsxlLXhonLQIF24ZQa8ZXO4rzaVPw5WtrjHXpctoEGA6eyrHsu6FyUbNxO23
    var path: String {
        switch self {
        case .getLogin:
            //Login
            return "GET_RX_LOGIN_MOBILE"
            
        case .sendCode:
            return "KR_SET_USER_ACTIVATION"
            
        case .executionV1MultiBody:
            return "api/Business/MOBILE_SET_MXROUTE_EXECUTION_V1_MULTI"
            
        
        default:
            fatalError("Path must be defined!!")
        }
    }
  
    var method: Moya.Method {
        switch self {
        case .getLogin, .sendCode, .executionV1MultiBody:
            return .post
        default:
            fatalError("Method must be defined!!")
        }
    }
    //f8EuhhmWgEm-oRD-eygnq9:APA91bHQJgFS4jMaZ8HGS2bAOvgyPboGGQsyigvuYiPxeGcP2noeNr8aek4D9xQyFbAbpmLpQW0Mxf_JlsxlLXhonLQIF24ZQa8ZXO4rzaVPw5WtrjHXpctoEGA6eyrHsu6FyUbNxO23
    var task: Task {
        switch self {
        case .getLogin(let username, let password, let MobileId, let DeviceType, let MobileName, let pagetype):
            return .requestParameters(parameters: ["username" : "\(username)", "password": "\(password)", "MobileId" : "\(MobileId)", "DeviceType" : "\(DeviceType)", "MobileName" : "\(MobileName)", "pagetype" : "\(pagetype)"], encoding: JSONEncoding.default)
    
        case .sendCode(let mobileNo, let activationKod, let operationType, let mobileId):
            return .requestParameters(parameters: ["MobileNo" : "\(mobileNo)", "ActivationKod": "\(activationKod)", "OperationType" : "\(operationType)", "MobileId" : "\(mobileId)"], encoding: JSONEncoding.default)
            
        case .executionV1MultiBody(let executionId, let mxRouteId, let mxBlockId, let executionType, let executionStr, let latitude, let longitude, let mxRoutePointIds, let accuracy, let speed, let height, let mobileId):
            return .requestParameters(parameters: ["ExecutionId" : "\(executionId)", "MxRouteId": "\(mxRouteId)", "MxBlockId" : "\(mxBlockId)", "ExecutionType" : "\(executionType)", "ExecutionStr": "\(executionStr)", "Latitude" : "\(latitude)", "Longitude" : "\(longitude)", "MxRoutePointIds": "\(mxRoutePointIds)", "Accuracy" : "\(accuracy)", "Speed" : "\(speed)", "Height": "\(height)", "SessionKey" : "\(mobileId)"], encoding: JSONEncoding.default)
            
            
        default:
            fatalError("Task must be defined!!")
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
}



/*
 

 */
