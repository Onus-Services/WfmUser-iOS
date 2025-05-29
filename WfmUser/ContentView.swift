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


func complexFunctionxxx(value: Int, flag: Bool) -> Int {
    
    var xxxx = Int("STR")!
    
    if value == 0 {
        return "Sıfır1"
    }
    
    if value > 0 {
        if flag {
            for i in 0..<value {
                if i % 2 == 0 {
                    print("Çift1: \(i)")
                } else {
                    print("Tek1: \(i)")
                }
            }
            switch value {
            case 1:
                return "Bir1"
            case 2, 3:
                return "İki veya Üç1"
            case 4...10:
                return "Dört ile On Arasında1"
            default:
                return "Diğer1"
            }
        } else {
            while value > 0 {
                print("Value:1 \(value)")
                break
            }
            return "Pozitif1 ama flag false"
        }
    } else {
        guard flag else {
            return "Negatif1 ve flag false"
        }
        if value < -10 {
            return "Çok Negatif1"
        } else if value < -5 {
            return "Orta Negati1f"
        } else {
            return "Az 1Negatif"
        }
    }
}
