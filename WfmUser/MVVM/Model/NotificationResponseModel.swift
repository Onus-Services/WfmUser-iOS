//
//  NotificationResponseModel.swift
//  WfmAdmin
//
//  Created by Mustafa Alper Aydin on 27.01.2025.
//

import Foundation

struct NotificationResponseModel : Codable, Hashable{
    
    var Type1: Int? = -1
    var MxRouteId: Int? = -1
    var MxBlockId: Int? = -1
    var BlockStatusId: Int? = -1
    var BlockExecutionStatusId: Int? = -1
    var BlockActionDesc: String? = ""
    var PointStatusId: Int? = -1
    var PointId: Int? = -1
    var Show: Int? = -1
    var ActionDesc: String? = ""
    var UseSandBox: Int? = -1
    var ExecutionType: Int? = -1

    init(){ }
    
    init(Type1: Int?, MxRouteId: Int?, MxBlockId: Int?, BlockStatusId: Int?, BlockExecutionStatusId: Int?, BlockActionDesc: String?, PointStatusId: Int?, PointId: Int?, Show: Int?, ActionDesc: String?, UseSandBox: Int?, ExecutionType: Int?){
        
        self.Type1 = Type1
        self.MxRouteId = MxRouteId
        self.MxBlockId = MxBlockId
        self.BlockStatusId = BlockStatusId
        self.BlockExecutionStatusId = BlockExecutionStatusId
        self.BlockActionDesc = BlockActionDesc
        self.PointStatusId = PointStatusId
        self.PointId = PointId
        self.Show = Show
        self.ActionDesc = ActionDesc
        self.UseSandBox = UseSandBox
        self.ExecutionType = ExecutionType
    
    }
    
    enum CodingKeys: String, CodingKey {
        
        case Type1 = "Type"
        case MxRouteId, MxBlockId, BlockStatusId, BlockExecutionStatusId, BlockActionDesc, PointStatusId, PointId, Show, ActionDesc, UseSandBox, ExecutionType
        
    }
}


///notificationName
extension Notification.Name {
    
    //
    static let notification2 = Notification.Name("notification_2") //iş listesini güncelle
    static let notification3 = Notification.Name("notification_3") //sefer iptal edildi
}
