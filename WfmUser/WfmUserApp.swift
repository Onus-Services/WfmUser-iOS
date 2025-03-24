//
//  WfmUserApp.swift
//  WfmUser
//
//  Created by Mustafa Alper Aydin on 13.03.2025.
//

import SwiftUI

@main
struct WfmUserApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            //ContentView()
            ControllerView()
        }
    }
}


