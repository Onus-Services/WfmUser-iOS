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
