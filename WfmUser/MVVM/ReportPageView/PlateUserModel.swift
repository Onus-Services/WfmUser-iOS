//
//  PlateUserModel.swift
//  WfmAdmin
//
//  Created by Mustafa Alper Aydin on 28.01.2025.
//

import Foundation

struct PlateUserModel: Codable {

    var RowNum: CLong
    var MxRoutePointBookMasterId: CLong
    var Plate: String
    var DriverId: String
    var StaffId: String
    var UserName: String
    var CurrentVehicleOwnerId: String
    var CurrentVehicleOwner: String
    var CurrentDriverOwnerId: String
    var CurrentDriverOwner: String
    var BozukAdres: String
    var Address: String
    var Latitude: Double
    var Longitude: Double
    var DriverName: String
    var DestinationDepot: String
    var ETA: String
    var PaletteCapacity: String
    var WeightCapacity: String
    var VolumeCapacity: String
    var FridgeType: String
    var VehicleType: String
    var ShiftType: String
    var Depot: String
    var Ownership: String
    var TCKN: String
    var StartDepot: String
    var PackageCapacity: String
    var DriverPhone: String
    var TotalOrder: String
    var TotalPackage: String
    var TotalPallette: String
    var TotalVolume: String
    var TotalWeight: String
    var FullCnt: String
    
    enum CodingKeys: String, CodingKey {
        case RowNum
        case MxRoutePointBookMasterId
        case Plate
        case DriverId
        case StaffId
        case UserName
        case CurrentVehicleOwnerId
        case CurrentVehicleOwner
        case CurrentDriverOwnerId
        case CurrentDriverOwner
        case BozukAdres
        case Address
        case Latitude
        case Longitude
        case DriverName
        case DestinationDepot
        case ETA
        case PaletteCapacity
        case WeightCapacity
        case VolumeCapacity
        case FridgeType
        case VehicleType
        case ShiftType
        case Depot
        case Ownership
        case TCKN
        case StartDepot
        case PackageCapacity
        case DriverPhone
        case TotalOrder
        case TotalPackage
        case TotalPallette
        case TotalVolume
        case TotalWeight
        case FullCnt
    }
    
    init(RowNum: CLong, MxRoutePointBookMasterId: CLong, Plate: String, DriverId: String, StaffId: String, UserName: String, CurrentVehicleOwnerId: String, CurrentVehicleOwner: String, CurrentDriverOwnerId: String, CurrentDriverOwner: String, BozukAdres: String, Address: String, Latitude: Double, Longitude: Double, DriverName: String, DestinationDepot: String, ETA: String, PaletteCapacity: String, WeightCapacity: String, VolumeCapacity: String, FridgeType: String, VehicleType: String, ShiftType: String, Depot: String, Ownership: String, TCKN: String, StartDepot: String, PackageCapacity: String, DriverPhone: String, TotalOrder: String, TotalPackage: String, TotalPallette: String, TotalVolume: String, TotalWeight: String, FullCnt: String) {
        self.RowNum = RowNum
        self.MxRoutePointBookMasterId = MxRoutePointBookMasterId
        self.Plate = Plate
        self.DriverId = DriverId
        self.StaffId = StaffId
        self.UserName = UserName
        self.CurrentVehicleOwnerId = CurrentVehicleOwnerId
        self.CurrentVehicleOwner = CurrentVehicleOwner
        self.CurrentDriverOwnerId = CurrentDriverOwnerId
        self.CurrentDriverOwner = CurrentDriverOwner
        self.BozukAdres = BozukAdres
        self.Address = Address
        self.Latitude = Latitude
        self.Longitude = Longitude
        self.DriverName = DriverName
        self.DestinationDepot = DestinationDepot
        self.ETA = ETA
        self.PaletteCapacity = PaletteCapacity
        self.WeightCapacity = WeightCapacity
        self.VolumeCapacity = VolumeCapacity
        self.FridgeType = FridgeType
        self.VehicleType = VehicleType
        self.ShiftType = ShiftType
        self.Depot = Depot
        self.Ownership = Ownership
        self.TCKN = TCKN
        self.StartDepot = StartDepot
        self.PackageCapacity = PackageCapacity
        self.DriverPhone = DriverPhone
        self.TotalOrder = TotalOrder
        self.TotalPackage = TotalPackage
        self.TotalPallette = TotalPallette
        self.TotalVolume = TotalVolume
        self.TotalWeight = TotalWeight
        self.FullCnt = FullCnt
        
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        RowNum = CLong(try container.decode(String.self, forKey: .RowNum)) ?? -1
        MxRoutePointBookMasterId = CLong(try container.decode(String.self, forKey: .MxRoutePointBookMasterId)) ?? -1
        Plate = try container.decode(String.self, forKey: .Plate)
        DriverId = try container.decode(String.self, forKey: .DriverId)
        StaffId = try container.decode(String.self, forKey: .StaffId)
        UserName = try container.decode(String.self, forKey: .UserName)
        CurrentVehicleOwnerId = try container.decode(String.self, forKey: .CurrentVehicleOwnerId)
        CurrentVehicleOwner = try container.decode(String.self, forKey: .CurrentVehicleOwner)
        CurrentDriverOwnerId = try container.decode(String.self, forKey: .CurrentDriverOwnerId)
        CurrentDriverOwner = try container.decode(String.self, forKey: .CurrentDriverOwner)
        BozukAdres = try container.decode(String.self, forKey: .BozukAdres)
        Address = try container.decode(String.self, forKey: .Address)
        Latitude = Double(try container.decode(String.self, forKey: .Latitude)) ?? -1.0
        Longitude = Double(try container.decode(String.self, forKey: .Longitude)) ?? -1.0
        DriverName = try container.decode(String.self, forKey: .DriverName)
        DestinationDepot = try container.decode(String.self, forKey: .DestinationDepot)
        ETA = try container.decode(String.self, forKey: .ETA)
        PaletteCapacity = try container.decode(String.self, forKey: .PaletteCapacity)
        WeightCapacity = try container.decode(String.self, forKey: .WeightCapacity)
        VolumeCapacity = try container.decode(String.self, forKey: .VolumeCapacity)
        FridgeType = try container.decode(String.self, forKey: .FridgeType)
        VehicleType = try container.decode(String.self, forKey: .VehicleType)
        ShiftType = try container.decode(String.self, forKey: .ShiftType)
        Depot = try container.decode(String.self, forKey: .Depot)
        Ownership = try container.decode(String.self, forKey: .Ownership)
        TCKN = try container.decode(String.self, forKey: .TCKN)
        StartDepot = try container.decode(String.self, forKey: .StartDepot)
        PackageCapacity = try container.decode(String.self, forKey: .PackageCapacity)
        DriverPhone = try container.decode(String.self, forKey: .DriverPhone)
        TotalOrder = try container.decode(String.self, forKey: .TotalOrder)
        TotalPackage = try container.decode(String.self, forKey: .TotalPackage)
        TotalPallette = try container.decode(String.self, forKey: .TotalPallette)
        TotalVolume = try container.decode(String.self, forKey: .TotalVolume)
        TotalWeight = try container.decode(String.self, forKey: .TotalWeight)
        FullCnt = try container.decode(String.self, forKey: .FullCnt)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(String(RowNum), forKey: .RowNum)
        try container.encode(String(MxRoutePointBookMasterId), forKey: .MxRoutePointBookMasterId)
        try container.encode(Plate, forKey: .Plate)
        try container.encode(DriverId, forKey: .DriverId)
        try container.encode(StaffId, forKey: .StaffId)
        try container.encode(UserName, forKey: .UserName)
        try container.encode(CurrentVehicleOwnerId, forKey: .CurrentVehicleOwnerId)
        try container.encode(CurrentVehicleOwner, forKey: .CurrentVehicleOwner)
        try container.encode(CurrentDriverOwnerId, forKey: .CurrentDriverOwnerId)
        try container.encode(CurrentDriverOwner, forKey: .CurrentDriverOwner)
        try container.encode(BozukAdres, forKey: .BozukAdres)
        try container.encode(Address, forKey: .Address)
        try container.encode(String(Latitude), forKey: .Latitude)
        try container.encode(String(Longitude), forKey: .Longitude)
        try container.encode(DriverName, forKey: .DriverName)
        try container.encode(DestinationDepot, forKey: .DestinationDepot)
        try container.encode(ETA, forKey: .ETA)
        try container.encode(PaletteCapacity, forKey: .PaletteCapacity)
        try container.encode(WeightCapacity, forKey: .WeightCapacity)
        try container.encode(VolumeCapacity, forKey: .VolumeCapacity)
        try container.encode(FridgeType, forKey: .FridgeType)
        try container.encode(VehicleType, forKey: .VehicleType)
        try container.encode(ShiftType, forKey: .ShiftType)
        try container.encode(Depot, forKey: .Depot)
        try container.encode(Ownership, forKey: .Ownership)
        try container.encode(TCKN, forKey: .TCKN)
        try container.encode(StartDepot, forKey: .StartDepot)
        try container.encode(PackageCapacity, forKey: .PackageCapacity)
        try container.encode(DriverPhone, forKey: .DriverPhone)
        try container.encode(TotalOrder, forKey: .TotalOrder)
        try container.encode(TotalPackage, forKey: .TotalPackage)
        try container.encode(TotalPallette, forKey: .TotalPallette)
        try container.encode(TotalVolume, forKey: .TotalVolume)
        try container.encode(TotalWeight, forKey: .TotalWeight)
        try container.encode(FullCnt, forKey: .FullCnt)
    }
    
}

var plateUserModelStr =  "[{\"RowNum\":\"1\",\"MxRoutePointBookMasterId\":\"2610329\",\"Plate\":\"07 BDU 311\",\"DriverId\":\"724636\",\"StaffId\":\"44223\",\"UserName\":\"TURAN ÖZKAN\",\"CurrentVehicleOwnerId\":\"141849\",\"CurrentVehicleOwner\":\"KOŞ (ALANYA)\",\"CurrentDriverOwnerId\":\"141849\",\"CurrentDriverOwner\":\"KOŞ (ALANYA)\",\"BozukAdres\":\"\",\"Address\":\"Elikesik Mh. Dolular Sk.  07400 Alanya Antalya\",\"Latitude\":\"36.59158\",\"Longitude\":\"31.9177\",\"DriverName\":\"\",\"DestinationDepot\":\"\",\"ETA\":\"\",\"PaletteCapacity\":\"\",\"WeightCapacity\":\"\",\"VolumeCapacity\":\"\",\"FridgeType\":\"\",\"VehicleType\":\"\",\"ShiftType\":\"\",\"Depot\":\"2522998\",\"Ownership\":\"\",\"TCKN\":\"\",\"StartDepot\":\"\",\"PackageCapacity\":\"0\",\"DriverPhone\":\"\",\"TotalOrder\":\"\",\"TotalPackage\":\"\",\"TotalPallette\":\"\",\"TotalVolume\":\"\",\"TotalWeight\":\"\",\"FullCnt\":\"1\"}]"

