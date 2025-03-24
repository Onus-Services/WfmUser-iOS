//
//  Date+Extensions.swift
//  WfmAdmin
//
//  Created by Mustafa Alper Aydin on 28.01.2025.
//

import Foundation
import SwiftUI

extension Date {
    // "gg.aa" formatında tarih stringi döndüren bir computed property
    var dayMonthFormat: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM"
        return dateFormatter.string(from: self)
    }
    
    var HHmmFormat: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: self)
    }
    
    var ddMMYYFormat: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy"
        return dateFormatter.string(from: self)
    }
    
    var formatToCustomString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy / HH:mm"
        dateFormatter.locale = Locale(identifier: "tr_TR") // Türkçe tarih formatı için
        return dateFormatter.string(from: self)
    }
}
