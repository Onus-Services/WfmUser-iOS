//
//  GlobalFunc.swift
//  WfmAdmin
//
//  Created by Mustafa Alper Aydin on 27.01.2025.
//

import Foundation
import UIKit
import SwiftUI

// MARK: Klavye Gizle
func hideKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
}

// MARK: Tarih dönüşü
func formatDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter.string(from: date)
}

func formatToHoursAndMinutes(from seconds: Int) -> String {
    let hours = seconds / 3600
    let minutes = (seconds % 3600) / 60
    return String(format: "%02d:%02d", hours, minutes)
}

func getCurrentLanguage() -> String {
    let currentLocale = Locale.current
    if let languageCode = currentLocale.language.languageCode?.identifier {
        switch languageCode {
        case "en":
            return "en"
        case "tr":
            return "tr"
        default:
            return ""
        }
    } else {
        return ""
    }
}

struct Logger {
    static func log(_ message: String) {
        #if DEBUG
        print(message)
        #endif
    }
}
