//
//  RouteCalculator.swift
//  RxAdmin
//
//  Created by Banu Ortac on 25.06.2024.
//

import heresdk

// A class that creates car Routes with the HERE SDK.

/*class RouteCalculator {

    private let routingEngine: RoutingEngine

    init() {
        do {
            try routingEngine = RoutingEngine()
        } catch let engineInstantiationError {
            fatalError("Failed to initialize routing engine. Cause: \(engineInstantiationError)")
        }
    }

    func calculateRoute(start: Waypoint,
                        destination: Waypoint,
                        calculateRouteCompletionHandler: @escaping CalculateRouteCompletionHandler) {

        // A route handle is required for the DynamicRoutingEngine to get updates on traffic-optimized routes.
        var carOptions = CarOptions()
        carOptions.routeOptions.enableRouteHandle = true
        
        routingEngine.calculateRoute(with: [start, destination],
                                     carOptions: carOptions,
                                     completion: calculateRouteCompletionHandler)
    }
}*/

