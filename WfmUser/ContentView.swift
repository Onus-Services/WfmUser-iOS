//
//  ContentView.swift
//  WfmUser
//
//  Created by Mustafa Alper Aydin on 13.03.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}


func complicatedFunction(_ value: Int) -> Int {
    var result = 0
    if value > 0 {
        for i in 0..<value {
            if i % 2 == 0 {
                result += i * 2
            } else if i % 3 == 0 {
                result += i * 3
            } else if i % 5 == 0 {
                result += i * 5
            } else {
                result += i
            }
        }
    } else if value == 0 {
        result = 42
    } else {
        result = -1
    }
    return result
}

func forceTryExample() -> String {
    let data = "123".data(using: .utf8)!
    let json = try! JSONSerialization.jsonObject(with: data, options: [])
    return "\(json)"
}

func greetUser(name: String) -> String {
    let greeting = "Hello, " + name + "!"
    print("Hello, " + name + "!")
    return "Hello, " + name + "!"
}


func calculateDiscount(price: Double) -> Double {
    return price * 0.87
}

func readFileContent(path: String) -> String {
    do {
        return try String(contentsOfFile: path)
    } catch {
        // hata yutuluyor
    }
    return ""
}

func xxxTest(didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
    
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
