//
//  SplashPageView.swift
//  WfmAdmin
//
//  Created by Mustafa Alper Aydin on 27.01.2025.
//

import Foundation
import SwiftUI

struct SplashPageView: View {
    
    let date = Date()
    let calendar = Calendar.current
    
    var body: some View {
        ZStack {
            if calendar.component(.hour, from: date) > 5 && calendar.component(.hour, from: date) <= 10 {
                Image(ImageConstants.splashGoodMorning.rawValue)
                    .resizable()
                    .frame(width: screenWidth, height: screenHeight)
                
            } else if calendar.component(.hour, from: date) > 10 && calendar.component(.hour, from: date) <= 18 {
                Image(ImageConstants.splashGoodDay.rawValue)
                    .resizable()
                    .frame(width: screenWidth, height: screenHeight)
            } else {
                Image(ImageConstants.splashGoodNight.rawValue)
                    .resizable()
                    .frame(width: screenWidth, height: screenHeight)
                
            }
        }
    }
}
