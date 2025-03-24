//
//  ChangeLanguageInfoDialog.swift
//  WfmAdmin
//
//  Created by Mustafa Alper Aydin on 27.01.2025.
//

import SwiftUI

struct ChangeLanguageInfoDialog: View {
    
    @Binding var isChangeLanguageInfoDialog: Bool
    
    var body: some View {
        ZStack{
            
            VStack {
                Text("CLDDilAyar")
                    .font(.custom(fontsSemiBold, size: 18))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.black)
                
                VStack {
                    Text("CLDTelGuncelleme")
                        .font(.custom(fontsRegular, size: 12))
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 10)
                    
                    Text("CLDBirAdim")
                        .font(.custom(fontsRegular, size: 12))
                        .multilineTextAlignment(.center)
                    
                    Text("CLDIkiAdim")
                        .font(.custom(fontsRegular, size: 12))
                        .multilineTextAlignment(.center)
                    
                    Text("CLDHicDil")
                        .font(.custom(fontsRegular, size: 12))
                        .multilineTextAlignment(.center)
                        .padding(.top, 10)
                    
                }.foregroundStyle(.gray)
                
                Divider()
                
                Button(action: {
                    if let url = URL(string: UIApplication.openSettingsURLString) {
                        UIApplication.shared.open(url)
                    }
                    isChangeLanguageInfoDialog = false
                }, label: {
                    Text("CLDDevam")
                        .font(.custom(fontsSemiBold, size: 18))
                })
                
                Divider()
                
                Button(action: {
                    isChangeLanguageInfoDialog = false
                }, label: {
                    Text("CLDIptal")
                        .font(.custom(fontsRegular, size: 18))
                        .foregroundStyle(.black)
                })
                
                
            }.frame(maxWidth: UIScreen.main.bounds.width - 100)
                .padding(20)
                .background(.white)
                .cornerRadius(10)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color.MyColor.dialogBackgroundColor
                .ignoresSafeArea()
                .opacity(0.9)
                .onTapGesture {
                    withAnimation{
                        //isChangeLanguageInfoDialog = false
                    }
                }
        )
        
    }
}
