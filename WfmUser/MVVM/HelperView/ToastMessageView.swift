//
//  ToastMessageView.swift
//  Avansas-iOS
//
//  Created by Banu Ortac on 7.03.2024.
//

import SwiftUI

struct ToastView: View {
    
    @Binding var isPresented: Bool
    @State var toastMessage: String = ""
    var color: Color
    
    var body: some View {
        VStack {
            HStack {
                Text(toastMessage)
                    .padding()
                    .background(color)
                    .foregroundColor(Color.white)
                    .cornerRadius(CR.dlg10)
            }
        }/*.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    isPresented = false
                }
            }
        }*/
    }
}
