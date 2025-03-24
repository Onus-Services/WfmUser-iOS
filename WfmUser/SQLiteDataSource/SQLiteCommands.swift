//
//  SQLiteCommands.swift
//  Avansas-iOS
//
//  Created by Banu Ortac on 8.01.2024.
//

import Foundation
import SQLite

class SQLiteCommands {
    
    //Tables
    static var userTable = Table("userTable")
    static var pointTable = Table("pointTable")
    //Expressions
    
    //(user)
    static let UserID = Expression<CLong?>("UserID")
    static let CompanyID = Expression<CLong?>("CompanyID")
    static let UserName = Expression<String?>("UserName")
    static let Password = Expression<String?>("Password")
    static let SessionKey = Expression<String?>("SessionKey")
    static let FirstName = Expression<String?>("FirstName")
    static let LastName = Expression<String?>("LastName")
    static let MxRouteId = Expression<CLong?>("MxRouteId")
    static let MxBlockId = Expression<Int?>("MxBlockId")
    static let MasterUserID = Expression<CLong?>("MasterUserID")
    static let ImagePath = Expression<String?>("ImagePath")
    static let Phone = Expression<String?>("Phone")
    static let MobilePhone = Expression<String?>("MobilePhone")
    static let Gender = Expression<Int?>("Gender")
    static let Birthday = Expression<String?>("Birthday")
    static let Rff1 = Expression<String?>("Rff1")
    static let Rff2 = Expression<String?>("Rff2")
    static let Rff3 = Expression<String?>("Rff3")
    static let Rff4 = Expression<String?>("Rff4")
    static let IsAdmin = Expression<Int?>("IsAdmin")
    static let InfoMail = Expression<Int?>("InfoMail")
    static let MxBlockColor = Expression<String?>("MxBlockColor")
    static let PointAll = Expression<Int?>("PointAll")
    static let PointExecuted = Expression<Int?>("PointExecuted")
    static let PointNotExecuted = Expression<Int?>("PointNotExecuted")
    static let PlannedStartDate = Expression<String?>("PlannedStartDate")
    static let PlannedFinishDate = Expression<String?>("PlannedFinishDate")
    static let RealStartDate = Expression<String?>("RealStartDate")
    static let RealFinishDate = Expression<String?>("RealFinishDate")
    static let PlannedDistance = Expression<Double?>("PlannedDistance")
    static let PlannedMinute = Expression<Double?>("PlannedMinute")
    static let RealDistance = Expression<Double?>("RealDistance")
    static let RealMinute = Expression<Double?>("RealMinute")
    static let Masraf = Expression<Double?>("Masraf")
    static let RouteStart = Expression<Int?>("RouteStart")
    static let RouteFinish = Expression<Int?>("RouteFinish")
    static let Permission = Expression<String?>("Permission")
    static let MesaiBaslanginc = Expression<String?>("MesaiBaslanginc")
    static let Plaka = Expression<String?>("Plaka")
    static let OpenBarcodeScreen = Expression<Int?>("OpenBarcodeScreen")
    static let ActivityType = Expression<Int?>("ActivityType")
    static let BlockStatusId = Expression<Int?>("BlockStatusId")
    static let TotalDesi = Expression<Double?>("TotalDesi")
    static let TotalPalet = Expression<Double?>("TotalPalet")
    static let TotalKoli = Expression<Double?>("TotalKoli")
    static let TotalKilo = Expression<Double?>("TotalKilo")
    static let MxBlockName = Expression<String?>("MxBlockName")
    static let MxBlockRef = Expression<String?>("MxBlockRef")
    static let NewTms = Expression<Int?>("NewTms")
    
    
    static let id = Expression<String>("id")
    static let sira = Expression<String>("sira")
    static let baslangicZamani = Expression<String>("baslangicZamani")
    static let calismaSuresiDK = Expression<String>("calismaSuresiDK")
    static let bitisZamani = Expression<String>("bitisZamani")
    static let isim = Expression<String>("isim")
    static let gelenAdres = Expression<String>("gelenAdres")
    static let score = Expression<String>("score")
    static let arac = Expression<String>("arac")
    static let baslangicNoktasi = Expression<String>("baslangicNoktasi")
    static let bitisNoktasi = Expression<String>("bitisNoktasi")
    static let mesafeKM = Expression<String>("mesafeKM")
    static let masraf = Expression<String>("masraf")
    static let sureDK = Expression<String>("sureDK")
    static let enlem = Expression<String>("enlem")
    static let boylam = Expression<String>("boylam")
    static let takipId = Expression<String>("takipId")
    static let tip = Expression<String>("tip")
    static let frekans = Expression<String>("frekans")
    static let sla = Expression<String>("sla")
    static let kritikGun = Expression<String>("kritikGun")
    static let kritikArac = Expression<String>("kritikArac")
    static let kritikNokta = Expression<String>("kritikNokta")
    static let adet = Expression<String>("adet")
    static let kg = Expression<String>("kg")
    static let hacim = Expression<String>("hacim")
    static let noktaninAracTipi = Expression<String>("noktaninAracTipi")
    static let maxAdet = Expression<String>("maxAdet")
    static let maxKG = Expression<String>("maxKG")
    static let maxHacim = Expression<String>("maxHacim")
    static let aracTipi = Expression<String>("aracTipi")
    static let rotaNo = Expression<String>("rotaNo")
    static let referansNo = Expression<String>("referansNo")
    static let kmAvantaj = Expression<String>("kmAvantaj")
    static let maliyet = Expression<String>("maliyet")
    static let kmMaliyet = Expression<String>("kmMaliyet")
    static let barkod = Expression<String>("barkod")
    static let siparisNotu = Expression<String>("siparisNotu")
    static let siparisTarihi = Expression<String>("siparisTarihi")
    static let mesaiSuresi = Expression<String>("mesaiSuresi")
    static let haftaninGunu = Expression<String>("haftaninGunu")
    static let haftaNo = Expression<String>("haftaNo")
    static let il = Expression<String>("il")
    static let ilce = Expression<String>("ilce")
    static let mahalle = Expression<String>("mahalle")
    static let mxBlockId = Expression<String>("mxBlockId")
    static let blockColor = Expression<String>("blockColor")
    static let vehicleColor = Expression<String>("vehicleColor")
    static let mxRoutePointsId = Expression<String>("mxRoutePointsId")
    static let slot = Expression<String>("slot")
    static let temsilciAdi = Expression<String>("temsilciAdi")
    static let degerDesi = Expression<String>("degerDesi")
    static let isRspNavigated = Expression<String>("isRspNavigated")
    static let vehicleId = Expression<String>("vehicleId")
    static let realPalet = Expression<String>("realPalet")
    static let slaWaitTime = Expression<String>("slaWaitTime")
    static let tacoWaitTime = Expression<String>("tacoWaitTime")
    static let mxRouteProcessedId = Expression<String>("mxRouteProcessedId")
    static let bayi = Expression<String>("bayi")
    static let bolge = Expression<String>("bolge")
    static let guzergah = Expression<String>("guzergah")
    static let maxPalet = Expression<String>("maxPalet")
    static let rotaBaslangicTarih = Expression<String>("rotaBaslangicTarih")
    static let odemeTipi = Expression<String>("odemeTipi")
    static let nitelik15 = Expression<String>("nitelik15")
    static let nitelik16 = Expression<String>("nitelik16")
    static let rff10 = Expression<String>("rff10")
    static let rff1 = Expression<String>("rff1")
    static let rff2 = Expression<String>("rff2")
    static let executionStatusId = Expression<Int?>("executionStatusId")

    
    
    //Creating NewTables
    static func createTable(){
        createUserTable()
        createPointTable()
        
    }

    //***********Creating****************
    //Creating User Table
    static func createUserTable() {
        guard let database = SQLiteDatabase.sharedInstance.database else {
            print("Datastore connection error")
            return
        }
        do {
            //ifNotExists: true Will NOT create a table if it already exists
            try database.run(userTable.create(ifNotExists: true) { userTable in
                userTable.column(UserID)
                userTable.column(CompanyID)
                userTable.column(UserName)
                userTable.column(Password)
                userTable.column(SessionKey)
                userTable.column(FirstName)
                userTable.column(LastName)
                userTable.column(MxRouteId)
                userTable.column(MxBlockId)
                userTable.column(MasterUserID)
                userTable.column(ImagePath)
                userTable.column(Phone)
                userTable.column(MobilePhone)
                userTable.column(Gender)
                userTable.column(Birthday)
                userTable.column(Rff1)
                userTable.column(Rff2)
                userTable.column(Rff3)
                userTable.column(Rff4)
                userTable.column(IsAdmin)
                userTable.column(InfoMail)
                userTable.column(MxBlockColor)
                userTable.column(PointAll)
                userTable.column(PointExecuted)
                userTable.column(PointNotExecuted)
                userTable.column(PlannedStartDate)
                userTable.column(PlannedFinishDate)
                userTable.column(RealStartDate)
                userTable.column(RealFinishDate)
                userTable.column(PlannedDistance)
                userTable.column(PlannedMinute)
                userTable.column(RealDistance)
                userTable.column(RealMinute)
                userTable.column(Masraf)
                userTable.column(RouteStart)
                userTable.column(RouteFinish)
                userTable.column(Permission)
                userTable.column(MesaiBaslanginc)
                userTable.column(Plaka)
                userTable.column(OpenBarcodeScreen)
                userTable.column(ActivityType)
                userTable.column(BlockStatusId)
                userTable.column(TotalDesi)
                userTable.column(TotalPalet)
                userTable.column(TotalKoli)
                userTable.column(TotalKilo)
                userTable.column(MxBlockName)
                userTable.column(MxBlockRef)
                userTable.column(NewTms)
            })
        }catch {
            print("userTable already exists: \(error)")
        } 
    }
    
    static func createPointTable(){
        guard let database = SQLiteDatabase.sharedInstance.database else {
            print("Datastore connection error")
            return
        }
        do {
            //ifNotExists: true Will NOT create a table if it already exists
            try database.run(pointTable.create(ifNotExists: true) { pointTable in
                pointTable.column(id)
                pointTable.column(sira)
                pointTable.column(baslangicZamani)
                pointTable.column(calismaSuresiDK)
                pointTable.column(bitisZamani)
                pointTable.column(isim)
                pointTable.column(gelenAdres)
                pointTable.column(score)
                pointTable.column(arac)
                pointTable.column(baslangicNoktasi)
                pointTable.column(bitisNoktasi)
                pointTable.column(mesafeKM)
                pointTable.column(masraf)
                pointTable.column(sureDK)
                pointTable.column(enlem)
                pointTable.column(boylam)
                pointTable.column(takipId)
                pointTable.column(tip)
                pointTable.column(frekans)
                pointTable.column(sla)
                pointTable.column(kritikGun)
                pointTable.column(kritikArac)
                pointTable.column(kritikNokta)
                pointTable.column(adet)
                pointTable.column(kg)
                pointTable.column(hacim)
                pointTable.column(noktaninAracTipi)
                pointTable.column(maxAdet)
                pointTable.column(maxKG)
                pointTable.column(maxHacim)
                pointTable.column(aracTipi)
                pointTable.column(rotaNo)
                pointTable.column(referansNo)
                pointTable.column(kmAvantaj)
                pointTable.column(maliyet)
                pointTable.column(kmMaliyet)
                pointTable.column(barkod)
                pointTable.column(siparisNotu)
                pointTable.column(siparisTarihi)
                pointTable.column(mesaiSuresi)
                pointTable.column(haftaninGunu)
                pointTable.column(haftaNo)
                pointTable.column(il)
                pointTable.column(ilce)
                pointTable.column(mahalle)
                pointTable.column(mxBlockId)
                pointTable.column(blockColor)
                pointTable.column(vehicleColor)
                pointTable.column(mxRoutePointsId)
                pointTable.column(slot)
                pointTable.column(temsilciAdi)
                pointTable.column(degerDesi)
                pointTable.column(isRspNavigated)
                pointTable.column(vehicleId)
                pointTable.column(realPalet)
                pointTable.column(slaWaitTime)
                pointTable.column(tacoWaitTime)
                pointTable.column(mxRouteProcessedId)
                pointTable.column(bayi)
                pointTable.column(bolge)
                pointTable.column(guzergah)
                pointTable.column(maxPalet)
                pointTable.column(rotaBaslangicTarih)
                pointTable.column(odemeTipi)
                pointTable.column(nitelik15)
                pointTable.column(nitelik16)
                pointTable.column(rff10)
                pointTable.column(rff1)
                pointTable.column(rff2)
                pointTable.column(executionStatusId)
                
            })
             
        }catch {
            print("userTable already exists: \(error)")
        }
            
    }
    
    
    //****************Inserting******************
    
    static func insertUser(_ contactValues: LoginUser) -> Bool? {
        guard let database =
                SQLiteDatabase.sharedInstance.database else {
            print("Datastore connection error")
            return nil
        }
        
        do {
            try database.run(userTable.delete())
            try database.run(userTable.insert(
                UserID <- contactValues.UserID,
                CompanyID <- contactValues.CompanyID,
                UserName <- contactValues.UserName,
                Password <- contactValues.Password,
                SessionKey <- contactValues.SessionKey,
                FirstName <- contactValues.FirstName,
                LastName <- contactValues.LastName,
                MxRouteId <- contactValues.MxRouteId,
                MxBlockId <- contactValues.MxBlockId,
                MasterUserID <- contactValues.MasterUserID,
                ImagePath <- contactValues.ImagePath,
                Phone <- contactValues.Phone,
                MobilePhone <- contactValues.MobilePhone,
                Gender <- contactValues.Gender,
                Birthday <- contactValues.Birthday,
                Rff1 <- contactValues.Rff1,
                Rff2 <- contactValues.Rff2,
                Rff3 <- contactValues.Rff3,
                Rff4 <- contactValues.Rff4,
                IsAdmin <- contactValues.IsAdmin,
                InfoMail <- contactValues.InfoMail,
                MxBlockColor <- contactValues.MxBlockColor,
                PointAll <- contactValues.PointAll,
                PointExecuted <- contactValues.PointExecuted,
                PointNotExecuted <- contactValues.PointNotExecuted,
                PlannedStartDate <- contactValues.PlannedStartDate,
                PlannedFinishDate <- contactValues.PlannedFinishDate,
                RealStartDate <- contactValues.RealStartDate,
                RealFinishDate <- contactValues.RealFinishDate,
                PlannedDistance <- Double(contactValues.PlannedDistance ?? -1.0),
                PlannedMinute <- Double(contactValues.PlannedMinute ?? -1.0),
                RealDistance <- Double(contactValues.RealDistance ?? -1.0),
                RealMinute <- Double(contactValues.RealMinute ?? -1.0),
                Masraf <- Double(contactValues.Masraf ?? -1.0),
                RouteStart <- contactValues.RouteStart,
                RouteFinish <- contactValues.RouteFinish,
                Permission <- contactValues.Permission,
                MesaiBaslanginc <- contactValues.MesaiBaslanginc,
                Plaka <- contactValues.Plaka,
                OpenBarcodeScreen <- contactValues.OpenBarcodeScreen,
                ActivityType <- contactValues.ActivityType,
                BlockStatusId <- contactValues.BlockStatusId,
                TotalDesi <- Double(contactValues.TotalDesi ?? -1.0),
                TotalPalet <- Double(contactValues.TotalPalet ?? -1.0),
                TotalKoli <- Double(contactValues.TotalKoli ?? -1.0),
                TotalKilo <- Double(contactValues.TotalKilo ?? -1.0),
                MxBlockName <- contactValues.MxBlockName,
                MxBlockRef <- contactValues.MxBlockRef,
                NewTms <- contactValues.NewTms))
            return true
        }catch let error {
            print("Inserting User Row failed: \(error)")
            return false
        }
    }
    
    static func insertPointArray(_ contactValues: [PointModel]) -> Bool? {
        guard let database = SQLiteDatabase.sharedInstance.database else {
            print("Datastore connection error")
            return nil
        }

        do {
            try database.run(pointTable.delete())
            print("insertPointArray1 - \(contactValues.count)")
            for contactV in try contactValues {
                insertPoint(contactV)
            }

        } catch let error {
            print("Updating User Row failed: \(error)")
            return false
        }
        return true
    }
    
    static func insertPoint(_ contactValues: PointModel) -> Bool? {
        guard let database =
                SQLiteDatabase.sharedInstance.database else {
            print("Datastore connection error")
            return nil
        }
        
        do {
            try database.run(pointTable.insert(
                id <- contactValues.id,
                sira <- contactValues.sira,
                baslangicZamani <- contactValues.baslangicZamani,
                calismaSuresiDK <- contactValues.calismaSuresiDK,
                bitisZamani <- contactValues.bitisZamani,
                isim <- contactValues.isim,
                gelenAdres <- contactValues.gelenAdres,
                score <- contactValues.score,
                arac <- contactValues.arac,
                baslangicNoktasi <- contactValues.baslangicNoktasi,
                bitisNoktasi <- contactValues.bitisNoktasi,
                mesafeKM <- contactValues.mesafeKM,
                masraf <- contactValues.masraf,
                sureDK <- contactValues.sureDK,
                enlem <- contactValues.enlem,
                boylam <- contactValues.boylam,
                takipId <- contactValues.takipId,
                tip <- contactValues.tip,
                frekans <- contactValues.frekans,
                sla <- contactValues.sla,
                kritikGun <- contactValues.kritikGun,
                kritikArac <- contactValues.kritikArac,
                kritikNokta <- contactValues.kritikNokta,
                adet <- contactValues.adet,
                kg <- contactValues.kg,
                hacim <- contactValues.hacim,
                noktaninAracTipi <- contactValues.noktaninAracTipi,
                maxAdet <- contactValues.maxAdet,
                maxKG <- contactValues.maxKG,
                maxHacim <- contactValues.maxHacim,
                aracTipi <- contactValues.aracTipi,
                rotaNo <- contactValues.rotaNo,
                referansNo <- contactValues.referansNo,
                kmAvantaj <- contactValues.kmAvantaj,
                maliyet <- contactValues.maliyet,
                kmMaliyet <- contactValues.kmMaliyet,
                barkod <- contactValues.barkod,
                siparisNotu <- contactValues.siparisNotu,
                siparisTarihi <- contactValues.siparisTarihi,
                mesaiSuresi <- contactValues.mesaiSuresi,
                haftaninGunu <- contactValues.haftaninGunu,
                haftaNo <- contactValues.haftaNo,
                il <- contactValues.il,
                ilce <- contactValues.ilce,
                mahalle <- contactValues.mahalle,
                mxBlockId <- contactValues.mxBlockId,
                blockColor <- contactValues.blockColor,
                vehicleColor <- contactValues.vehicleColor,
                mxRoutePointsId <- contactValues.mxRoutePointsId,
                slot <- contactValues.slot,
                temsilciAdi <- contactValues.temsilciAdi,
                degerDesi <- contactValues.degerDesi,
                isRspNavigated <- contactValues.isRspNavigated,
                vehicleId <- contactValues.vehicleId,
                realPalet <- contactValues.realPalet,
                slaWaitTime <- contactValues.slaWaitTime,
                tacoWaitTime <- contactValues.tacoWaitTime,
                mxRouteProcessedId <- contactValues.mxRouteProcessedId,
                bayi <- contactValues.bayi,
                bolge <- contactValues.bolge,
                guzergah <- contactValues.guzergah,
                maxPalet <- contactValues.maxPalet,
                rotaBaslangicTarih <- contactValues.rotaBaslangicTarih,
                odemeTipi <- contactValues.odemeTipi,
                nitelik15 <- contactValues.nitelik15,
                nitelik16 <- contactValues.nitelik16,
                rff10 <- contactValues.rff10,
                rff1 <- contactValues.rff1,
                rff2 <- contactValues.rff2,
                executionStatusId <- contactValues.executionStatusId))
            
            return true
        }catch let error {
            print("Inserting User Row failed: \(error)")
            return false
        }
    }
    
    
    //***************Getting******************
    
    static func getUser(type: Int?) -> LoginUser? {
        guard let database = SQLiteDatabase.sharedInstance.database else {
            print("Datastore connection error")
            return nil
        }
        //User Object
        var userObject: LoginUser = LoginUser()
        
        do {
            for user in try database.prepare(userTable) {
                let UserID = user[UserID]
                let CompanyID = user[CompanyID]
                let UserName = user[UserName]
                let Password = user[Password]
                let SessionKey = user[SessionKey]
                let FirstName = user[FirstName]
                let LastName = user[LastName]
                let MxRouteId = user[MxRouteId]
                let MxBlockId = user[MxBlockId]
                let MasterUserID = user[MasterUserID]
                let ImagePath = user[ImagePath]
                let Phone = user[Phone]
                let MobilePhone = user[MobilePhone]
                let Gender = user[Gender]
                let Birthday = user[Birthday]
                let Rff1 = user[Rff1]
                let Rff2 = user[Rff2]
                let Rff3 = user[Rff3]
                let Rff4 = user[Rff4]
                let IsAdmin = user[IsAdmin]
                let InfoMail = user[InfoMail]
                let MxBlockColor = user[MxBlockColor]
                let PointAll = user[PointAll]
                let PointExecuted = user[PointExecuted]
                let PointNotExecuted = user[PointNotExecuted]
                let PlannedStartDate = user[PlannedStartDate]
                let PlannedFinishDate = user[PlannedFinishDate]
                let RealStartDate = user[RealStartDate]
                let RealFinishDate = user[RealFinishDate]
                let PlannedDistance = user[PlannedDistance]
                let PlannedMinute = user[PlannedMinute]
                let RealDistance = user[RealDistance]
                let RealMinute = user[RealMinute]
                let Masraf = user[Masraf]
                let RouteStart = user[RouteStart]
                let RouteFinish = user[RouteFinish]
                let Permission = user[Permission]
                let MesaiBaslanginc = user[MesaiBaslanginc]
                let Plaka = user[Plaka]
                let OpenBarcodeScreen = user[OpenBarcodeScreen]
                let ActivityType = user[ActivityType]
                let BlockStatusId = user[BlockStatusId]
                let TotalDesi = user[TotalDesi]
                let TotalPalet = user[TotalPalet]
                let TotalKoli = user[TotalKoli]
                let TotalKilo = user[TotalKilo]
                let MxBlockName = user[MxBlockName]
                let MxBlockRef = user[MxBlockRef]
                let NewTms = user[NewTms]
                
                userObject = LoginUser(UserID: UserID, CompanyID: CompanyID, UserName: UserName, Password: Password, SessionKey: SessionKey, FirstName: FirstName, LastName: LastName, MxRouteId: MxRouteId, MxBlockId: MxBlockId, MasterUserID: MasterUserID, ImagePath: ImagePath, Phone: Phone, MobilePhone: MobilePhone, Gender: Gender, Birthday: Birthday, Rff1: Rff1, Rff2: Rff2, Rff3: Rff3, Rff4: Rff4, IsAdmin: IsAdmin, InfoMail: InfoMail, MxBlockColor: MxBlockColor, PointAll: PointAll, PointExecuted: PointExecuted, PointNotExecuted: PointNotExecuted, PlannedStartDate: PlannedStartDate, PlannedFinishDate: PlannedFinishDate, RealStartDate: RealStartDate, RealFinishDate: RealFinishDate, PlannedDistance: Float(PlannedDistance ?? -1.0), PlannedMinute: Float(PlannedMinute ?? -1.0), RealDistance: Float(RealDistance ?? -1.0), RealMinute: Float(RealMinute ?? -1.0), Masraf: Float(Masraf ?? -1.0), RouteStart: RouteStart, RouteFinish: RouteFinish, Permission: Permission, MesaiBaslanginc: MesaiBaslanginc, Plaka: Plaka, OpenBarcodeScreen: OpenBarcodeScreen, ActivityType: ActivityType, BlockStatusId: BlockStatusId, TotalDesi: Float(TotalDesi ?? -1.0), TotalPalet: Float(TotalPalet ?? -1.0), TotalKoli: Float(TotalKoli ?? -1.0), TotalKilo: Float(TotalKilo ?? -1.0), MxBlockName: MxBlockName, MxBlockRef: MxBlockRef, NewTms: NewTms)

            }
            
        }catch{
            return nil
        }
        return userObject
        
    }
    
    static func getPointModelArray() -> [PointModel]? {
        guard let database = SQLiteDatabase.sharedInstance.database else {
            print("Datastore connection error")
            return nil
        }
        
        var pointArray : [PointModel] = []
        
        do {
            for point in try database.prepare(pointTable) {
                let id = point[id]
                let sira = point[sira]
                let baslangicZamani = point[baslangicZamani]
                let calismaSuresiDK = point[calismaSuresiDK]
                let bitisZamani = point[bitisZamani]
                let isim = point[isim]
                let gelenAdres = point[gelenAdres]
                let score = point[score]
                let arac = point[arac]
                let baslangicNoktasi = point[baslangicNoktasi]
                let bitisNoktasi = point[bitisNoktasi]
                let mesafeKM = point[mesafeKM]
                let masraf = point[masraf]
                let sureDK = point[sureDK]
                let enlem = point[enlem]
                let boylam = point[boylam]
                let takipId = point[takipId]
                let tip = point[tip]
                let frekans = point[frekans]
                let sla = point[sla]
                let kritikGun = point[kritikGun]
                let kritikArac = point[kritikArac]
                let kritikNokta = point[kritikNokta]
                let adet = point[adet]
                let kg = point[kg]
                let hacim = point[hacim]
                let noktaninAracTipi = point[noktaninAracTipi]
                let maxAdet = point[maxAdet]
                let maxKG = point[maxKG]
                let maxHacim = point[maxHacim]
                let aracTipi = point[aracTipi]
                let rotaNo = point[rotaNo]
                let referansNo = point[referansNo]
                let kmAvantaj = point[kmAvantaj]
                let maliyet = point[maliyet]
                let kmMaliyet = point[kmMaliyet]
                let barkod = point[barkod]
                let siparisNotu = point[siparisNotu]
                let siparisTarihi = point[siparisTarihi]
                let mesaiSuresi = point[mesaiSuresi]
                let haftaninGunu = point[haftaninGunu]
                let haftaNo = point[haftaNo]
                let il = point[il]
                let ilce = point[ilce]
                let mahalle = point[mahalle]
                let mxBlockId = point[mxBlockId]
                let blockColor = point[blockColor]
                let vehicleColor = point[vehicleColor]
                let mxRoutePointsId = point[mxRoutePointsId]
                let slot = point[slot]
                let temsilciAdi = point[temsilciAdi]
                let degerDesi = point[degerDesi]
                let isRspNavigated = point[isRspNavigated]
                let vehicleId = point[vehicleId]
                let realPalet = point[realPalet]
                let slaWaitTime = point[slaWaitTime]
                let tacoWaitTime = point[tacoWaitTime]
                let mxRouteProcessedId = point[mxRouteProcessedId]
                let bayi = point[bayi]
                let bolge = point[bolge]
                let guzergah = point[guzergah]
                let maxPalet = point[maxPalet]
                let rotaBaslangicTarih = point[rotaBaslangicTarih]
                let odemeTipi = point[odemeTipi]
                let nitelik15 = point[nitelik15]
                let nitelik16 = point[nitelik16]
                let rff10 = point[rff10]
                let rff1 = point[rff1]
                let rff2 = point[rff2]
                let executionStatusId = point[executionStatusId]
                
                pointArray.append(PointModel(sira: sira, baslangicZamani: baslangicZamani, calismaSuresiDK: calismaSuresiDK, bitisZamani: bitisZamani, isim: isim, gelenAdres: gelenAdres, score: score, arac: arac, baslangicNoktasi: baslangicNoktasi, bitisNoktasi: bitisNoktasi, mesafeKM: mesafeKM, masraf: masraf, sureDK: sureDK, enlem: enlem, boylam: boylam, takipId: takipId, tip: tip, frekans: frekans, sla: sla, kritikGun: kritikGun, kritikArac: kritikArac, kritikNokta: kritikNokta, adet: adet, kg: kg, hacim: hacim, noktaninAracTipi: noktaninAracTipi, maxAdet: maxAdet, maxKG: maxKG, maxHacim: maxHacim, aracTipi: aracTipi, rotaNo: rotaNo, referansNo: referansNo, kmAvantaj: kmAvantaj, maliyet: maliyet, kmMaliyet: kmMaliyet, barkod: barkod, siparisNotu: siparisNotu, siparisTarihi: siparisTarihi, mesaiSuresi: mesaiSuresi, haftaninGunu: haftaninGunu, haftaNo: haftaNo, il: il, ilce: ilce, mahalle: mahalle, mxBlockId: mxBlockId, blockColor: blockColor, vehicleColor: vehicleColor, mxRoutePointsId: mxRoutePointsId, slot: slot, temsilciAdi: temsilciAdi, degerDesi: degerDesi, isRspNavigated: isRspNavigated, vehicleId: vehicleId, realPalet: realPalet, slaWaitTime: slaWaitTime, tacoWaitTime: tacoWaitTime, mxRouteProcessedId: mxRouteProcessedId, bayi: bayi, bolge: bolge, guzergah: guzergah, maxPalet: maxPalet, rotaBaslangicTarih: rotaBaslangicTarih, odemeTipi: odemeTipi, nitelik15: nitelik15, nitelik16: nitelik16, rff10: rff10, rff1: rff1, rff2: rff2, executionStatusId: executionStatusId))
            }
        }catch{
            print("getPointModelArray33")
            return nil
        }
        return pointArray
        
    }
        
    //**************Deleting*****************
    
    
    static func deleteTable() -> Bool? {
        guard let database =
                SQLiteDatabase.sharedInstance.database else {
            print("Datastore connection error")
            return nil
        }
        
        do {
            try database.run(userTable.delete())
            try database.run(pointTable.delete())
            
            return true
        }catch let error {
            print("delete Table: \(error)")
            return false
        }
    }
    
    static func deletePointTable() -> Bool? {
        guard let database =
                SQLiteDatabase.sharedInstance.database else {
            print("Datastore connection error")
            return nil
        }
        
        do {
            try database.run(pointTable.delete())
            
            return true
        }catch let error {
            print("delete Table: \(error)")
            return false
        }
    }
    
    //************Updating**********
    
    
    static func pointStatus(point: PointModel) -> Bool?{
        guard let database = SQLiteDatabase.sharedInstance.database else {
            print("Datastore connection error")
            return nil
        }
        
        do {
            if try database.run(pointTable.update(executionStatusId <- point.executionStatusId)) > 0 {
                print("Updated canWork")
                return true
            } else{
                print("Could Not updated canWork")
                return false
            }
        }catch let error {
            print("Updating failed \(error)")
            return false
        }
        
    }
    
    static func updatePointStatus(pointId: String, pointStatusId: Int) -> Bool? {
        guard let database = SQLiteDatabase.sharedInstance.database else {
            print("Datastore connection error")
            return nil
        }
        print("updatePointStatus - \(pointId) -- \(pointStatusId)")
        let point = pointTable.filter(mxRoutePointsId == pointId)
        
        do {
            if pointStatusId == LecyStatus.yolda {
                if try database.run(point.update(mxRoutePointsId <- pointId,
                                                 executionStatusId <- pointStatusId)) > 0 {
                    print("Updated Point Status1")
                    return true
                } else{
                    print("Could Not updated Point Status")
                    return false
                }
            } else if pointStatusId == LecyStatus.olumluTeslimat || pointStatusId == LecyStatus.sorunluOlumluTeslimat {
                if try database.run(point.update(mxRoutePointsId <- pointId,
                                                 executionStatusId <- pointStatusId)) > 0 {
                    print("Updated Point Status3")
                    return true
                } else{
                    print("Could Not updated Point Status")
                    return false
                }
            } else if pointStatusId == LecyStatus.olumsuzTeslimat {
                if try database.run(point.update(mxRoutePointsId <- pointId,
                                                 executionStatusId <- pointStatusId)) > 0 {
                    print("Updated Point Status4")
                    return true
                } else{
                    print("Could Not updated Point Status")
                    return false
                }
            } else {
                if try database.run(point.update(mxRoutePointsId <- pointId,
                                                 executionStatusId <- pointStatusId)) > 0 {
                    print("Updated Point Status5")
                    return true
                } else{
                    print("Could Not updated Point Status")
                    return false
                }
            }
            
        } catch let error {
            print("Updating failed \(error)")
            return false
        }
        
    }
}

