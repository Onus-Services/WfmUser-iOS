//
//  DialogHeaderCard.swift
//  WfmAdmin
//
//  Created by Mustafa Alper Aydin on 28.01.2025.
//

import SwiftUI

struct DialogHeaderCard: View {
    
    var text: String
    var background: Color
    var onTap: () -> Void
    
    var body: some View {
        HStack {
            Text(text)
                .font(.custom(fontsSemiBold, size: 15))
                .frame(maxWidth: .infinity)
                .padding(.vertical, 3)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.white)
            
            Button {
                withAnimation{
                    onTap()
                }
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundStyle(.white)
            }
        }.padding(.horizontal, 5)
            .padding(.vertical, 10)
            .background(background)
    }
}
