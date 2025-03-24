//
//  MainPageViewModel.swift
//  WfmAdmin
//
//  Created by Mustafa Alper Aydin on 27.01.2025.
//

import Foundation

class MainPageViewModel: ObservableObject {
    
    @Published var mainPageType: MainPageTypes = .anasayfa
    
    @Published var isLogoutDialog: Bool = false
    @Published var isChangeLanguageInfoDialog: Bool = false
}




enum MainPageTypes {
    case anasayfa
    case haftalikPlan
    case raporlar
    case aylik
}
