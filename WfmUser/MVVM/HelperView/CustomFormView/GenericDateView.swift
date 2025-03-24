//
//  GenericDateView.swift
//  WfmAdmin
//
//  Created by Mustafa Alper Aydin on 30.01.2025.
//

import SwiftUI

struct GenericDateView: View {
    let title: String
    @Binding var stringDate: String
    let type: String
    
    @State private var selectedDate: Date = Date()
    
    private var datePickerComponents: DatePickerComponents {
        return .date
        /*switch type {
        case AttributeTypes.time:
            return .hourAndMinute // Sadece saat
        case AttributeTypes.date:
            return .date // Sadece tarih
        case AttributeTypes.dateAndTime:
            return [.date, .hourAndMinute] // Tarih ve saat
        default:
            return .hourAndMinute
        } */
    }

    private var dateFormat: String {
        return "yyyy-MM-dd"
        /*switch type {
        case AttributeTypes.time:
            return "HH:mm" // Sadece saat formatı
        case AttributeTypes.date:
            return "yyyy-MM-dd" // Sadece tarih formatı
        case AttributeTypes.dateAndTime:
            return "yyyy-MM-dd HH:mm" // Hem tarih hem saat formatı
        default:
            return "HH:mm"
        } */
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .padding(.bottom, 2)

            DatePicker("Select Date", selection: $selectedDate, displayedComponents: datePickerComponents)
                .datePickerStyle(.compact)
                .labelsHidden()
                .onChange(of: selectedDate) { newDate in
                    // Kullanıcı tarih seçimi yaptığında stringDate güncellenir
                    stringDate = formattedDate(date: newDate)
                }
                .padding(.bottom, 5)
            
            Text("Seçilen Tarih: \(stringDate)")
                .font(.title3)
                .bold()
                .padding(.top, 2)
        }
        .padding()
        .onAppear {
            // Başlangıçta stringDate'i Date'e çevirip selectedDate'e aktar
            if let initialDate = dateFromString(stringDate) {
                selectedDate = initialDate
            }
        }
    }

    private func dateFromString(_ string: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        return formatter.date(from: string)
    }

    // Date'i String'e çeviren yardımcı fonksiyon
    private func formattedDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        return formatter.string(from: date)
    }
}
