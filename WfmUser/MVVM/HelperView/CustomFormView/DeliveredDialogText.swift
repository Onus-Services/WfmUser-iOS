//
//  DeliveredDialogText.swift
//  WfmAdmin
//
//  Created by Mustafa Alper Aydin on 30.01.2025.
//

import SwiftUI

enum TextMode {
    case number, decimal, text
}

struct DeliveredDialogText: View {
    var title: String
    @Binding var text: String
    var textMode: TextMode = .text
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .font(.custom(fontsRegular, size: 12))
                .foregroundColor(.gray)
                //.frame(width: 100)
            
            TextField("", text: $text)
                .frame(height: 33)
                .background(Color.white)
                .padding(.leading, 5)
                .cornerRadius(CR.btn5)
                .keyboardType(textMode == .number ? .numberPad : textMode == .decimal ? .decimalPad : .default)
                .overlay(
                    RoundedRectangle(cornerRadius: 3)
                        .stroke(Color.gray, lineWidth: 2)
                )
        }.padding(.horizontal, 10)
    }
}

struct DeliveredDialogTextNoChange: View {
    var title: String
    var text: String
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .font(.custom(fontsRegular, size: 12))
                .foregroundColor(.gray)
                .frame(width: 100)
            
            Text(text)
                .frame(height: 33)
                .frame(maxWidth: .infinity)
                .padding(.leading, 5)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(CR.btn5)
                .overlay(
                    RoundedRectangle(cornerRadius: 3)
                        .stroke(Color.gray, lineWidth: 2)
                )
        }.padding(.horizontal, 10)
    }
}
