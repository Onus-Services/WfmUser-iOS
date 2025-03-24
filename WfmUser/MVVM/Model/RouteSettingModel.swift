//
//  RouteSettingModel.swift
//  WfmUser
//
//  Created by Mustafa Alper Aydin on 21.03.2025.
//

import Foundation

struct RouteSettingModel: Codable {
    let mxRouteSettingsID: Int
    let settingsName, mxRouteName: String
    let bolgeID, dayCount: Int
    let routeStartDate, lunchStartTime, lunchEndTime: String
    let algoType, vehicleCount, maxLoadPerVehicle, maxPointPerVehicle: Int
    let startPointBookID, endPointBooktID, startPointLocation, endPointLocation: Int
    let defaultWorkTime, startType, clusterCount, clusterID: Int
    let alternateDays, alternateDaysRatio, useCriticalVehicle, useCriticalDay: Int
    let useCriticalPoint, overtime, overtimeRatio: Int
    let slaCoefficient: Double
    let pointCountCoefficient, shiftHourCoefficient, distanceCoefficient, coefficient1: Int
    let coefficient2, coefficient3, coefficient4: Int
    let rff1, rff2, rff3, rff4: String
    let rff5, rff6, rff7, rff8: String
    let rff9, rff10: String
    let mxRouteID: Int

    enum CodingKeys: String, CodingKey {
        case mxRouteSettingsID = "MxRouteSettingsId"
        case settingsName = "SettingsName"
        case mxRouteName = "MxRouteName"
        case bolgeID = "BolgeId"
        case dayCount = "DayCount"
        case routeStartDate = "RouteStartDate"
        case lunchStartTime = "LunchStartTime"
        case lunchEndTime = "LunchEndTime"
        case algoType = "AlgoType"
        case vehicleCount = "VehicleCount"
        case maxLoadPerVehicle = "MaxLoadPerVehicle"
        case maxPointPerVehicle = "MaxPointPerVehicle"
        case startPointBookID = "StartPointBookId"
        case endPointBooktID = "EndPointBooktId"
        case startPointLocation = "StartPointLocation"
        case endPointLocation = "EndPointLocation"
        case defaultWorkTime = "DefaultWorkTime"
        case startType = "StartType"
        case clusterCount = "ClusterCount"
        case clusterID = "ClusterId"
        case alternateDays = "AlternateDays"
        case alternateDaysRatio = "AlternateDaysRatio"
        case useCriticalVehicle = "UseCriticalVehicle"
        case useCriticalDay = "UseCriticalDay"
        case useCriticalPoint = "UseCriticalPoint"
        case overtime = "Overtime"
        case overtimeRatio = "OvertimeRatio"
        case slaCoefficient = "SLACoefficient"
        case pointCountCoefficient = "PointCountCoefficient"
        case shiftHourCoefficient = "ShiftHourCoefficient"
        case distanceCoefficient = "DistanceCoefficient"
        case coefficient1 = "Coefficient1"
        case coefficient2 = "Coefficient2"
        case coefficient3 = "Coefficient3"
        case coefficient4 = "Coefficient4"
        case rff1 = "RFF1"
        case rff2 = "RFF2"
        case rff3 = "RFF3"
        case rff4 = "RFF4"
        case rff5 = "RFF5"
        case rff6 = "RFF6"
        case rff7 = "RFF7"
        case rff8 = "RFF8"
        case rff9 = "RFF9"
        case rff10 = "RFF10"
        case mxRouteID = "MxRouteId"
    }
}

var routeSettingStr = "[{\"MxRouteSettingsId\":0,\"SettingsName\":\"\",\"MxRouteName\":\"Kadroya göre\",\"BolgeId\":0,\"DayCount\":6,\"RouteStartDate\":\"2024-04-01\",\"LunchStartTime\":\"\",\"LunchEndTime\":\"\",\"AlgoType\":2,\"VehicleCount\":4,\"MaxLoadPerVehicle\":0.00,\"MaxPointPerVehicle\":0,\"StartPointBookId\":2522998,\"EndPointBooktId\":2522998,\"StartPointLocation\":0,\"EndPointLocation\":0,\"DefaultWorkTime\":8,\"StartType\":2,\"ClusterCount\":3,\"ClusterId\":3,\"AlternateDays\":3,\"AlternateDaysRatio\":0,\"UseCriticalVehicle\":0,\"UseCriticalDay\":0,\"UseCriticalPoint\":0,\"Overtime\":0,\"OvertimeRatio\":0,\"SLACoefficient\":0.25,\"PointCountCoefficient\":0,\"ShiftHourCoefficient\":0,\"DistanceCoefficient\":1.00,\"Coefficient1\":0,\"Coefficient2\":0,\"Coefficient3\":0,\"Coefficient4\":0,\"RFF1\":\"car|shortest|traffic:disabled|41.048894106923,29.0297955323849;41.0422266650066,29.0385502626095!#41.0924424043998,29.0570089532528;41.0903562476074,29.0660375405941!#41.0282585514274,28.9885340930853;40.9796137510066,29.0063868762884!#41.205280,29.105950;41.200031,29.119160!#40.766716,29.517359;40.739343,29.513945!|##boatFerry:-3;#||\",\"RFF2\":\"1\",\"RFF3\":\"0\",\"RFF4\":\"0\",\"RFF5\":\"2\",\"RFF6\":\"0\",\"RFF7\":\"1\",\"RFF8\":\"\",\"RFF9\":\"0\",\"RFF10\":\"0#0#0#1#1\",\"MxRouteId\":60142}]"
