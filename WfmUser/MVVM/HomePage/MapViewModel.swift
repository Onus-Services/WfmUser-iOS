//
//  MapViewModel.swift
//  WfmUser
//
//  Created by Mustafa Alper Aydin on 17.03.2025.
//

import Foundation
import heresdk

class MapViewModel: ObservableObject {
    
    @Published var mapView: MapView = MapView.init(frame: .zero)
    
    init() {
        print("init - MapViewModel")
    }
}
