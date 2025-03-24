//
//  String+Extensions.swift
//  WfmAdmin
//
//  Created by Mustafa Alper Aydin on 29.01.2025.
//

import Foundation

extension String {
    func formatToK() -> String {
        if let number = Int(self) {
            switch number {
            case 0..<1000:
                return "\(number)"
            case 1000..<10000:
                return "\(number / 1000)k"
            default:
                return String(format: "%.1fk", Double(number) / 1000.0)
            }
        }
        if let number = Double(self) {
            print("self - \(self)")
            switch number {
            case 0.0..<1000.0:
                return "\(number)"
            case 1000.0..<10000.0:
                return String(format: "%.1fk", Double(number) / 1000.0)
                //return "\(number / 1000.0)k"
            default:
                return String(format: "%.1fk", Double(number) / 1000.0)
            }
        }
        return self
    }
    
    func toTimeFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy h:mm:ss a"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // AM/PM doğru algılansın diye
        
        if let date = dateFormatter.date(from: self) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "HH:mm"
            return outputFormatter.string(from: date)
        }
        return ""
    }
    
    func formattedTimeYYYY_MM_DD() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.locale = Locale(identifier: "tr_TR") // Gerekirse lokal ayarı

        if let date = formatter.date(from: self) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "HH:mm"
            return outputFormatter.string(from: date)
        }
        return ""
    }
    
    func formattedTimeYYYY_MM_DDtoHH_MM_SS() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.locale = Locale(identifier: "tr_TR") // Gerekirse lokal ayarı

        if let date = formatter.date(from: self) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "HH:mm:ss"
            return outputFormatter.string(from: date)
        }
        return ""
    }
}


extension Int {
    var formattedTime: String {
        let hours = self / 3600
        let minutes = (self % 3600) / 60
        
        if hours > 0 {
            return String(format: "%02d:%02d", hours, minutes)
        } else {
            return String(format: "%02d", minutes)
        }
    }
}
