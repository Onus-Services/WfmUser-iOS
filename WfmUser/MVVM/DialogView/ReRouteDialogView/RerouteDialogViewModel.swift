//
//  RerouteDialogViewModel.swift
//  Avansas-iOS
//
//  Created by Banu Ortac on 15.01.2024.
//

import Foundation

class RerouteDialogViewModel: ObservableObject {

    var dataHash : [Int : Int] = [:]
    
 
    func getDataReroute(plannedList : [PointModel])-> [String] {
       
        var data: [String] = []
        dataHash = [:]
        data.append("\(NSLocalizedString("depoyaEnYakin", comment: ""))")
        dataHash[0] = 1
        data.append("\(NSLocalizedString("depoyaEnUzak", comment: ""))")
        dataHash[1] = 2
        data.append("\(NSLocalizedString("eveEnYakin", comment: ""))")
        dataHash[2] = 3
        data.append("\(NSLocalizedString("eveEnUzak", comment: ""))")
        dataHash[3] = 4
        var k = 4
        for i in 0..<plannedList.count {
            if plannedList[i].executionStatusId != LecyStatus.olumluTeslimat && plannedList[i].executionStatusId != LecyStatus.olumluTeslimat {
                data.append(String("\(plannedList[i].sira) - \(plannedList[i].isim) - \(plannedList[i].takipId)\n\(plannedList[i].gelenAdres)"))
                dataHash[k] = Int(plannedList[i].mxRouteProcessedId)
                k = k + 1
            }
            /*if plannedList[i].ExecutionType == ExecutionTypes.islemYok && !plannedList[i].isCenterPoint() {
                data.append(String("\(plannedList[i].ListSequence!) - \(plannedList[i].Name!) - \(plannedList[i].Special1!)\n\(plannedList[i].Address!)"))
                dataHash[k] = plannedList[i].MxRouteProcessedId
                k = k + 1
            } */
        }
         
        return data
    }
    
}
