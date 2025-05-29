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


func yyyhshhayqhbd(didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
    
    print("122233")
    print(userInfo)
    var notfModel: NotificationResponseModel = NotificationResponseModel()
    for notf in userInfo {
        if notf.key.description == "Type" {
            notfModel.Type1 = Int(notf.value as! String)
        } else if notf.key.description == "MxRouteId" {
            notfModel.MxRouteId = Int(notf.value as! String)
        } else if notf.key.description == "MxBlockId" {
            notfModel.MxBlockId = Int(notf.value as! String)
        } else if notf.key.description == "BlockStatusId" {
            // notfModel.BlockStatusId = Int(notf.value as! String)
            let stringValue = notf.value as? String ?? "0"
            notfModel.BlockStatusId = Int(stringValue) ?? 0
        } else if notf.key.description == "BlockExecutionStatusId" {
            // notfModel.BlockExecutionStatusId = Int(notf.value as! String)
            let stringValue = notf.value as? String ?? "0"
            notfModel.BlockExecutionStatusId = Int(stringValue) ?? 0
        } else if notf.key.description == "BlockActionDesc" {
            notfModel.BlockActionDesc = notf.value as? String
        } else if notf.key.description == "PointStatusId" {
            // notfModel.PointStatusId = Int(notf.value as! String)
            let stringValue = notf.value as? String ?? "0"
            notfModel.PointStatusId = Int(stringValue) ?? 0
        } else if notf.key.description == "PointId" {
            // notfModel.PointId = Int(notf.value as! String)
            let stringValue = notf.value as? String ?? "0"
            notfModel.PointId = Int(stringValue) ?? 0
        } else if notf.key.description == "Show" {
            notfModel.Show = Int(notf.value as! String)
        } else if notf.key.description == "ActionDesc" {
            notfModel.ActionDesc = notf.value as? String
        } else if notf.key.description == "UseSandBox" {
            notfModel.UseSandBox = Int(notf.value as! String)
        } else if notf.key.description == "ExecutionType" {
            notfModel.ExecutionType = Int(notf.value as! String)
        }
    }
    
    
    if notfModel.Type1 == 2 {
        NotificationCenter.default.post(name: .notification2, object: nil, userInfo: ["notification2Model" : notfModel])
    } else if notfModel.Type1 == 3 {
        NotificationCenter.default.post(name: .notification3, object: nil, userInfo: ["notification3Model" : notfModel])
    }
    
}
