//
//  LoginUser.swift
//  WfmAdmin
//
//  Created by Mustafa Alper Aydin on 27.01.2025.
//

import Foundation

struct LoginUser : Codable, Hashable {
    
    var UserID: CLong? = -1
    var CompanyID: CLong? = -1
    var UserName: String? = ""
    var Password: String? = ""
    var SessionKey: String? = ""
    var FirstName: String? = ""
    var LastName: String? = ""
    var MxRouteId: CLong? = -1
    var MxBlockId: Int? = -1
    var MasterUserID: CLong? = -1
    var ImagePath: String? = ""
    var Phone: String? = ""
    var MobilePhone: String? = ""
    var Gender: Int? = -1
    var Birthday: String? = ""
    var Rff1: String? = ""
    var Rff2: String? = ""
    var Rff3: String? = ""
    var Rff4: String? = ""
    var IsAdmin: Int? = -1
    var InfoMail: Int? = -1
    var MxBlockColor: String? = ""
    var PointAll: Int? = -1
    var PointExecuted: Int? = -1
    var PointNotExecuted: Int? = -1
    var PlannedStartDate: String? = ""
    var PlannedFinishDate: String? = ""
    var RealStartDate: String? = ""
    var RealFinishDate: String? = ""
    var PlannedDistance: Float? = -1.0
    var PlannedMinute: Float? = -1.0
    var RealDistance: Float? = -1.0
    var RealMinute: Float? = -1.0
    var Masraf: Float? = -1.0
    var RouteStart: Int? = -1
    var RouteFinish: Int? = -1 //
    var Permission: String? = ""
    var MesaiBaslanginc: String? = ""
    var Plaka: String? = ""
    var OpenBarcodeScreen:Int? = -1
    var ActivityType: Int? = -1
    var BlockStatusId: Int? = -1
    var TotalDesi: Float? = -1.0
    var TotalPalet: Float? = -1.0
    var TotalKoli: Float? = -1.0
    var TotalKilo: Float? = -1.0
    var MxBlockName: String? = ""
    var MxBlockRef: String? = ""
    var NewTms: Int? = -1
    
    init(){
        
    }
    
    init(UserID: CLong?, CompanyID: CLong?, UserName: String?, Password: String?, SessionKey: String?, FirstName: String?, LastName: String?, MxRouteId: CLong?, MxBlockId: Int?, MasterUserID: CLong?, ImagePath: String?, Phone: String?, MobilePhone: String?, Gender: Int?, Birthday: String?, Rff1: String?, Rff2: String?, Rff3: String?, Rff4: String?, IsAdmin: Int?, InfoMail: Int?, MxBlockColor: String?, PointAll: Int?, PointExecuted: Int?, PointNotExecuted: Int?, PlannedStartDate: String?, PlannedFinishDate: String?, RealStartDate: String?, RealFinishDate: String?, PlannedDistance: Float?, PlannedMinute: Float?, RealDistance: Float?, RealMinute: Float?, Masraf: Float?, RouteStart: Int?, RouteFinish: Int?, Permission: String?, MesaiBaslanginc: String?, Plaka: String?, OpenBarcodeScreen:Int?, ActivityType: Int?, BlockStatusId: Int?, TotalDesi: Float?, TotalPalet: Float?, TotalKoli: Float?, TotalKilo: Float?, MxBlockName: String?, MxBlockRef: String?, NewTms: Int?){
        
        self.UserID = UserID
        self.CompanyID = CompanyID
        self.UserName = UserName
        self.Password = Password
        self.SessionKey = SessionKey
        self.FirstName = FirstName
        self.LastName = LastName
        self.MxRouteId = MxRouteId
        self.MxBlockId = MxBlockId
        self.MasterUserID = MasterUserID
        self.ImagePath = ImagePath
        self.Phone = Phone
        self.MobilePhone = MobilePhone
        self.Gender = Gender
        self.Birthday = Birthday
        self.Rff1 = Rff1
        self.Rff2 = Rff2
        self.Rff3 = Rff3
        self.Rff4 = Rff4
        self.IsAdmin = IsAdmin
        self.InfoMail = InfoMail
        self.MxBlockColor = MxBlockColor
        self.PointAll = PointAll
        self.PointExecuted = PointExecuted
        self.PointNotExecuted = PointNotExecuted
        self.PlannedStartDate = PlannedStartDate
        self.PlannedFinishDate = PlannedFinishDate
        self.RealStartDate = RealStartDate
        self.RealFinishDate = RealFinishDate
        self.PlannedDistance = PlannedDistance
        self.PlannedMinute = PlannedMinute
        self.RealDistance = RealDistance
        self.RealMinute = RealMinute
        self.Masraf = Masraf
        self.RouteStart = RouteStart
        self.RouteFinish = RouteFinish
        self.Permission = Permission
        self.MesaiBaslanginc = MesaiBaslanginc
        self.Plaka = Plaka
        self.OpenBarcodeScreen = OpenBarcodeScreen
        self.ActivityType = ActivityType
        self.BlockStatusId = BlockStatusId
        self.TotalDesi = TotalDesi
        self.TotalPalet = TotalPalet
        self.TotalKoli = TotalKoli
        self.TotalKilo = TotalKilo
        self.MxBlockName = MxBlockName
        self.MxBlockRef = MxBlockRef
        self.NewTms = NewTms
        
    }

}
