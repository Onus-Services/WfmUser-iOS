//
//  View+Extensions.swift
//  WfmAdmin
//
//  Created by Mustafa Alper Aydin on 28.01.2025.
//

import SwiftUI


extension View {
    
    func customOverlayStyle(cornerRadius: CGFloat, lineColor: Color, lineWidth: CGFloat = 1) -> some View {
            self
                .cornerRadius(cornerRadius)
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(lineColor, lineWidth: lineWidth)
                )
        }
}
