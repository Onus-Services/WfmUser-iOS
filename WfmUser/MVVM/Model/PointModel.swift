//
//  PointModel.swift
//  WfmUser
//
//  Created by Mustafa Alper Aydin on 14.03.2025.
//

import Foundation

struct PointModel: Codable, Identifiable {
    var id: String { takipId } // Identifiable için
    
    var sira: String
    var baslangicZamani: String
    var calismaSuresiDK: String
    var bitisZamani: String
    var isim: String
    var gelenAdres: String
    var score: String
    var arac: String
    var baslangicNoktasi: String
    var bitisNoktasi: String
    var mesafeKM: String
    var masraf: String
    var sureDK: String
    var enlem: String
    var boylam: String
    var takipId: String
    var tip: String
    var frekans: String
    var sla: String
    var kritikGun: String
    var kritikArac: String
    var kritikNokta: String
    var adet: String
    var kg: String
    var hacim: String
    var noktaninAracTipi: String
    var maxAdet: String
    var maxKG: String
    var maxHacim: String
    var aracTipi: String
    var rotaNo: String
    var referansNo: String
    var kmAvantaj: String
    var maliyet: String
    var kmMaliyet: String
    var barkod: String
    var siparisNotu: String
    var siparisTarihi: String
    var mesaiSuresi: String
    var haftaninGunu: String
    var haftaNo: String
    var il: String
    var ilce: String
    var mahalle: String
    var mxBlockId: String
    var blockColor: String
    var vehicleColor: String
    var mxRoutePointsId: String
    var slot: String
    var temsilciAdi: String
    var degerDesi: String
    var isRspNavigated: String
    var vehicleId: String
    var realPalet: String
    var slaWaitTime: String
    var tacoWaitTime: String
    var mxRouteProcessedId: String
    var bayi: String
    var bolge: String
    var guzergah: String
    var maxPalet: String
    var rotaBaslangicTarih: String
    var odemeTipi: String
    var nitelik15: String
    var nitelik16: String
    var rff10: String
    var rff1: String
    var rff2: String
    var executionStatusId: Int? = 130100

    // MARK: - CodingKeys
    enum CodingKeys: String, CodingKey {
        case sira = "Sira"
        case baslangicZamani = "BaslangicZamani"
        case calismaSuresiDK = "CalismaSuresiDK"
        case bitisZamani = "BitisZamani"
        case isim = "Isim"
        case gelenAdres = "GelenAdres"
        case score = "Score"
        case arac = "Arac"
        case baslangicNoktasi = "BaslangicNoktasi"
        case bitisNoktasi = "BitisNoktasi"
        case mesafeKM = "MesafeKM"
        case masraf = "Masraf"
        case sureDK = "SureDK"
        case enlem = "Enlem"
        case boylam = "Boylam"
        case takipId = "TakipId"
        case tip = "Tip"
        case frekans = "Frekans"
        case sla = "SLA"
        case kritikGun = "KritikGun"
        case kritikArac = "KritikArac"
        case kritikNokta = "KritikNokta"
        case adet = "Adet"
        case kg = "KG"
        case hacim = "Hacim"
        case noktaninAracTipi = "NoktaninAracTipi"
        case maxAdet = "MaxAdet"
        case maxKG = "MaxKG"
        case maxHacim = "MaxHacim"
        case aracTipi = "AracTipi"
        case rotaNo = "RotaNo"
        case referansNo = "ReferansNo"
        case kmAvantaj = "KMAvantaj"
        case maliyet = "Maliyet"
        case kmMaliyet = "KmMaliyet"
        case barkod = "Barkod"
        case siparisNotu = "SiparisNotu"
        case siparisTarihi = "SiparisTarihi"
        case mesaiSuresi = "MesaiSuresi"
        case haftaninGunu = "HaftaninGunu"
        case haftaNo = "HaftaNo"
        case il = "Il"
        case ilce = "Ilce"
        case mahalle = "Mahalle"
        case mxBlockId = "MxBlockId"
        case blockColor = "BlockColor"
        case vehicleColor = "VehicleColor"
        case mxRoutePointsId = "MxRoutePointsId"
        case slot = "Slot"
        case temsilciAdi = "TemsilciAdi"
        case degerDesi = "DegerDesi"
        case isRspNavigated = "IsRspNavigated"
        case vehicleId = "VehicleId"
        case realPalet = "RealPalet"
        case slaWaitTime = "SlaWaitTime"
        case tacoWaitTime = "TacoWaitTime"
        case mxRouteProcessedId = "MxRouteProcessedId"
        case bayi = "Bayi"
        case bolge = "Bolge"
        case guzergah = "Guzergah"
        case maxPalet = "MaxPalet"
        case rotaBaslangicTarih = "RotaBaslangicTarih"
        case odemeTipi = "OdemeTipi"
        case nitelik15 = "Nitelik15"
        case nitelik16 = "Nitelik16"
        case rff10 = "RFF10"
        case rff1 = "RFF1"
        case rff2 = "RFF2"
    }

    // MARK: - Initializers
    init(sira: String, baslangicZamani: String, calismaSuresiDK: String, bitisZamani: String, isim: String, gelenAdres: String, score: String, arac: String, baslangicNoktasi: String, bitisNoktasi: String, mesafeKM: String, masraf: String, sureDK: String, enlem: String, boylam: String, takipId: String, tip: String, frekans: String, sla: String, kritikGun: String, kritikArac: String, kritikNokta: String, adet: String, kg: String, hacim: String, noktaninAracTipi: String, maxAdet: String, maxKG: String, maxHacim: String, aracTipi: String, rotaNo: String, referansNo: String, kmAvantaj: String, maliyet: String, kmMaliyet: String, barkod: String, siparisNotu: String, siparisTarihi: String, mesaiSuresi: String, haftaninGunu: String, haftaNo: String, il: String, ilce: String, mahalle: String, mxBlockId: String, blockColor: String, vehicleColor: String, mxRoutePointsId: String, slot: String, temsilciAdi: String, degerDesi: String, isRspNavigated: String, vehicleId: String, realPalet: String, slaWaitTime: String, tacoWaitTime: String, mxRouteProcessedId: String, bayi: String, bolge: String, guzergah: String, maxPalet: String, rotaBaslangicTarih: String, odemeTipi: String, nitelik15: String, nitelik16: String, rff10: String, rff1: String, rff2: String, executionStatusId: Int?) {
        self.sira = sira
        self.baslangicZamani = baslangicZamani
        self.calismaSuresiDK = calismaSuresiDK
        self.bitisZamani = bitisZamani
        self.isim = isim
        self.gelenAdres = gelenAdres
        self.score = score
        self.arac = arac
        self.baslangicNoktasi = baslangicNoktasi
        self.bitisNoktasi = bitisNoktasi
        self.mesafeKM = mesafeKM
        self.masraf = masraf
        self.sureDK = sureDK
        self.enlem = enlem
        self.boylam = boylam
        self.takipId = takipId
        self.tip = tip
        self.frekans = frekans
        self.sla = sla
        self.kritikGun = kritikGun
        self.kritikArac = kritikArac
        self.kritikNokta = kritikNokta
        self.adet = adet
        self.kg = kg
        self.hacim = hacim
        self.noktaninAracTipi = noktaninAracTipi
        self.maxAdet = maxAdet
        self.maxKG = maxKG
        self.maxHacim = maxHacim
        self.aracTipi = aracTipi
        self.rotaNo = rotaNo
        self.referansNo = referansNo
        self.kmAvantaj = kmAvantaj
        self.maliyet = maliyet
        self.kmMaliyet = kmMaliyet
        self.barkod = barkod
        self.siparisNotu = siparisNotu
        self.siparisTarihi = siparisTarihi
        self.mesaiSuresi = mesaiSuresi
        self.haftaninGunu = haftaninGunu
        self.haftaNo = haftaNo
        self.il = il
        self.ilce = ilce
        self.mahalle = mahalle
        self.mxBlockId = mxBlockId
        self.blockColor = blockColor
        self.vehicleColor = vehicleColor
        self.mxRoutePointsId = mxRoutePointsId
        self.slot = slot
        self.temsilciAdi = temsilciAdi
        self.degerDesi = degerDesi
        self.isRspNavigated = isRspNavigated
        self.vehicleId = vehicleId
        self.realPalet = realPalet
        self.slaWaitTime = slaWaitTime
        self.tacoWaitTime = tacoWaitTime
        self.mxRouteProcessedId = mxRouteProcessedId
        self.bayi = bayi
        self.bolge = bolge
        self.guzergah = guzergah
        self.maxPalet = maxPalet
        self.rotaBaslangicTarih = rotaBaslangicTarih
        self.odemeTipi = odemeTipi
        self.nitelik15 = nitelik15
        self.nitelik16 = nitelik16
        self.rff10 = rff10
        self.rff1 = rff1
        self.rff2 = rff2
        self.executionStatusId = executionStatusId
    }
}


struct LecyStatus {
    static let startMission = 451015
    static let yolda = 130100
    static let gidiyorum = 130001
    static let geldim = 130002
    static let git = 130014
    static let teslimatFormuDolduruluyor = 130105
    static let olumluTeslimat = 130006
    static let problemFormuDolduruluyor = 130101
    static let mtCevapBekleniyor = 130102
    static let sorunluOlumluTeslimat = 130106
    static let olumsuzTeslimat = 130007
    static let depoyaCekMt = 130110
    static let teslimEtMt = 130108
    static let kismiTeslimEtMt = 130109
    static let gorusulduCozumBekleniyorMt = 130111
    static let cozulmediDevamEt = 130103
    static let kismiOlumluTeslimat = 130112
    static let depoyaIadeMt = 130107
    static let barcode_okunacak = 130047
    static let gitmedim = 130011
    static let noNameStatus1 = 130114
    static let noNameStatus2 = 130104
    static let noNameStatus3 = 130116
    static let noNameStatus4 = 130119
    
    static let teslimatFormuDolduruluyorCoklu = 13010599
    static let birdenFazlaGeldim = 998877
}
