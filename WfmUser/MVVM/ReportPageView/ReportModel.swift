//
//  ReportModel.swift
//  WfmAdmin
//
//  Created by Mustafa Alper Aydin on 28.01.2025.
//

import Foundation

struct ReportModel: Codable, Equatable {
    
    var depo: String
    var aracPlaka: String
    var surucuId: String
    var soforAdi: String
    var toplamAdet: Int
    var rutSayi: Int
    var olumluAdet: Int
    var kismiOlumluAdet: Int
    var olumsuzAdet: Int
    var ugranMamisAdet: Int
    var devamEdenAdet: Int
    var seferSayisi: Int
    var toplamSeferSuresi: String
    var planlananKM: Double
    var gerceklesenKM: Double
    var geofence: Double
    var adresSkor: String
    var planlananYolSuresiDk: String
    var planlananIslemSuresi: String
    var gerceklesenDk: Int
    var noktadaBeklemeIsSuresi: String
    var erkenGecDakika: String
    var podSayisi: Int
    var siparisTip: String
    var planlananLojistikBirim: String
    var teslimAdresiKod: String
    var siparisVerenMusteri: String
    var odevyenMusteri: String
    var teslimatIlcesi: String
    var teslimatIli: String
    var kg: Double
    var kgKapasite: Double
    var koli: Double
    var koliKapasite: Double
    var desi: Double
    var desiKapasite: Double
    var aracTipi: String
    var aracSahiplik: String
    var seferBaslatAdet: Int
    var seferBitisAdet: Int
    var seferBaslatmayanAdet: Int
    var seferDevamEden: Int
    var teslimatPerformansAdet: String
    var teslimatPerformans: String
    var teslimatPerformansBadAdet: String
    var teslimatPerformansBad: String
    var dropSayisi: Int
    var altKod: String
    var yesil: Int
    var turuncu: Int
    var kirmizi: Int
    var noktaAtisi: Int
    var yakin: Int
    var uzak: Int
    var hataliKullanim: Int
    var geofenceHesaplanmayan: Int
    var adresDuzeltmeAdet: Int
    var farkliGun: Int
    var farkliArac: Int
    var duraklama: Int
    var rutDisi: Int
    var plannedStartDate: String
    var weekDay: String
    
    static func ==(lhs: ReportModel, rhs: ReportModel) -> Bool {
        return lhs.depo == rhs.depo &&
        lhs.aracPlaka == rhs.aracPlaka &&
        lhs.surucuId == rhs.surucuId &&
        lhs.soforAdi == rhs.soforAdi &&
        lhs.toplamAdet == rhs.toplamAdet &&
        lhs.rutSayi == rhs.rutSayi &&
        lhs.olumluAdet == rhs.olumluAdet &&
        lhs.kismiOlumluAdet == rhs.kismiOlumluAdet &&
        lhs.olumsuzAdet == rhs.olumsuzAdet &&
        lhs.ugranMamisAdet == rhs.ugranMamisAdet &&
        lhs.devamEdenAdet == rhs.devamEdenAdet &&
        lhs.seferSayisi == rhs.seferSayisi &&
        lhs.toplamSeferSuresi == rhs.toplamSeferSuresi &&
        lhs.planlananKM == rhs.planlananKM &&
        lhs.gerceklesenKM == rhs.gerceklesenKM &&
        lhs.geofence == rhs.geofence &&
        lhs.adresSkor == rhs.adresSkor &&
        lhs.planlananYolSuresiDk == rhs.planlananYolSuresiDk &&
        lhs.planlananIslemSuresi == rhs.planlananIslemSuresi &&
        lhs.gerceklesenDk == rhs.gerceklesenDk &&
        lhs.noktadaBeklemeIsSuresi == rhs.noktadaBeklemeIsSuresi &&
        lhs.erkenGecDakika == rhs.erkenGecDakika &&
        lhs.podSayisi == rhs.podSayisi &&
        lhs.siparisTip == rhs.siparisTip &&
        lhs.planlananLojistikBirim == rhs.planlananLojistikBirim &&
        lhs.teslimAdresiKod == rhs.teslimAdresiKod &&
        lhs.siparisVerenMusteri == rhs.siparisVerenMusteri &&
        lhs.odevyenMusteri == rhs.odevyenMusteri &&
        lhs.teslimatIlcesi == rhs.teslimatIlcesi &&
        lhs.teslimatIli == rhs.teslimatIli &&
        lhs.kg == rhs.kg &&
        lhs.kgKapasite == rhs.kgKapasite &&
        lhs.koli == rhs.koli &&
        lhs.koliKapasite == rhs.koliKapasite &&
        lhs.desi == rhs.desi &&
        lhs.desiKapasite == rhs.desiKapasite &&
        lhs.aracTipi == rhs.aracTipi &&
        lhs.aracSahiplik == rhs.aracSahiplik &&
        lhs.seferBaslatAdet == rhs.seferBaslatAdet &&
        lhs.seferBitisAdet == rhs.seferBitisAdet &&
        lhs.seferBaslatmayanAdet == rhs.seferBaslatmayanAdet &&
        lhs.seferDevamEden == rhs.seferDevamEden &&
        lhs.teslimatPerformansAdet == rhs.teslimatPerformansAdet &&
        lhs.teslimatPerformans == rhs.teslimatPerformans &&
        lhs.teslimatPerformansBadAdet == rhs.teslimatPerformansBadAdet &&
        lhs.teslimatPerformansBad == rhs.teslimatPerformansBad &&
        lhs.dropSayisi == rhs.dropSayisi &&
        lhs.altKod == rhs.altKod &&
        lhs.yesil == rhs.yesil &&
        lhs.turuncu == rhs.turuncu &&
        lhs.kirmizi == rhs.kirmizi &&
        lhs.noktaAtisi == rhs.noktaAtisi &&
        lhs.yakin == rhs.yakin &&
        lhs.uzak == rhs.uzak &&
        lhs.hataliKullanim == rhs.hataliKullanim &&
        lhs.geofenceHesaplanmayan == rhs.geofenceHesaplanmayan &&
        lhs.adresDuzeltmeAdet == rhs.adresDuzeltmeAdet &&
        lhs.farkliGun == rhs.farkliGun &&
        lhs.farkliArac == rhs.farkliArac &&
        lhs.duraklama == rhs.duraklama &&
        lhs.rutDisi == rhs.rutDisi &&
        lhs.plannedStartDate == rhs.plannedStartDate &&
        lhs.weekDay == rhs.weekDay
    }
    
    enum CodingKeys: String, CodingKey {
        case depo = "Depo"
        case aracPlaka = "Araç/Plaka"
        case surucuId = "SürücüId"
        case soforAdi = "Şöför Adı"
        case toplamAdet = "Toplam Adet"
        case rutSayi = "Rut Sayi"
        case olumluAdet = "Olumlu Adet"
        case kismiOlumluAdet = "Kısmi Olumlu Adet"
        case olumsuzAdet = "Olumsuz Adet"
        case ugranMamisAdet = "Uğranmamış Adet"
        case devamEdenAdet = "Devam Eden Adet"
        case seferSayisi = "Sefer Sayısı"
        case toplamSeferSuresi = "Toplam Sefer Süresi"
        case planlananKM = "Planlanan KM"
        case gerceklesenKM = "Gerçekleşen KM"
        case geofence = "Geofence"
        case adresSkor = "Adres Skor"
        case planlananYolSuresiDk = "Planlanan Yol Süresi Dk"
        case planlananIslemSuresi = "Planlanan İşlem Süresi"
        case gerceklesenDk = "Gerçekleşen Dk"
        case noktadaBeklemeIsSuresi = "Noktada Bekleme - İş Süresi"
        case erkenGecDakika = "Erken/Geç Dakika"
        case podSayisi = "POD sayısı"
        case siparisTip = "Sipariş Tip"
        case planlananLojistikBirim = "Planlanan Lojistik Birim"
        case teslimAdresiKod = "Teslim Adresi Kod"
        case siparisVerenMusteri = "Sipariş Veren Müşteri"
        case odevyenMusteri = "Ödeyen Müşteri"
        case teslimatIlcesi = "Teslimat İlçesi"
        case teslimatIli = "Teslimat İli"
        case kg = "KG"
        case kgKapasite = "KG Kapasite"
        case koli = "Koli"
        case koliKapasite = "Koli Kapasite"
        case desi = "Desi"
        case desiKapasite = "Desi Kapasite"
        case aracTipi = "Araç Tipi"
        case aracSahiplik = "Araç Sahiplik"
        case seferBaslatAdet = "SeferBaslatAdet"
        case seferBitisAdet = "SeferBitisAdet"
        case seferBaslatmayanAdet = "SeferBaslatmayanAdet"
        case seferDevamEden = "SeferDevamEden"
        case teslimatPerformansAdet = "TeslimatPerformansAdet"
        case teslimatPerformans = "TeslimatPerformans"
        case teslimatPerformansBadAdet = "TeslimatPerformansBadAdet"
        case teslimatPerformansBad = "TeslimatPerformansBad"
        case dropSayisi = "DropSayisi"
        case altKod = "AltKod"
        case yesil = "Yesil"
        case turuncu = "Turuncu"
        case kirmizi = "Kirmizi"
        case noktaAtisi = "NoktaAtisi"
        case yakin = "Yakin"
        case uzak = "Uzak"
        case hataliKullanim = "HataliKullanim"
        case geofenceHesaplanmayan = "GeofenceHesaplanmayan"
        case adresDuzeltmeAdet = "AdresDuzeltmeAdet"
        case farkliGun = "Farklı Gün"
        case farkliArac = "Farklı Araç"
        case duraklama = "Duraklama"
        case rutDisi = "RutDisi"
        case plannedStartDate = "PlannedStartDate"
        case weekDay = "WeekDay"
    }
    
    init(depo: String, aracPlaka: String, surucuId: String, soforAdi: String, toplamAdet: Int, rutSayi: Int, olumluAdet: Int, kismiOlumluAdet: Int, olumsuzAdet: Int, ugranMamisAdet: Int, devamEdenAdet: Int, seferSayisi: Int, toplamSeferSuresi: String, planlananKM: Double, gerceklesenKM: Double, geofence: Double, adresSkor: String, planlananYolSuresiDk: String, planlananIslemSuresi: String, gerceklesenDk: Int, noktadaBeklemeIsSuresi: String, erkenGecDakika: String, podSayisi: Int, siparisTip: String, planlananLojistikBirim: String, teslimAdresiKod: String, siparisVerenMusteri: String, odevyenMusteri: String, teslimatIlcesi: String, teslimatIli: String, kg: Double, kgKapasite: Double, koli: Double, koliKapasite: Double, desi: Double, desiKapasite: Double, aracTipi: String, aracSahiplik: String, seferBaslatAdet: Int, seferBitisAdet: Int, seferBaslatmayanAdet: Int, seferDevamEden: Int, teslimatPerformansAdet: String, teslimatPerformans: String, teslimatPerformansBadAdet: String, teslimatPerformansBad: String, dropSayisi: Int, altKod: String, yesil: Int, turuncu: Int, kirmizi: Int, noktaAtisi: Int, yakin: Int, uzak: Int, hataliKullanim: Int, geofenceHesaplanmayan: Int, adresDuzeltmeAdet: Int, farkliGun: Int, farkliArac: Int, duraklama: Int, rutDisi: Int, plannedStartDate: String, weekDay: String) {
        self.depo = depo
        self.aracPlaka = aracPlaka
        self.surucuId = surucuId
        self.soforAdi = soforAdi
        self.toplamAdet = toplamAdet
        self.rutSayi = rutSayi
        self.olumluAdet = olumluAdet
        self.kismiOlumluAdet = kismiOlumluAdet
        self.olumsuzAdet = olumsuzAdet
        self.ugranMamisAdet = ugranMamisAdet
        self.devamEdenAdet = devamEdenAdet
        self.seferSayisi = seferSayisi
        self.toplamSeferSuresi = toplamSeferSuresi
        self.planlananKM = planlananKM
        self.gerceklesenKM = gerceklesenKM
        self.geofence = geofence
        self.adresSkor = adresSkor
        self.planlananYolSuresiDk = planlananYolSuresiDk
        self.planlananIslemSuresi = planlananIslemSuresi
        self.gerceklesenDk = gerceklesenDk
        self.noktadaBeklemeIsSuresi = noktadaBeklemeIsSuresi
        self.erkenGecDakika = erkenGecDakika
        self.podSayisi = podSayisi
        self.siparisTip = siparisTip
        self.planlananLojistikBirim = planlananLojistikBirim
        self.teslimAdresiKod = teslimAdresiKod
        self.siparisVerenMusteri = siparisVerenMusteri
        self.odevyenMusteri = odevyenMusteri
        self.teslimatIlcesi = teslimatIlcesi
        self.teslimatIli = teslimatIli
        self.kg = kg
        self.kgKapasite = kgKapasite
        self.koli = koli
        self.koliKapasite = koliKapasite
        self.desi = desi
        self.desiKapasite = desiKapasite
        self.aracTipi = aracTipi
        self.aracSahiplik = aracSahiplik
        self.seferBaslatAdet = seferBaslatAdet
        self.seferBitisAdet = seferBitisAdet
        self.seferBaslatmayanAdet = seferBaslatmayanAdet
        self.seferDevamEden = seferDevamEden
        self.teslimatPerformansAdet = teslimatPerformansAdet
        self.teslimatPerformans = teslimatPerformans
        self.teslimatPerformansBadAdet = teslimatPerformansBadAdet
        self.teslimatPerformansBad = teslimatPerformansBad
        self.dropSayisi = dropSayisi
        self.altKod = altKod
        self.yesil = yesil
        self.turuncu = turuncu
        self.kirmizi = kirmizi
        self.noktaAtisi = noktaAtisi
        self.yakin = yakin
        self.uzak = uzak
        self.hataliKullanim = hataliKullanim
        self.geofenceHesaplanmayan = geofenceHesaplanmayan
        self.adresDuzeltmeAdet = adresDuzeltmeAdet
        self.farkliGun = farkliGun
        self.farkliArac = farkliArac
        self.duraklama = duraklama
        self.rutDisi = rutDisi
        self.plannedStartDate = plannedStartDate
        self.weekDay = weekDay
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        depo = try container.decodeIfPresent(String.self, forKey: .depo) ?? ""
        aracPlaka = try container.decodeIfPresent(String.self, forKey: .aracPlaka) ?? ""
        surucuId = try container.decodeIfPresent(String.self, forKey: .surucuId) ?? ""
        soforAdi = try container.decodeIfPresent(String.self, forKey: .soforAdi) ?? ""
        toplamAdet = Int(try container.decodeIfPresent(String.self, forKey: .toplamAdet) ?? "0") ?? 0
        rutSayi = Int(try container.decodeIfPresent(String.self, forKey: .rutSayi) ?? "0") ?? 0
        olumluAdet = Int(try container.decodeIfPresent(String.self, forKey: .olumluAdet) ?? "0") ?? 0
        kismiOlumluAdet = Int(try container.decodeIfPresent(String.self, forKey: .kismiOlumluAdet) ?? "0") ?? 0
        olumsuzAdet = Int(try container.decodeIfPresent(String.self, forKey: .olumsuzAdet) ?? "0") ?? 0
        ugranMamisAdet = Int(try container.decodeIfPresent(String.self, forKey: .ugranMamisAdet) ?? "0") ?? 0
        devamEdenAdet = Int(try container.decodeIfPresent(String.self, forKey: .devamEdenAdet) ?? "0") ?? 0
        seferSayisi = Int(try container.decodeIfPresent(String.self, forKey: .seferSayisi) ?? "0") ?? 0
        toplamSeferSuresi = try container.decodeIfPresent(String.self, forKey: .toplamSeferSuresi) ?? ""
        planlananKM = Double(try container.decodeIfPresent(String.self, forKey: .planlananKM) ?? "0.0") ?? 0.0
        gerceklesenKM = Double(try container.decodeIfPresent(String.self, forKey: .gerceklesenKM) ?? "0.0") ?? 0.0
        geofence = Double(try container.decodeIfPresent(String.self, forKey: .geofence) ?? "0.0") ?? 0.0
        adresSkor = try container.decodeIfPresent(String.self, forKey: .adresSkor) ?? ""
        planlananYolSuresiDk = try container.decodeIfPresent(String.self, forKey: .planlananYolSuresiDk) ?? ""
        planlananIslemSuresi = try container.decodeIfPresent(String.self, forKey: .planlananIslemSuresi) ?? ""
        gerceklesenDk = Int(try container.decodeIfPresent(String.self, forKey: .gerceklesenDk) ?? "0") ?? 0
        noktadaBeklemeIsSuresi = try container.decodeIfPresent(String.self, forKey: .noktadaBeklemeIsSuresi) ?? ""
        erkenGecDakika = try container.decodeIfPresent(String.self, forKey: .erkenGecDakika) ?? ""
        podSayisi = Int(try container.decodeIfPresent(String.self, forKey: .podSayisi) ?? "0") ?? 0
        siparisTip = try container.decodeIfPresent(String.self, forKey: .siparisTip) ?? ""
        planlananLojistikBirim = try container.decodeIfPresent(String.self, forKey: .planlananLojistikBirim) ?? ""
        teslimAdresiKod = try container.decodeIfPresent(String.self, forKey: .teslimAdresiKod) ?? ""
        siparisVerenMusteri = try container.decodeIfPresent(String.self, forKey: .siparisVerenMusteri) ?? ""
        odevyenMusteri = try container.decodeIfPresent(String.self, forKey: .odevyenMusteri) ?? ""
        teslimatIlcesi = try container.decodeIfPresent(String.self, forKey: .teslimatIlcesi) ?? ""
        teslimatIli = try container.decodeIfPresent(String.self, forKey: .teslimatIli) ?? ""
        kg = Double(try container.decodeIfPresent(String.self, forKey: .kg) ?? "0.0") ?? 0.0
        kgKapasite = Double(try container.decodeIfPresent(String.self, forKey: .kgKapasite) ?? "0.0") ?? 0.0
        koli = Double(try container.decodeIfPresent(String.self, forKey: .koli) ?? "0.0") ?? 0.0
        koliKapasite = Double(try container.decodeIfPresent(String.self, forKey: .koliKapasite) ?? "0.0") ?? 0.0
        desi = Double(try container.decodeIfPresent(String.self, forKey: .desi) ?? "0.0") ?? 0.0
        desiKapasite = Double(try container.decodeIfPresent(String.self, forKey: .desiKapasite) ?? "0.0") ?? 0.0
        aracTipi = try container.decodeIfPresent(String.self, forKey: .aracTipi) ?? ""
        aracSahiplik = try container.decodeIfPresent(String.self, forKey: .aracSahiplik) ?? ""
        seferBaslatAdet = Int(try container.decodeIfPresent(String.self, forKey: .seferBaslatAdet) ?? "0") ?? 0
        seferBitisAdet = Int(try container.decodeIfPresent(String.self, forKey: .seferBitisAdet) ?? "0") ?? 0
        seferBaslatmayanAdet = Int(try container.decodeIfPresent(String.self, forKey: .seferBaslatmayanAdet) ?? "0") ?? 0
        seferDevamEden = Int(try container.decodeIfPresent(String.self, forKey: .seferDevamEden) ?? "0") ?? 0
        teslimatPerformansAdet = try container.decodeIfPresent(String.self, forKey: .teslimatPerformansAdet) ?? ""
        teslimatPerformans = try container.decodeIfPresent(String.self, forKey: .teslimatPerformans) ?? ""
        teslimatPerformansBadAdet = try container.decodeIfPresent(String.self, forKey: .teslimatPerformansBadAdet) ?? ""
        teslimatPerformansBad = try container.decodeIfPresent(String.self, forKey: .teslimatPerformansBad) ?? ""
        dropSayisi = Int(try container.decodeIfPresent(String.self, forKey: .dropSayisi) ?? "0") ?? 0
        altKod = try container.decodeIfPresent(String.self, forKey: .altKod) ?? ""
        yesil = Int(try container.decodeIfPresent(String.self, forKey: .yesil) ?? "0") ?? 0
        turuncu = Int(try container.decodeIfPresent(String.self, forKey: .turuncu) ?? "0") ?? 0
        kirmizi = Int(try container.decodeIfPresent(String.self, forKey: .kirmizi) ?? "0") ?? 0
        noktaAtisi = Int(try container.decodeIfPresent(String.self, forKey: .noktaAtisi) ?? "0") ?? 0
        yakin = Int(try container.decodeIfPresent(String.self, forKey: .yakin) ?? "0") ?? 0
        uzak = Int(try container.decodeIfPresent(String.self, forKey: .uzak) ?? "0") ?? 0
        hataliKullanim = Int(try container.decodeIfPresent(String.self, forKey: .hataliKullanim) ?? "0") ?? 0
        geofenceHesaplanmayan = Int(try container.decodeIfPresent(String.self, forKey: .geofenceHesaplanmayan) ?? "0") ?? 0
        adresDuzeltmeAdet = Int(try container.decodeIfPresent(String.self, forKey: .adresDuzeltmeAdet) ?? "0") ?? 0
        farkliGun = Int(try container.decodeIfPresent(String.self, forKey: .farkliGun) ?? "0") ?? 0
        farkliArac = Int(try container.decodeIfPresent(String.self, forKey: .farkliArac) ?? "0") ?? 0
        duraklama = Int(try container.decodeIfPresent(String.self, forKey: .duraklama) ?? "0") ?? 0
        rutDisi = Int(try container.decodeIfPresent(String.self, forKey: .rutDisi) ?? "0") ?? 0
        plannedStartDate = try container.decodeIfPresent(String.self, forKey: .plannedStartDate) ?? ""
        weekDay = try container.decodeIfPresent(String.self, forKey: .weekDay) ?? ""
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(depo, forKey: .depo)
        try container.encode(aracPlaka, forKey: .aracPlaka)
        try container.encode(surucuId, forKey: .surucuId)
        try container.encode(soforAdi, forKey: .soforAdi)
        try container.encode(String(toplamAdet), forKey: .toplamAdet)
        try container.encode(String(rutSayi), forKey: .rutSayi)
        try container.encode(String(olumluAdet), forKey: .olumluAdet)
        try container.encode(String(kismiOlumluAdet), forKey: .kismiOlumluAdet)
        try container.encode(String(olumsuzAdet), forKey: .olumsuzAdet)
        try container.encode(String(ugranMamisAdet), forKey: .ugranMamisAdet)
        try container.encode(String(devamEdenAdet), forKey: .devamEdenAdet)
        try container.encode(String(seferSayisi), forKey: .seferSayisi)
        try container.encode(toplamSeferSuresi, forKey: .toplamSeferSuresi)
        try container.encode(String(planlananKM), forKey: .planlananKM)
        try container.encode(String(gerceklesenKM), forKey: .gerceklesenKM)
        try container.encode(String(geofence), forKey: .geofence)
        try container.encode(adresSkor, forKey: .adresSkor)
        try container.encode(planlananYolSuresiDk, forKey: .planlananYolSuresiDk)
        try container.encode(planlananIslemSuresi, forKey: .planlananIslemSuresi)
        try container.encode(String(gerceklesenDk), forKey: .gerceklesenDk)
        try container.encode(noktadaBeklemeIsSuresi, forKey: .noktadaBeklemeIsSuresi)
        try container.encode(erkenGecDakika, forKey: .erkenGecDakika)
        try container.encode(String(podSayisi), forKey: .podSayisi)
        try container.encode(siparisTip, forKey: .siparisTip)
        try container.encode(planlananLojistikBirim, forKey: .planlananLojistikBirim)
        try container.encode(teslimAdresiKod, forKey: .teslimAdresiKod)
        try container.encode(siparisVerenMusteri, forKey: .siparisVerenMusteri)
        try container.encode(odevyenMusteri, forKey: .odevyenMusteri)
        try container.encode(teslimatIlcesi, forKey: .teslimatIlcesi)
        try container.encode(teslimatIli, forKey: .teslimatIli)
        try container.encode(String(kg), forKey: .kg)
        try container.encode(String(kgKapasite), forKey: .kgKapasite)
        try container.encode(String(koli), forKey: .koli)
        try container.encode(String(koliKapasite), forKey: .koliKapasite)
        try container.encode(String(desi), forKey: .desi)
        try container.encode(String(desiKapasite), forKey: .desiKapasite)
        try container.encode(aracTipi, forKey: .aracTipi)
        try container.encode(aracSahiplik, forKey: .aracSahiplik)
        try container.encode(String(seferBaslatAdet), forKey: .seferBaslatAdet)
        try container.encode(String(seferBitisAdet), forKey: .seferBitisAdet)
        try container.encode(String(seferBaslatmayanAdet), forKey: .seferBaslatmayanAdet)
        try container.encode(String(seferDevamEden), forKey: .seferDevamEden)
        try container.encode(teslimatPerformansAdet, forKey: .teslimatPerformansAdet)
        try container.encode(teslimatPerformans, forKey: .teslimatPerformans)
        try container.encode(teslimatPerformansBadAdet, forKey: .teslimatPerformansBadAdet)
        try container.encode(teslimatPerformansBad, forKey: .teslimatPerformansBad)
        try container.encode(String(dropSayisi), forKey: .dropSayisi)
        try container.encode(altKod, forKey: .altKod)
        try container.encode(String(yesil), forKey: .yesil)
        try container.encode(String(turuncu), forKey: .turuncu)
        try container.encode(String(kirmizi), forKey: .kirmizi)
        try container.encode(String(noktaAtisi), forKey: .noktaAtisi)
        try container.encode(String(yakin), forKey: .yakin)
        try container.encode(String(uzak), forKey: .uzak)
        try container.encode(String(hataliKullanim), forKey: .hataliKullanim)
        try container.encode(String(geofenceHesaplanmayan), forKey: .geofenceHesaplanmayan)
        try container.encode(String(adresDuzeltmeAdet), forKey: .adresDuzeltmeAdet)
        
        try container.encode(String(farkliGun), forKey: .farkliGun)
        try container.encode(String(farkliArac), forKey: .farkliArac)
        try container.encode(String(duraklama), forKey: .duraklama)
        try container.encode(String(rutDisi), forKey: .rutDisi)
        try container.encode(plannedStartDate, forKey: .plannedStartDate)
        try container.encode(weekDay, forKey: .weekDay)
    }
}

var reportModelStr = "[{\"Depo\":\"KOŞ (ALANYA)\",\"Araç/Plaka\":\"07 BDU 310\",\"SürücüId\":\"CAFER YILMAZ\",\"Şöför Adı\":\"CAFER YILMAZ\",\"Toplam Adet\":\"38\",\"RutSayi\":\"29\",\"Olumlu Adet\":\"13\",\"Kısmi Olumlu Adet\":\"0\",\"Olumsuz Adet\":\"16\",\"Uğranmamış Adet\":\"0\",\"Devam Eden Adet\":\"0\",\"Sefer Sayısı\":\"1\",\"Toplam Sefer Süresi\":\"615\",\"Planlanan KM\":\"1.72\",\"Gerçekleşen KM\":\"68.19\",\"Geofence\":\"5.574600\",\"Adres Skor\":\"1000\",\"Planlanan Yol Süresi Dk\":\"2\",\"Planlanan İşlem Süresi\":\"271\",\"Gerçekleşen Dk\":\"53\",\"Noktada Bekleme - İş Süresi\":\"14\",\"Erken/Geç Dakika\":\"\",\"POD sayısı\":\"\",\"Sipariş Tip\":\"4\",\"Planlanan Lojistik Birim\":\"1\",\"Teslim Adresi Kod\":\"0\",\"Sipariş Veren Müşteri\":\"1\",\"Ödeyen Müşteri\":\"0\",\"Teslimat İlçesi\":\"2\",\"Teslimat İli\":\"1\",\"KG\":\"0.00\",\"KG Kapasite\":\"0.00\",\"Koli\":\"0.00\",\"Koli Kapasite\":\"0.00\",\"Desi\":\"0.00\",\"Desi Kapasite\":\"0.00\",\"Araç Tipi\":\"\",\"Araç Sahiplik\":\"\",\"SeferBaslatAdet\":\"1\",\"SeferBitisAdet\":\"1\",\"SeferBaslatmayanAdet\":\"0\",\"SeferDevamEden\":\"0\",\"TeslimatPerformansAdet\":\"27\",\"TeslimatPerformans\":\"9.74\",\"TeslimatPerformansBadAdet\":\"13\",\"TeslimatPerformansBad\":\"78.45\",\"DropSayisi\":\"38\",\"AltKod\":\"\",\"Yesil\":\"38\",\"Turuncu\":\"0\",\"Kirmizi\":\"0\",\"NoktaAtisi\":\"14\",\"Yakin\":\"8\",\"Uzak\":\"0\",\"HataliKullanim\":\"16\",\"GeofenceHesaplanmayan\":\"0\",\"AdresDuzeltmeAdet\":\"\",\"Farklı Gün\":\"1\",\"Farklı Araç\":\"1\",\"Duraklama\":\"7\",\"RutDisi\":\"2\",\"PlannedStartDate\":\"2025-02-24\",\"WeekDay\":\"Monday\"},{\"Depo\":\"KOŞ (ALANYA)\",\"Araç/Plaka\":\"07 BDU 310\",\"SürücüId\":\"CAFER YILMAZ\",\"Şöför Adı\":\"CAFER YILMAZ\",\"Toplam Adet\":\"36\",\"RutSayi\":\"25\",\"Olumlu Adet\":\"3\",\"Kısmi Olumlu Adet\":\"0\",\"Olumsuz Adet\":\"22\",\"Uğranmamış Adet\":\"0\",\"Devam Eden Adet\":\"0\",\"Sefer Sayısı\":\"1\",\"Toplam Sefer Süresi\":\"553\",\"Planlanan KM\":\"8.59\",\"Gerçekleşen KM\":\"134.07\",\"Geofence\":\"10.505421\",\"Adres Skor\":\"1000\",\"Planlanan Yol Süresi Dk\":\"6\",\"Planlanan İşlem Süresi\":\"255\",\"Gerçekleşen Dk\":\"51\",\"Noktada Bekleme - İş Süresi\":\"10\",\"Erken/Geç Dakika\":\"\",\"POD sayısı\":\"\",\"Sipariş Tip\":\"5\",\"Planlanan Lojistik Birim\":\"1\",\"Teslim Adresi Kod\":\"0\",\"Sipariş Veren Müşteri\":\"1\",\"Ödeyen Müşteri\":\"0\",\"Teslimat İlçesi\":\"2\",\"Teslimat İli\":\"1\",\"KG\":\"0.00\",\"KG Kapasite\":\"0.00\",\"Koli\":\"0.00\",\"Koli Kapasite\":\"0.00\",\"Desi\":\"0.00\",\"Desi Kapasite\":\"0.00\",\"Araç Tipi\":\"\",\"Araç Sahiplik\":\"\",\"SeferBaslatAdet\":\"1\",\"SeferBitisAdet\":\"1\",\"SeferBaslatmayanAdet\":\"0\",\"SeferDevamEden\":\"0\",\"TeslimatPerformansAdet\":\"26\",\"TeslimatPerformans\":\"2.68\",\"TeslimatPerformansBadAdet\":\"12\",\"TeslimatPerformansBad\":\"83.42\",\"DropSayisi\":\"36\",\"AltKod\":\"\",\"Yesil\":\"36\",\"Turuncu\":\"0\",\"Kirmizi\":\"0\",\"NoktaAtisi\":\"12\",\"Yakin\":\"2\",\"Uzak\":\"0\",\"HataliKullanim\":\"22\",\"GeofenceHesaplanmayan\":\"0\",\"AdresDuzeltmeAdet\":\"\",\"Farklı Gün\":\"3\",\"Farklı Araç\":\"1\",\"Duraklama\":\"7\",\"RutDisi\":\"4\",\"PlannedStartDate\":\"2025-02-25\",\"WeekDay\":\"Tuesday\"},{\"Depo\":\"KOŞ (ALANYA)\",\"Araç/Plaka\":\"07 BDU 310\",\"SürücüId\":\"CAFER YILMAZ\",\"Şöför Adı\":\"CAFER YILMAZ\",\"Toplam Adet\":\"44\",\"RutSayi\":\"31\",\"Olumlu Adet\":\"3\",\"Kısmi Olumlu Adet\":\"0\",\"Olumsuz Adet\":\"28\",\"Uğranmamış Adet\":\"0\",\"Devam Eden Adet\":\"0\",\"Sefer Sayısı\":\"1\",\"Toplam Sefer Süresi\":\"658\",\"Planlanan KM\":\"33.08\",\"Gerçekleşen KM\":\"155.00\",\"Geofence\":\"30.231347\",\"Adres Skor\":\"1000\",\"Planlanan Yol Süresi Dk\":\"26\",\"Planlanan İşlem Süresi\":\"304\",\"Gerçekleşen Dk\":\"70\",\"Noktada Bekleme - İş Süresi\":\"10\",\"Erken/Geç Dakika\":\"\",\"POD sayısı\":\"\",\"Sipariş Tip\":\"5\",\"Planlanan Lojistik Birim\":\"1\",\"Teslim Adresi Kod\":\"0\",\"Sipariş Veren Müşteri\":\"1\",\"Ödeyen Müşteri\":\"0\",\"Teslimat İlçesi\":\"3\",\"Teslimat İli\":\"1\",\"KG\":\"0.00\",\"KG Kapasite\":\"0.00\",\"Koli\":\"0.00\",\"Koli Kapasite\":\"0.00\",\"Desi\":\"0.00\",\"Desi Kapasite\":\"0.00\",\"Araç Tipi\":\"\",\"Araç Sahiplik\":\"\",\"SeferBaslatAdet\":\"1\",\"SeferBitisAdet\":\"1\",\"SeferBaslatmayanAdet\":\"0\",\"SeferDevamEden\":\"0\",\"TeslimatPerformansAdet\":\"32\",\"TeslimatPerformans\":\"3.14\",\"TeslimatPerformansBadAdet\":\"14\",\"TeslimatPerformansBad\":\"94.50\",\"DropSayisi\":\"44\",\"AltKod\":\"\",\"Yesil\":\"44\",\"Turuncu\":\"0\",\"Kirmizi\":\"0\",\"NoktaAtisi\":\"9\",\"Yakin\":\"7\",\"Uzak\":\"0\",\"HataliKullanim\":\"28\",\"GeofenceHesaplanmayan\":\"0\",\"AdresDuzeltmeAdet\":\"\",\"Farklı Gün\":\"7\",\"Farklı Araç\":\"2\",\"Duraklama\":\"4\",\"RutDisi\":\"9\",\"PlannedStartDate\":\"2025-02-26\",\"WeekDay\":\"Wednesday\"},{\"Depo\":\"KOŞ (ALANYA)\",\"Araç/Plaka\":\"07 BDU 310\",\"SürücüId\":\"CAFER YILMAZ\",\"Şöför Adı\":\"CAFER YILMAZ\",\"Toplam Adet\":\"41\",\"RutSayi\":\"30\",\"Olumlu Adet\":\"4\",\"Kısmi Olumlu Adet\":\"0\",\"Olumsuz Adet\":\"26\",\"Uğranmamış Adet\":\"0\",\"Devam Eden Adet\":\"0\",\"Sefer Sayısı\":\"1\",\"Toplam Sefer Süresi\":\"600\",\"Planlanan KM\":\"2.39\",\"Gerçekleşen KM\":\"100.36\",\"Geofence\":\"7.017279\",\"Adres Skor\":\"1000\",\"Planlanan Yol Süresi Dk\":\"2\",\"Planlanan İşlem Süresi\":\"289\",\"Gerçekleşen Dk\":\"70\",\"Noktada Bekleme - İş Süresi\":\"12\",\"Erken/Geç Dakika\":\"\",\"POD sayısı\":\"\",\"Sipariş Tip\":\"5\",\"Planlanan Lojistik Birim\":\"1\",\"Teslim Adresi Kod\":\"0\",\"Sipariş Veren Müşteri\":\"1\",\"Ödeyen Müşteri\":\"0\",\"Teslimat İlçesi\":\"2\",\"Teslimat İli\":\"1\",\"KG\":\"0.00\",\"KG Kapasite\":\"0.00\",\"Koli\":\"0.00\",\"Koli Kapasite\":\"0.00\",\"Desi\":\"0.00\",\"Desi Kapasite\":\"0.00\",\"Araç Tipi\":\"\",\"Araç Sahiplik\":\"\",\"SeferBaslatAdet\":\"1\",\"SeferBitisAdet\":\"1\",\"SeferBaslatmayanAdet\":\"0\",\"SeferDevamEden\":\"0\",\"TeslimatPerformansAdet\":\"30\",\"TeslimatPerformans\":\"3.46\",\"TeslimatPerformansBadAdet\":\"13\",\"TeslimatPerformansBad\":\"101.34\",\"DropSayisi\":\"41\",\"AltKod\":\"\",\"Yesil\":\"41\",\"Turuncu\":\"0\",\"Kirmizi\":\"0\",\"NoktaAtisi\":\"11\",\"Yakin\":\"4\",\"Uzak\":\"4\",\"HataliKullanim\":\"22\",\"GeofenceHesaplanmayan\":\"0\",\"AdresDuzeltmeAdet\":\"\",\"Farklı Gün\":\"5\",\"Farklı Araç\":\"1\",\"Duraklama\":\"5\",\"RutDisi\":\"6\",\"PlannedStartDate\":\"2025-02-27\",\"WeekDay\":\"Thursday\"},{\"Depo\":\"KOŞ (ALANYA)\",\"Araç/Plaka\":\"07 BDU 310\",\"SürücüId\":\"CAFER YILMAZ\",\"Şöför Adı\":\"CAFER YILMAZ\",\"Toplam Adet\":\"48\",\"RutSayi\":\"30\",\"Olumlu Adet\":\"9\",\"Kısmi Olumlu Adet\":\"0\",\"Olumsuz Adet\":\"21\",\"Uğranmamış Adet\":\"0\",\"Devam Eden Adet\":\"0\",\"Sefer Sayısı\":\"1\",\"Toplam Sefer Süresi\":\"597\",\"Planlanan KM\":\"8.45\",\"Gerçekleşen KM\":\"379.15\",\"Geofence\":\"7.641800\",\"Adres Skor\":\"1000\",\"Planlanan Yol Süresi Dk\":\"6\",\"Planlanan İşlem Süresi\":\"318\",\"Gerçekleşen Dk\":\"130\",\"Noktada Bekleme - İş Süresi\":\"6\",\"Erken/Geç Dakika\":\"\",\"POD sayısı\":\"\",\"Sipariş Tip\":\"4\",\"Planlanan Lojistik Birim\":\"1\",\"Teslim Adresi Kod\":\"0\",\"Sipariş Veren Müşteri\":\"1\",\"Ödeyen Müşteri\":\"0\",\"Teslimat İlçesi\":\"2\",\"Teslimat İli\":\"1\",\"KG\":\"0.00\",\"KG Kapasite\":\"0.00\",\"Koli\":\"0.00\",\"Koli Kapasite\":\"0.00\",\"Desi\":\"0.00\",\"Desi Kapasite\":\"0.00\",\"Araç Tipi\":\"\",\"Araç Sahiplik\":\"\",\"SeferBaslatAdet\":\"1\",\"SeferBitisAdet\":\"1\",\"SeferBaslatmayanAdet\":\"0\",\"SeferDevamEden\":\"0\",\"TeslimatPerformansAdet\":\"26\",\"TeslimatPerformans\":\"2.48\",\"TeslimatPerformansBadAdet\":\"24\",\"TeslimatPerformansBad\":\"161.92\",\"DropSayisi\":\"48\",\"AltKod\":\"\",\"Yesil\":\"48\",\"Turuncu\":\"0\",\"Kirmizi\":\"0\",\"NoktaAtisi\":\"23\",\"Yakin\":\"4\",\"Uzak\":\"0\",\"HataliKullanim\":\"21\",\"GeofenceHesaplanmayan\":\"0\",\"AdresDuzeltmeAdet\":\"\",\"Farklı Gün\":\"0\",\"Farklı Araç\":\"10\",\"Duraklama\":\"8\",\"RutDisi\":\"10\",\"PlannedStartDate\":\"2025-02-28\",\"WeekDay\":\"Friday\"},{\"Depo\":\"KOŞ (ALANYA)\",\"Araç/Plaka\":\"07 BDU 310\",\"SürücüId\":\"CAFER YILMAZ\",\"Şöför Adı\":\"CAFER YILMAZ\",\"Toplam Adet\":\"35\",\"RutSayi\":\"29\",\"Olumlu Adet\":\"4\",\"Kısmi Olumlu Adet\":\"0\",\"Olumsuz Adet\":\"25\",\"Uğranmamış Adet\":\"0\",\"Devam Eden Adet\":\"0\",\"Sefer Sayısı\":\"1\",\"Toplam Sefer Süresi\":\"491\",\"Planlanan KM\":\"33.08\",\"Gerçekleşen KM\":\"202.95\",\"Geofence\":\"33.797081\",\"Adres Skor\":\"1000\",\"Planlanan Yol Süresi Dk\":\"26\",\"Planlanan İşlem Süresi\":\"259\",\"Gerçekleşen Dk\":\"27\",\"Noktada Bekleme - İş Süresi\":\"5\",\"Erken/Geç Dakika\":\"\",\"POD sayısı\":\"\",\"Sipariş Tip\":\"4\",\"Planlanan Lojistik Birim\":\"1\",\"Teslim Adresi Kod\":\"0\",\"Sipariş Veren Müşteri\":\"1\",\"Ödeyen Müşteri\":\"0\",\"Teslimat İlçesi\":\"4\",\"Teslimat İli\":\"1\",\"KG\":\"0.00\",\"KG Kapasite\":\"0.00\",\"Koli\":\"0.00\",\"Koli Kapasite\":\"0.00\",\"Desi\":\"0.00\",\"Desi Kapasite\":\"0.00\",\"Araç Tipi\":\"\",\"Araç Sahiplik\":\"\",\"SeferBaslatAdet\":\"1\",\"SeferBitisAdet\":\"1\",\"SeferBaslatmayanAdet\":\"0\",\"SeferDevamEden\":\"0\",\"TeslimatPerformansAdet\":\"28\",\"TeslimatPerformans\":\"2.19\",\"TeslimatPerformansBadAdet\":\"9\",\"TeslimatPerformansBad\":\"45.46\",\"DropSayisi\":\"35\",\"AltKod\":\"\",\"Yesil\":\"35\",\"Turuncu\":\"0\",\"Kirmizi\":\"0\",\"NoktaAtisi\":\"7\",\"Yakin\":\"3\",\"Uzak\":\"0\",\"HataliKullanim\":\"25\",\"GeofenceHesaplanmayan\":\"0\",\"AdresDuzeltmeAdet\":\"\",\"Farklı Gün\":\"1\",\"Farklı Araç\":\"1\",\"Duraklama\":\"4\",\"RutDisi\":\"2\",\"PlannedStartDate\":\"2025-03-01\",\"WeekDay\":\"Saturday\"},{\"Depo\":\"KOŞ (ALANYA)\",\"Araç/Plaka\":\"07 BDU 311\",\"SürücüId\":\"TURAN ÖZKAN\",\"Şöför Adı\":\"TURAN ÖZKAN\",\"Toplam Adet\":\"46\",\"RutSayi\":\"30\",\"Olumlu Adet\":\"6\",\"Kısmi Olumlu Adet\":\"0\",\"Olumsuz Adet\":\"24\",\"Uğranmamış Adet\":\"0\",\"Devam Eden Adet\":\"0\",\"Sefer Sayısı\":\"1\",\"Toplam Sefer Süresi\":\"519\",\"Planlanan KM\":\"21.10\",\"Gerçekleşen KM\":\"219.34\",\"Geofence\":\"2.929187\",\"Adres Skor\":\"1000\",\"Planlanan Yol Süresi Dk\":\"16\",\"Planlanan İşlem Süresi\":\"302\",\"Gerçekleşen Dk\":\"95\",\"Noktada Bekleme - İş Süresi\":\"5\",\"Erken/Geç Dakika\":\"\",\"POD sayısı\":\"\",\"Sipariş Tip\":\"4\",\"Planlanan Lojistik Birim\":\"1\",\"Teslim Adresi Kod\":\"0\",\"Sipariş Veren Müşteri\":\"1\",\"Ödeyen Müşteri\":\"0\",\"Teslimat İlçesi\":\"1\",\"Teslimat İli\":\"1\",\"KG\":\"0.00\",\"KG Kapasite\":\"0.00\",\"Koli\":\"0.00\",\"Koli Kapasite\":\"0.00\",\"Desi\":\"0.00\",\"Desi Kapasite\":\"0.00\",\"Araç Tipi\":\"\",\"Araç Sahiplik\":\"\",\"SeferBaslatAdet\":\"1\",\"SeferBitisAdet\":\"1\",\"SeferBaslatmayanAdet\":\"0\",\"SeferDevamEden\":\"0\",\"TeslimatPerformansAdet\":\"29\",\"TeslimatPerformans\":\"14.79\",\"TeslimatPerformansBadAdet\":\"19\",\"TeslimatPerformansBad\":\"117.02\",\"DropSayisi\":\"46\",\"AltKod\":\"\",\"Yesil\":\"46\",\"Turuncu\":\"0\",\"Kirmizi\":\"0\",\"NoktaAtisi\":\"18\",\"Yakin\":\"4\",\"Uzak\":\"0\",\"HataliKullanim\":\"24\",\"GeofenceHesaplanmayan\":\"0\",\"AdresDuzeltmeAdet\":\"\",\"Farklı Gün\":\"0\",\"Farklı Araç\":\"10\",\"Duraklama\":\"6\",\"RutDisi\":\"10\",\"PlannedStartDate\":\"2025-02-24\",\"WeekDay\":\"Monday\"},{\"Depo\":\"KOŞ (ALANYA)\",\"Araç/Plaka\":\"07 BDU 311\",\"SürücüId\":\"TURAN ÖZKAN\",\"Şöför Adı\":\"TURAN ÖZKAN\",\"Toplam Adet\":\"42\",\"RutSayi\":\"30\",\"Olumlu Adet\":\"13\",\"Kısmi Olumlu Adet\":\"0\",\"Olumsuz Adet\":\"17\",\"Uğranmamış Adet\":\"0\",\"Devam Eden Adet\":\"0\",\"Sefer Sayısı\":\"1\",\"Toplam Sefer Süresi\":\"522\",\"Planlanan KM\":\"30.29\",\"Gerçekleşen KM\":\"254.08\",\"Geofence\":\"4.047500\",\"Adres Skor\":\"1000\",\"Planlanan Yol Süresi Dk\":\"24\",\"Planlanan İşlem Süresi\":\"294\",\"Gerçekleşen Dk\":\"74\",\"Noktada Bekleme - İş Süresi\":\"7\",\"Erken/Geç Dakika\":\"\",\"POD sayısı\":\"\",\"Sipariş Tip\":\"5\",\"Planlanan Lojistik Birim\":\"1\",\"Teslim Adresi Kod\":\"0\",\"Sipariş Veren Müşteri\":\"1\",\"Ödeyen Müşteri\":\"0\",\"Teslimat İlçesi\":\"2\",\"Teslimat İli\":\"1\",\"KG\":\"0.00\",\"KG Kapasite\":\"0.00\",\"Koli\":\"0.00\",\"Koli Kapasite\":\"0.00\",\"Desi\":\"0.00\",\"Desi Kapasite\":\"0.00\",\"Araç Tipi\":\"\",\"Araç Sahiplik\":\"\",\"SeferBaslatAdet\":\"1\",\"SeferBitisAdet\":\"1\",\"SeferBaslatmayanAdet\":\"0\",\"SeferDevamEden\":\"0\",\"TeslimatPerformansAdet\":\"24\",\"TeslimatPerformans\":\"5.35\",\"TeslimatPerformansBadAdet\":\"20\",\"TeslimatPerformansBad\":\"103.24\",\"DropSayisi\":\"42\",\"AltKod\":\"\",\"Yesil\":\"42\",\"Turuncu\":\"0\",\"Kirmizi\":\"0\",\"NoktaAtisi\":\"19\",\"Yakin\":\"6\",\"Uzak\":\"0\",\"HataliKullanim\":\"17\",\"GeofenceHesaplanmayan\":\"0\",\"AdresDuzeltmeAdet\":\"\",\"Farklı Gün\":\"7\",\"Farklı Araç\":\"2\",\"Duraklama\":\"3\",\"RutDisi\":\"9\",\"PlannedStartDate\":\"2025-02-25\",\"WeekDay\":\"Tuesday\"},{\"Depo\":\"KOŞ (ALANYA)\",\"Araç/Plaka\":\"07 BDU 311\",\"SürücüId\":\"TURAN ÖZKAN\",\"Şöför Adı\":\"TURAN ÖZKAN\",\"Toplam Adet\":\"44\",\"RutSayi\":\"28\",\"Olumlu Adet\":\"2\",\"Kısmi Olumlu Adet\":\"0\",\"Olumsuz Adet\":\"26\",\"Uğranmamış Adet\":\"0\",\"Devam Eden Adet\":\"0\",\"Sefer Sayısı\":\"1\",\"Toplam Sefer Süresi\":\"517\",\"Planlanan KM\":\"65.93\",\"Gerçekleşen KM\":\"83.49\",\"Geofence\":\"21.499652\",\"Adres Skor\":\"1000\",\"Planlanan Yol Süresi Dk\":\"52\",\"Planlanan İşlem Süresi\":\"298\",\"Gerçekleşen Dk\":\"72\",\"Noktada Bekleme - İş Süresi\":\"6\",\"Erken/Geç Dakika\":\"\",\"POD sayısı\":\"\",\"Sipariş Tip\":\"4\",\"Planlanan Lojistik Birim\":\"1\",\"Teslim Adresi Kod\":\"0\",\"Sipariş Veren Müşteri\":\"1\",\"Ödeyen Müşteri\":\"0\",\"Teslimat İlçesi\":\"2\",\"Teslimat İli\":\"1\",\"KG\":\"0.00\",\"KG Kapasite\":\"0.00\",\"Koli\":\"0.00\",\"Koli Kapasite\":\"0.00\",\"Desi\":\"0.00\",\"Desi Kapasite\":\"0.00\",\"Araç Tipi\":\"\",\"Araç Sahiplik\":\"\",\"SeferBaslatAdet\":\"1\",\"SeferBitisAdet\":\"1\",\"SeferBaslatmayanAdet\":\"0\",\"SeferDevamEden\":\"0\",\"TeslimatPerformansAdet\":\"30\",\"TeslimatPerformans\":\"6.92\",\"TeslimatPerformansBadAdet\":\"16\",\"TeslimatPerformansBad\":\"94.32\",\"DropSayisi\":\"44\",\"AltKod\":\"\",\"Yesil\":\"44\",\"Turuncu\":\"0\",\"Kirmizi\":\"0\",\"NoktaAtisi\":\"15\",\"Yakin\":\"3\",\"Uzak\":\"0\",\"HataliKullanim\":\"26\",\"GeofenceHesaplanmayan\":\"0\",\"AdresDuzeltmeAdet\":\"\",\"Farklı Gün\":\"11\",\"Farklı Araç\":\"3\",\"Duraklama\":\"2\",\"RutDisi\":\"14\",\"PlannedStartDate\":\"2025-02-26\",\"WeekDay\":\"Wednesday\"},{\"Depo\":\"KOŞ (ALANYA)\",\"Araç/Plaka\":\"07 BDU 311\",\"SürücüId\":\"TURAN ÖZKAN\",\"Şöför Adı\":\"TURAN ÖZKAN\",\"Toplam Adet\":\"33\",\"RutSayi\":\"27\",\"Olumlu Adet\":\"14\",\"Kısmi Olumlu Adet\":\"0\",\"Olumsuz Adet\":\"13\",\"Uğranmamış Adet\":\"0\",\"Devam Eden Adet\":\"0\",\"Sefer Sayısı\":\"1\",\"Toplam Sefer Süresi\":\"524\",\"Planlanan KM\":\"21.24\",\"Gerçekleşen KM\":\"133.03\",\"Geofence\":\"2.240000\",\"Adres Skor\":\"1000\",\"Planlanan Yol Süresi Dk\":\"16\",\"Planlanan İşlem Süresi\":\"246\",\"Gerçekleşen Dk\":\"55\",\"Noktada Bekleme - İş Süresi\":\"10\",\"Erken/Geç Dakika\":\"\",\"POD sayısı\":\"\",\"Sipariş Tip\":\"4\",\"Planlanan Lojistik Birim\":\"1\",\"Teslim Adresi Kod\":\"0\",\"Sipariş Veren Müşteri\":\"1\",\"Ödeyen Müşteri\":\"0\",\"Teslimat İlçesi\":\"1\",\"Teslimat İli\":\"1\",\"KG\":\"0.00\",\"KG Kapasite\":\"0.00\",\"Koli\":\"0.00\",\"Koli Kapasite\":\"0.00\",\"Desi\":\"0.00\",\"Desi Kapasite\":\"0.00\",\"Araç Tipi\":\"\",\"Araç Sahiplik\":\"\",\"SeferBaslatAdet\":\"1\",\"SeferBitisAdet\":\"1\",\"SeferBaslatmayanAdet\":\"0\",\"SeferDevamEden\":\"0\",\"TeslimatPerformansAdet\":\"22\",\"TeslimatPerformans\":\"8.82\",\"TeslimatPerformansBadAdet\":\"13\",\"TeslimatPerformansBad\":\"95.45\",\"DropSayisi\":\"33\",\"AltKod\":\"\",\"Yesil\":\"33\",\"Turuncu\":\"0\",\"Kirmizi\":\"0\",\"NoktaAtisi\":\"12\",\"Yakin\":\"8\",\"Uzak\":\"0\",\"HataliKullanim\":\"13\",\"GeofenceHesaplanmayan\":\"0\",\"AdresDuzeltmeAdet\":\"\",\"Farklı Gün\":\"2\",\"Farklı Araç\":\"0\",\"Duraklama\":\"4\",\"RutDisi\":\"2\",\"PlannedStartDate\":\"2025-02-27\",\"WeekDay\":\"Thursday\"},{\"Depo\":\"KOŞ (ALANYA)\",\"Araç/Plaka\":\"07 BDU 311\",\"SürücüId\":\"TURAN ÖZKAN\",\"Şöför Adı\":\"TURAN ÖZKAN\",\"Toplam Adet\":\"32\",\"RutSayi\":\"28\",\"Olumlu Adet\":\"10\",\"Kısmi Olumlu Adet\":\"0\",\"Olumsuz Adet\":\"18\",\"Uğranmamış Adet\":\"0\",\"Devam Eden Adet\":\"0\",\"Sefer Sayısı\":\"1\",\"Toplam Sefer Süresi\":\"477\",\"Planlanan KM\":\"30.20\",\"Gerçekleşen KM\":\"39.39\",\"Geofence\":\"9.131735\",\"Adres Skor\":\"1000\",\"Planlanan Yol Süresi Dk\":\"24\",\"Planlanan İşlem Süresi\":\"244\",\"Gerçekleşen Dk\":\"16\",\"Noktada Bekleme - İş Süresi\":\"9\",\"Erken/Geç Dakika\":\"\",\"POD sayısı\":\"\",\"Sipariş Tip\":\"5\",\"Planlanan Lojistik Birim\":\"1\",\"Teslim Adresi Kod\":\"0\",\"Sipariş Veren Müşteri\":\"1\",\"Ödeyen Müşteri\":\"0\",\"Teslimat İlçesi\":\"1\",\"Teslimat İli\":\"1\",\"KG\":\"0.00\",\"KG Kapasite\":\"0.00\",\"Koli\":\"0.00\",\"Koli Kapasite\":\"0.00\",\"Desi\":\"0.00\",\"Desi Kapasite\":\"0.00\",\"Araç Tipi\":\"\",\"Araç Sahiplik\":\"\",\"SeferBaslatAdet\":\"1\",\"SeferBitisAdet\":\"1\",\"SeferBaslatmayanAdet\":\"0\",\"SeferDevamEden\":\"0\",\"TeslimatPerformansAdet\":\"24\",\"TeslimatPerformans\":\"4.76\",\"TeslimatPerformansBadAdet\":\"10\",\"TeslimatPerformansBad\":\"28.09\",\"DropSayisi\":\"32\",\"AltKod\":\"\",\"Yesil\":\"32\",\"Turuncu\":\"0\",\"Kirmizi\":\"0\",\"NoktaAtisi\":\"11\",\"Yakin\":\"3\",\"Uzak\":\"0\",\"HataliKullanim\":\"18\",\"GeofenceHesaplanmayan\":\"0\",\"AdresDuzeltmeAdet\":\"\",\"Farklı Gün\":\"0\",\"Farklı Araç\":\"1\",\"Duraklama\":\"3\",\"RutDisi\":\"1\",\"PlannedStartDate\":\"2025-02-28\",\"WeekDay\":\"Friday\"},{\"Depo\":\"KOŞ (ALANYA)\",\"Araç/Plaka\":\"07 BDU 311\",\"SürücüId\":\"TURAN ÖZKAN\",\"Şöför Adı\":\"TURAN ÖZKAN\",\"Toplam Adet\":\"30\",\"RutSayi\":\"27\",\"Olumlu Adet\":\"21\",\"Kısmi Olumlu Adet\":\"0\",\"Olumsuz Adet\":\"6\",\"Uğranmamış Adet\":\"0\",\"Devam Eden Adet\":\"0\",\"Sefer Sayısı\":\"1\",\"Toplam Sefer Süresi\":\"249\",\"Planlanan KM\":\"73.68\",\"Gerçekleşen KM\":\"102.43\",\"Geofence\":\"7.705687\",\"Adres Skor\":\"1000\",\"Planlanan Yol Süresi Dk\":\"58\",\"Planlanan İşlem Süresi\":\"228\",\"Gerçekleşen Dk\":\"22\",\"Noktada Bekleme - İş Süresi\":\"2\",\"Erken/Geç Dakika\":\"\",\"POD sayısı\":\"\",\"Sipariş Tip\":\"4\",\"Planlanan Lojistik Birim\":\"1\",\"Teslim Adresi Kod\":\"0\",\"Sipariş Veren Müşteri\":\"1\",\"Ödeyen Müşteri\":\"0\",\"Teslimat İlçesi\":\"2\",\"Teslimat İli\":\"1\",\"KG\":\"0.00\",\"KG Kapasite\":\"0.00\",\"Koli\":\"0.00\",\"Koli Kapasite\":\"0.00\",\"Desi\":\"0.00\",\"Desi Kapasite\":\"0.00\",\"Araç Tipi\":\"\",\"Araç Sahiplik\":\"\",\"SeferBaslatAdet\":\"1\",\"SeferBitisAdet\":\"1\",\"SeferBaslatmayanAdet\":\"0\",\"SeferDevamEden\":\"0\",\"TeslimatPerformansAdet\":\"20\",\"TeslimatPerformans\":\"16.94\",\"TeslimatPerformansBadAdet\":\"12\",\"TeslimatPerformansBad\":\"35.80\",\"DropSayisi\":\"30\",\"AltKod\":\"\",\"Yesil\":\"30\",\"Turuncu\":\"0\",\"Kirmizi\":\"0\",\"NoktaAtisi\":\"22\",\"Yakin\":\"2\",\"Uzak\":\"0\",\"HataliKullanim\":\"6\",\"GeofenceHesaplanmayan\":\"0\",\"AdresDuzeltmeAdet\":\"\",\"Farklı Gün\":\"1\",\"Farklı Araç\":\"0\",\"Duraklama\":\"2\",\"RutDisi\":\"1\",\"PlannedStartDate\":\"2025-03-01\",\"WeekDay\":\"Saturday\"},{\"Depo\":\"KOŞ (ALANYA)\",\"Araç/Plaka\":\"07 BEC 403\",\"SürücüId\":\"RAMAZAN KAZAN\",\"Şöför Adı\":\"RAMAZAN KAZAN\",\"Toplam Adet\":\"42\",\"RutSayi\":\"26\",\"Olumlu Adet\":\"2\",\"Kısmi Olumlu Adet\":\"0\",\"Olumsuz Adet\":\"24\",\"Uğranmamış Adet\":\"0\",\"Devam Eden Adet\":\"0\",\"Sefer Sayısı\":\"1\",\"Toplam Sefer Süresi\":\"450\",\"Planlanan KM\":\"69.33\",\"Gerçekleşen KM\":\"216.64\",\"Geofence\":\"23.488295\",\"Adres Skor\":\"1000\",\"Planlanan Yol Süresi Dk\":\"55\",\"Planlanan İşlem Süresi\":\"282\",\"Gerçekleşen Dk\":\"89\",\"Noktada Bekleme - İş Süresi\":\"5\",\"Erken/Geç Dakika\":\"\",\"POD sayısı\":\"\",\"Sipariş Tip\":\"4\",\"Planlanan Lojistik Birim\":\"1\",\"Teslim Adresi Kod\":\"0\",\"Sipariş Veren Müşteri\":\"1\",\"Ödeyen Müşteri\":\"0\",\"Teslimat İlçesi\":\"2\",\"Teslimat İli\":\"1\",\"KG\":\"0.00\",\"KG Kapasite\":\"0.00\",\"Koli\":\"0.00\",\"Koli Kapasite\":\"0.00\",\"Desi\":\"0.00\",\"Desi Kapasite\":\"0.00\",\"Araç Tipi\":\"\",\"Araç Sahiplik\":\"\",\"SeferBaslatAdet\":\"1\",\"SeferBitisAdet\":\"1\",\"SeferBaslatmayanAdet\":\"0\",\"SeferDevamEden\":\"0\",\"TeslimatPerformansAdet\":\"5\",\"TeslimatPerformans\":\"\",\"TeslimatPerformansBadAdet\":\"39\",\"TeslimatPerformansBad\":\"127.12\",\"DropSayisi\":\"42\",\"AltKod\":\"\",\"Yesil\":\"42\",\"Turuncu\":\"0\",\"Kirmizi\":\"0\",\"NoktaAtisi\":\"18\",\"Yakin\":\"0\",\"Uzak\":\"0\",\"HataliKullanim\":\"24\",\"GeofenceHesaplanmayan\":\"0\",\"AdresDuzeltmeAdet\":\"\",\"Farklı Gün\":\"10\",\"Farklı Araç\":\"0\",\"Duraklama\":\"6\",\"RutDisi\":\"10\",\"PlannedStartDate\":\"2025-02-24\",\"WeekDay\":\"Monday\"},{\"Depo\":\"KOŞ (ALANYA)\",\"Araç/Plaka\":\"07 BEC 403\",\"SürücüId\":\"RAMAZAN KAZAN\",\"Şöför Adı\":\"RAMAZAN KAZAN\",\"Toplam Adet\":\"50\",\"RutSayi\":\"34\",\"Olumlu Adet\":\"5\",\"Kısmi Olumlu Adet\":\"0\",\"Olumsuz Adet\":\"29\",\"Uğranmamış Adet\":\"0\",\"Devam Eden Adet\":\"0\",\"Sefer Sayısı\":\"1\",\"Toplam Sefer Süresi\":\"407\",\"Planlanan KM\":\"70.65\",\"Gerçekleşen KM\":\"253.59\",\"Geofence\":\"24.658769\",\"Adres Skor\":\"1000\",\"Planlanan Yol Süresi Dk\":\"56\",\"Planlanan İşlem Süresi\":\"343\",\"Gerçekleşen Dk\":\"71\",\"Noktada Bekleme - İş Süresi\":\"4\",\"Erken/Geç Dakika\":\"\",\"POD sayısı\":\"\",\"Sipariş Tip\":\"6\",\"Planlanan Lojistik Birim\":\"1\",\"Teslim Adresi Kod\":\"0\",\"Sipariş Veren Müşteri\":\"1\",\"Ödeyen Müşteri\":\"0\",\"Teslimat İlçesi\":\"2\",\"Teslimat İli\":\"1\",\"KG\":\"0.00\",\"KG Kapasite\":\"0.00\",\"Koli\":\"0.00\",\"Koli Kapasite\":\"0.00\",\"Desi\":\"0.00\",\"Desi Kapasite\":\"0.00\",\"Araç Tipi\":\"\",\"Araç Sahiplik\":\"\",\"SeferBaslatAdet\":\"1\",\"SeferBitisAdet\":\"1\",\"SeferBaslatmayanAdet\":\"0\",\"SeferDevamEden\":\"0\",\"TeslimatPerformansAdet\":\"3\",\"TeslimatPerformans\":\"\",\"TeslimatPerformansBadAdet\":\"49\",\"TeslimatPerformansBad\":\"85.44\",\"DropSayisi\":\"50\",\"AltKod\":\"\",\"Yesil\":\"50\",\"Turuncu\":\"0\",\"Kirmizi\":\"0\",\"NoktaAtisi\":\"19\",\"Yakin\":\"2\",\"Uzak\":\"0\",\"HataliKullanim\":\"29\",\"GeofenceHesaplanmayan\":\"0\",\"AdresDuzeltmeAdet\":\"\",\"Farklı Gün\":\"6\",\"Farklı Araç\":\"1\",\"Duraklama\":\"9\",\"RutDisi\":\"7\",\"PlannedStartDate\":\"2025-02-25\",\"WeekDay\":\"Tuesday\"},{\"Depo\":\"KOŞ (ALANYA)\",\"Araç/Plaka\":\"07 BEC 403\",\"SürücüId\":\"RAMAZAN KAZAN\",\"Şöför Adı\":\"RAMAZAN KAZAN\",\"Toplam Adet\":\"41\",\"RutSayi\":\"30\",\"Olumlu Adet\":\"6\",\"Kısmi Olumlu Adet\":\"0\",\"Olumsuz Adet\":\"24\",\"Uğranmamış Adet\":\"0\",\"Devam Eden Adet\":\"0\",\"Sefer Sayısı\":\"1\",\"Toplam Sefer Süresi\":\"786\",\"Planlanan KM\":\"73.12\",\"Gerçekleşen KM\":\"196.82\",\"Geofence\":\"26.927441\",\"Adres Skor\":\"1000\",\"Planlanan Yol Süresi Dk\":\"58\",\"Planlanan İşlem Süresi\":\"277\",\"Gerçekleşen Dk\":\"63\",\"Noktada Bekleme - İş Süresi\":\"8\",\"Erken/Geç Dakika\":\"\",\"POD sayısı\":\"\",\"Sipariş Tip\":\"5\",\"Planlanan Lojistik Birim\":\"1\",\"Teslim Adresi Kod\":\"0\",\"Sipariş Veren Müşteri\":\"1\",\"Ödeyen Müşteri\":\"0\",\"Teslimat İlçesi\":\"2\",\"Teslimat İli\":\"1\",\"KG\":\"0.00\",\"KG Kapasite\":\"0.00\",\"Koli\":\"0.00\",\"Koli Kapasite\":\"0.00\",\"Desi\":\"0.00\",\"Desi Kapasite\":\"0.00\",\"Araç Tipi\":\"\",\"Araç Sahiplik\":\"\",\"SeferBaslatAdet\":\"1\",\"SeferBitisAdet\":\"1\",\"SeferBaslatmayanAdet\":\"0\",\"SeferDevamEden\":\"0\",\"TeslimatPerformansAdet\":\"27\",\"TeslimatPerformans\":\"4.00\",\"TeslimatPerformansBadAdet\":\"16\",\"TeslimatPerformansBad\":\"90.02\",\"DropSayisi\":\"41\",\"AltKod\":\"\",\"Yesil\":\"41\",\"Turuncu\":\"0\",\"Kirmizi\":\"0\",\"NoktaAtisi\":\"14\",\"Yakin\":\"3\",\"Uzak\":\"0\",\"HataliKullanim\":\"24\",\"GeofenceHesaplanmayan\":\"0\",\"AdresDuzeltmeAdet\":\"\",\"Farklı Gün\":\"2\",\"Farklı Araç\":\"4\",\"Duraklama\":\"5\",\"RutDisi\":\"6\",\"PlannedStartDate\":\"2025-02-26\",\"WeekDay\":\"Wednesday\"},{\"Depo\":\"KOŞ (ALANYA)\",\"Araç/Plaka\":\"07 BEC 403\",\"SürücüId\":\"RAMAZAN KAZAN\",\"Şöför Adı\":\"RAMAZAN KAZAN\",\"Toplam Adet\":\"33\",\"RutSayi\":\"25\",\"Olumlu Adet\":\"14\",\"Kısmi Olumlu Adet\":\"0\",\"Olumsuz Adet\":\"11\",\"Uğranmamış Adet\":\"0\",\"Devam Eden Adet\":\"0\",\"Sefer Sayısı\":\"1\",\"Toplam Sefer Süresi\":\"625\",\"Planlanan KM\":\"69.33\",\"Gerçekleşen KM\":\"320.11\",\"Geofence\":\"13.517800\",\"Adres Skor\":\"1000\",\"Planlanan Yol Süresi Dk\":\"55\",\"Planlanan İşlem Süresi\":\"234\",\"Gerçekleşen Dk\":\"66\",\"Noktada Bekleme - İş Süresi\":\"10\",\"Erken/Geç Dakika\":\"\",\"POD sayısı\":\"\",\"Sipariş Tip\":\"4\",\"Planlanan Lojistik Birim\":\"1\",\"Teslim Adresi Kod\":\"0\",\"Sipariş Veren Müşteri\":\"1\",\"Ödeyen Müşteri\":\"0\",\"Teslimat İlçesi\":\"2\",\"Teslimat İli\":\"1\",\"KG\":\"0.00\",\"KG Kapasite\":\"0.00\",\"Koli\":\"0.00\",\"Koli Kapasite\":\"0.00\",\"Desi\":\"0.00\",\"Desi Kapasite\":\"0.00\",\"Araç Tipi\":\"\",\"Araç Sahiplik\":\"\",\"SeferBaslatAdet\":\"1\",\"SeferBitisAdet\":\"1\",\"SeferBaslatmayanAdet\":\"0\",\"SeferDevamEden\":\"0\",\"TeslimatPerformansAdet\":\"17\",\"TeslimatPerformans\":\"2.64\",\"TeslimatPerformansBadAdet\":\"18\",\"TeslimatPerformansBad\":\"119.21\",\"DropSayisi\":\"33\",\"AltKod\":\"\",\"Yesil\":\"33\",\"Turuncu\":\"0\",\"Kirmizi\":\"0\",\"NoktaAtisi\":\"18\",\"Yakin\":\"4\",\"Uzak\":\"0\",\"HataliKullanim\":\"11\",\"GeofenceHesaplanmayan\":\"0\",\"AdresDuzeltmeAdet\":\"\",\"Farklı Gün\":\"0\",\"Farklı Araç\":\"1\",\"Duraklama\":\"7\",\"RutDisi\":\"1\",\"PlannedStartDate\":\"2025-02-27\",\"WeekDay\":\"Thursday\"},{\"Depo\":\"KOŞ (ALANYA)\",\"Araç/Plaka\":\"07 BEC 403\",\"SürücüId\":\"RAMAZAN KAZAN\",\"Şöför Adı\":\"RAMAZAN KAZAN\",\"Toplam Adet\":\"35\",\"RutSayi\":\"33\",\"Olumlu Adet\":\"1\",\"Kısmi Olumlu Adet\":\"0\",\"Olumsuz Adet\":\"32\",\"Uğranmamış Adet\":\"0\",\"Devam Eden Adet\":\"0\",\"Sefer Sayısı\":\"1\",\"Toplam Sefer Süresi\":\"467\",\"Planlanan KM\":\"70.65\",\"Gerçekleşen KM\":\"2.24\",\"Geofence\":\"49.729486\",\"Adres Skor\":\"1000\",\"Planlanan Yol Süresi Dk\":\"56\",\"Planlanan İşlem Süresi\":\"271\",\"Gerçekleşen Dk\":\"32\",\"Noktada Bekleme - İş Süresi\":\"10\",\"Erken/Geç Dakika\":\"\",\"POD sayısı\":\"\",\"Sipariş Tip\":\"4\",\"Planlanan Lojistik Birim\":\"1\",\"Teslim Adresi Kod\":\"0\",\"Sipariş Veren Müşteri\":\"1\",\"Ödeyen Müşteri\":\"0\",\"Teslimat İlçesi\":\"2\",\"Teslimat İli\":\"1\",\"KG\":\"0.00\",\"KG Kapasite\":\"0.00\",\"Koli\":\"0.00\",\"Koli Kapasite\":\"0.00\",\"Desi\":\"0.00\",\"Desi Kapasite\":\"0.00\",\"Araç Tipi\":\"\",\"Araç Sahiplik\":\"\",\"SeferBaslatAdet\":\"1\",\"SeferBitisAdet\":\"1\",\"SeferBaslatmayanAdet\":\"0\",\"SeferDevamEden\":\"0\",\"TeslimatPerformansAdet\":\"4\",\"TeslimatPerformans\":\"\",\"TeslimatPerformansBadAdet\":\"33\",\"TeslimatPerformansBad\":\"55.40\",\"DropSayisi\":\"35\",\"AltKod\":\"\",\"Yesil\":\"35\",\"Turuncu\":\"0\",\"Kirmizi\":\"0\",\"NoktaAtisi\":\"2\",\"Yakin\":\"1\",\"Uzak\":\"0\",\"HataliKullanim\":\"32\",\"GeofenceHesaplanmayan\":\"0\",\"AdresDuzeltmeAdet\":\"\",\"Farklı Gün\":\"0\",\"Farklı Araç\":\"0\",\"Duraklama\":\"2\",\"RutDisi\":\"0\",\"PlannedStartDate\":\"2025-02-28\",\"WeekDay\":\"Friday\"},{\"Depo\":\"KOŞ (ALANYA)\",\"Araç/Plaka\":\"07 BEC 403\",\"SürücüId\":\"RAMAZAN KAZAN\",\"Şöför Adı\":\"RAMAZAN KAZAN\",\"Toplam Adet\":\"41\",\"RutSayi\":\"27\",\"Olumlu Adet\":\"4\",\"Kısmi Olumlu Adet\":\"0\",\"Olumsuz Adet\":\"23\",\"Uğranmamış Adet\":\"0\",\"Devam Eden Adet\":\"0\",\"Sefer Sayısı\":\"1\",\"Toplam Sefer Süresi\":\"362\",\"Planlanan KM\":\"75.07\",\"Gerçekleşen KM\":\"181.05\",\"Geofence\":\"28.841604\",\"Adres Skor\":\"1000\",\"Planlanan Yol Süresi Dk\":\"60\",\"Planlanan İşlem Süresi\":\"274\",\"Gerçekleşen Dk\":\"62\",\"Noktada Bekleme - İş Süresi\":\"4\",\"Erken/Geç Dakika\":\"\",\"POD sayısı\":\"\",\"Sipariş Tip\":\"5\",\"Planlanan Lojistik Birim\":\"1\",\"Teslim Adresi Kod\":\"0\",\"Sipariş Veren Müşteri\":\"1\",\"Ödeyen Müşteri\":\"0\",\"Teslimat İlçesi\":\"2\",\"Teslimat İli\":\"1\",\"KG\":\"0.00\",\"KG Kapasite\":\"0.00\",\"Koli\":\"0.00\",\"Koli Kapasite\":\"0.00\",\"Desi\":\"0.00\",\"Desi Kapasite\":\"0.00\",\"Araç Tipi\":\"\",\"Araç Sahiplik\":\"\",\"SeferBaslatAdet\":\"1\",\"SeferBitisAdet\":\"1\",\"SeferBaslatmayanAdet\":\"0\",\"SeferDevamEden\":\"0\",\"TeslimatPerformansAdet\":\"4\",\"TeslimatPerformans\":\"\",\"TeslimatPerformansBadAdet\":\"39\",\"TeslimatPerformansBad\":\"90.88\",\"DropSayisi\":\"41\",\"AltKod\":\"\",\"Yesil\":\"41\",\"Turuncu\":\"0\",\"Kirmizi\":\"0\",\"NoktaAtisi\":\"14\",\"Yakin\":\"4\",\"Uzak\":\"0\",\"HataliKullanim\":\"23\",\"GeofenceHesaplanmayan\":\"0\",\"AdresDuzeltmeAdet\":\"\",\"Farklı Gün\":\"5\",\"Farklı Araç\":\"4\",\"Duraklama\":\"5\",\"RutDisi\":\"9\",\"PlannedStartDate\":\"2025-03-01\",\"WeekDay\":\"Saturday\"},{\"Depo\":\"KOŞ (ALANYA)\",\"Araç/Plaka\":\"07 BEC 404\",\"SürücüId\":\"SERKAN BERAT\",\"Şöför Adı\":\"SERKAN BERAT\",\"Toplam Adet\":\"53\",\"RutSayi\":\"34\",\"Olumlu Adet\":\"5\",\"Kısmi Olumlu Adet\":\"0\",\"Olumsuz Adet\":\"29\",\"Uğranmamış Adet\":\"0\",\"Devam Eden Adet\":\"0\",\"Sefer Sayısı\":\"1\",\"Toplam Sefer Süresi\":\"504\",\"Planlanan KM\":\"17.74\",\"Gerçekleşen KM\":\"117.46\",\"Geofence\":\"0.898363\",\"Adres Skor\":\"1000\",\"Planlanan Yol Süresi Dk\":\"14\",\"Planlanan İşlem Süresi\":\"358\",\"Gerçekleşen Dk\":\"92\",\"Noktada Bekleme - İş Süresi\":\"6\",\"Erken/Geç Dakika\":\"\",\"POD sayısı\":\"\",\"Sipariş Tip\":\"5\",\"Planlanan Lojistik Birim\":\"1\",\"Teslim Adresi Kod\":\"0\",\"Sipariş Veren Müşteri\":\"1\",\"Ödeyen Müşteri\":\"0\",\"Teslimat İlçesi\":\"1\",\"Teslimat İli\":\"1\",\"KG\":\"0.00\",\"KG Kapasite\":\"0.00\",\"Koli\":\"0.00\",\"Koli Kapasite\":\"0.00\",\"Desi\":\"0.00\",\"Desi Kapasite\":\"0.00\",\"Araç Tipi\":\"\",\"Araç Sahiplik\":\"\",\"SeferBaslatAdet\":\"1\",\"SeferBitisAdet\":\"1\",\"SeferBaslatmayanAdet\":\"0\",\"SeferDevamEden\":\"0\",\"TeslimatPerformansAdet\":\"33\",\"TeslimatPerformans\":\"2.03\",\"TeslimatPerformansBadAdet\":\"22\",\"TeslimatPerformansBad\":\"103.94\",\"DropSayisi\":\"53\",\"AltKod\":\"\",\"Yesil\":\"53\",\"Turuncu\":\"0\",\"Kirmizi\":\"0\",\"NoktaAtisi\":\"20\",\"Yakin\":\"6\",\"Uzak\":\"8\",\"HataliKullanim\":\"19\",\"GeofenceHesaplanmayan\":\"0\",\"AdresDuzeltmeAdet\":\"\",\"Farklı Gün\":\"10\",\"Farklı Araç\":\"2\",\"Duraklama\":\"7\",\"RutDisi\":\"12\",\"PlannedStartDate\":\"2025-02-24\",\"WeekDay\":\"Monday\"},{\"Depo\":\"KOŞ (ALANYA)\",\"Araç/Plaka\":\"07 BEC 404\",\"SürücüId\":\"SERKAN BERAT\",\"Şöför Adı\":\"SERKAN BERAT\",\"Toplam Adet\":\"40\",\"RutSayi\":\"33\",\"Olumlu Adet\":\"18\",\"Kısmi Olumlu Adet\":\"0\",\"Olumsuz Adet\":\"15\",\"Uğranmamış Adet\":\"0\",\"Devam Eden Adet\":\"0\",\"Sefer Sayısı\":\"1\",\"Toplam Sefer Süresi\":\"473\",\"Planlanan KM\":\"13.51\",\"Gerçekleşen KM\":\"46.35\",\"Geofence\":\"0.772238\",\"Adres Skor\":\"1000\",\"Planlanan Yol Süresi Dk\":\"10\",\"Planlanan İşlem Süresi\":\"293\",\"Gerçekleşen Dk\":\"53\",\"Noktada Bekleme - İş Süresi\":\"8\",\"Erken/Geç Dakika\":\"\",\"POD sayısı\":\"\",\"Sipariş Tip\":\"5\",\"Planlanan Lojistik Birim\":\"1\",\"Teslim Adresi Kod\":\"0\",\"Sipariş Veren Müşteri\":\"1\",\"Ödeyen Müşteri\":\"0\",\"Teslimat İlçesi\":\"1\",\"Teslimat İli\":\"1\",\"KG\":\"0.00\",\"KG Kapasite\":\"0.00\",\"Koli\":\"0.00\",\"Koli Kapasite\":\"0.00\",\"Desi\":\"0.00\",\"Desi Kapasite\":\"0.00\",\"Araç Tipi\":\"\",\"Araç Sahiplik\":\"\",\"SeferBaslatAdet\":\"1\",\"SeferBitisAdet\":\"1\",\"SeferBaslatmayanAdet\":\"0\",\"SeferDevamEden\":\"0\",\"TeslimatPerformansAdet\":\"23\",\"TeslimatPerformans\":\"5.56\",\"TeslimatPerformansBadAdet\":\"19\",\"TeslimatPerformansBad\":\"78.18\",\"DropSayisi\":\"40\",\"AltKod\":\"\",\"Yesil\":\"40\",\"Turuncu\":\"0\",\"Kirmizi\":\"0\",\"NoktaAtisi\":\"15\",\"Yakin\":\"11\",\"Uzak\":\"3\",\"HataliKullanim\":\"11\",\"GeofenceHesaplanmayan\":\"0\",\"AdresDuzeltmeAdet\":\"\",\"Farklı Gün\":\"3\",\"Farklı Araç\":\"0\",\"Duraklama\":\"4\",\"RutDisi\":\"3\",\"PlannedStartDate\":\"2025-02-25\",\"WeekDay\":\"Tuesday\"},{\"Depo\":\"KOŞ (ALANYA)\",\"Araç/Plaka\":\"07 BEC 404\",\"SürücüId\":\"SERKAN BERAT\",\"Şöför Adı\":\"SERKAN BERAT\",\"Toplam Adet\":\"57\",\"RutSayi\":\"38\",\"Olumlu Adet\":\"5\",\"Kısmi Olumlu Adet\":\"0\",\"Olumsuz Adet\":\"33\",\"Uğranmamış Adet\":\"0\",\"Devam Eden Adet\":\"0\",\"Sefer Sayısı\":\"1\",\"Toplam Sefer Süresi\":\"488\",\"Planlanan KM\":\"10.49\",\"Gerçekleşen KM\":\"143.28\",\"Geofence\":\"2.299813\",\"Adres Skor\":\"1000\",\"Planlanan Yol Süresi Dk\":\"8\",\"Planlanan İşlem Süresi\":\"384\",\"Gerçekleşen Dk\":\"85\",\"Noktada Bekleme - İş Süresi\":\"4\",\"Erken/Geç Dakika\":\"\",\"POD sayısı\":\"\",\"Sipariş Tip\":\"5\",\"Planlanan Lojistik Birim\":\"1\",\"Teslim Adresi Kod\":\"0\",\"Sipariş Veren Müşteri\":\"1\",\"Ödeyen Müşteri\":\"0\",\"Teslimat İlçesi\":\"1\",\"Teslimat İli\":\"1\",\"KG\":\"0.00\",\"KG Kapasite\":\"0.00\",\"Koli\":\"0.00\",\"Koli Kapasite\":\"0.00\",\"Desi\":\"0.00\",\"Desi Kapasite\":\"0.00\",\"Araç Tipi\":\"\",\"Araç Sahiplik\":\"\",\"SeferBaslatAdet\":\"1\",\"SeferBitisAdet\":\"1\",\"SeferBaslatmayanAdet\":\"0\",\"SeferDevamEden\":\"0\",\"TeslimatPerformansAdet\":\"36\",\"TeslimatPerformans\":\"4.00\",\"TeslimatPerformansBadAdet\":\"23\",\"TeslimatPerformansBad\":\"87.74\",\"DropSayisi\":\"57\",\"AltKod\":\"\",\"Yesil\":\"57\",\"Turuncu\":\"0\",\"Kirmizi\":\"0\",\"NoktaAtisi\":\"20\",\"Yakin\":\"4\",\"Uzak\":\"0\",\"HataliKullanim\":\"33\",\"GeofenceHesaplanmayan\":\"0\",\"AdresDuzeltmeAdet\":\"\",\"Farklı Gün\":\"11\",\"Farklı Araç\":\"1\",\"Duraklama\":\"7\",\"RutDisi\":\"12\",\"PlannedStartDate\":\"2025-02-26\",\"WeekDay\":\"Wednesday\"},{\"Depo\":\"KOŞ (ALANYA)\",\"Araç/Plaka\":\"07 BEC 404\",\"SürücüId\":\"SERKAN BERAT\",\"Şöför Adı\":\"SERKAN BERAT\",\"Toplam Adet\":\"38\",\"RutSayi\":\"30\",\"Olumlu Adet\":\"10\",\"Kısmi Olumlu Adet\":\"0\",\"Olumsuz Adet\":\"20\",\"Uğranmamış Adet\":\"0\",\"Devam Eden Adet\":\"0\",\"Sefer Sayısı\":\"1\",\"Toplam Sefer Süresi\":\"464\",\"Planlanan KM\":\"17.57\",\"Gerçekleşen KM\":\"141.92\",\"Geofence\":\"1.135900\",\"Adres Skor\":\"1000\",\"Planlanan Yol Süresi Dk\":\"14\",\"Planlanan İşlem Süresi\":\"274\",\"Gerçekleşen Dk\":\"63\",\"Noktada Bekleme - İş Süresi\":\"5\",\"Erken/Geç Dakika\":\"\",\"POD sayısı\":\"\",\"Sipariş Tip\":\"5\",\"Planlanan Lojistik Birim\":\"1\",\"Teslim Adresi Kod\":\"0\",\"Sipariş Veren Müşteri\":\"1\",\"Ödeyen Müşteri\":\"0\",\"Teslimat İlçesi\":\"1\",\"Teslimat İli\":\"1\",\"KG\":\"0.00\",\"KG Kapasite\":\"0.00\",\"Koli\":\"0.00\",\"Koli Kapasite\":\"0.00\",\"Desi\":\"0.00\",\"Desi Kapasite\":\"0.00\",\"Araç Tipi\":\"\",\"Araç Sahiplik\":\"\",\"SeferBaslatAdet\":\"1\",\"SeferBitisAdet\":\"1\",\"SeferBaslatmayanAdet\":\"0\",\"SeferDevamEden\":\"0\",\"TeslimatPerformansAdet\":\"24\",\"TeslimatPerformans\":\"1.48\",\"TeslimatPerformansBadAdet\":\"16\",\"TeslimatPerformansBad\":\"99.05\",\"DropSayisi\":\"38\",\"AltKod\":\"\",\"Yesil\":\"38\",\"Turuncu\":\"0\",\"Kirmizi\":\"0\",\"NoktaAtisi\":\"15\",\"Yakin\":\"4\",\"Uzak\":\"8\",\"HataliKullanim\":\"11\",\"GeofenceHesaplanmayan\":\"0\",\"AdresDuzeltmeAdet\":\"\",\"Farklı Gün\":\"2\",\"Farklı Araç\":\"1\",\"Duraklama\":\"5\",\"RutDisi\":\"3\",\"PlannedStartDate\":\"2025-02-27\",\"WeekDay\":\"Thursday\"},{\"Depo\":\"KOŞ (ALANYA)\",\"Araç/Plaka\":\"07 BEC 404\",\"SürücüId\":\"SERKAN BERAT\",\"Şöför Adı\":\"SERKAN BERAT\",\"Toplam Adet\":\"40\",\"RutSayi\":\"31\",\"Olumlu Adet\":\"17\",\"Kısmi Olumlu Adet\":\"0\",\"Olumsuz Adet\":\"14\",\"Uğranmamış Adet\":\"0\",\"Devam Eden Adet\":\"0\",\"Sefer Sayısı\":\"1\",\"Toplam Sefer Süresi\":\"498\",\"Planlanan KM\":\"13.53\",\"Gerçekleşen KM\":\"82.53\",\"Geofence\":\"0.640666\",\"Adres Skor\":\"1000\",\"Planlanan Yol Süresi Dk\":\"10\",\"Planlanan İşlem Süresi\":\"290\",\"Gerçekleşen Dk\":\"62\",\"Noktada Bekleme - İş Süresi\":\"8\",\"Erken/Geç Dakika\":\"\",\"POD sayısı\":\"\",\"Sipariş Tip\":\"5\",\"Planlanan Lojistik Birim\":\"1\",\"Teslim Adresi Kod\":\"0\",\"Sipariş Veren Müşteri\":\"1\",\"Ödeyen Müşteri\":\"0\",\"Teslimat İlçesi\":\"1\",\"Teslimat İli\":\"1\",\"KG\":\"0.00\",\"KG Kapasite\":\"0.00\",\"Koli\":\"0.00\",\"Koli Kapasite\":\"0.00\",\"Desi\":\"0.00\",\"Desi Kapasite\":\"0.00\",\"Araç Tipi\":\"\",\"Araç Sahiplik\":\"\",\"SeferBaslatAdet\":\"1\",\"SeferBitisAdet\":\"1\",\"SeferBaslatmayanAdet\":\"0\",\"SeferDevamEden\":\"0\",\"TeslimatPerformansAdet\":\"25\",\"TeslimatPerformans\":\"4.05\",\"TeslimatPerformansBadAdet\":\"17\",\"TeslimatPerformansBad\":\"91.80\",\"DropSayisi\":\"40\",\"AltKod\":\"\",\"Yesil\":\"40\",\"Turuncu\":\"0\",\"Kirmizi\":\"0\",\"NoktaAtisi\":\"15\",\"Yakin\":\"11\",\"Uzak\":\"6\",\"HataliKullanim\":\"8\",\"GeofenceHesaplanmayan\":\"0\",\"AdresDuzeltmeAdet\":\"\",\"Farklı Gün\":\"5\",\"Farklı Araç\":\"0\",\"Duraklama\":\"4\",\"RutDisi\":\"5\",\"PlannedStartDate\":\"2025-02-28\",\"WeekDay\":\"Friday\"},{\"Depo\":\"KOŞ (ALANYA)\",\"Araç/Plaka\":\"07 BEC 404\",\"SürücüId\":\"SERKAN BERAT\",\"Şöför Adı\":\"SERKAN BERAT\",\"Toplam Adet\":\"47\",\"RutSayi\":\"34\",\"Olumlu Adet\":\"10\",\"Kısmi Olumlu Adet\":\"0\",\"Olumsuz Adet\":\"24\",\"Uğranmamış Adet\":\"0\",\"Devam Eden Adet\":\"0\",\"Sefer Sayısı\":\"1\",\"Toplam Sefer Süresi\":\"461\",\"Planlanan KM\":\"10.49\",\"Gerçekleşen KM\":\"123.55\",\"Geofence\":\"2.088918\",\"Adres Skor\":\"1000\",\"Planlanan Yol Süresi Dk\":\"8\",\"Planlanan İşlem Süresi\":\"328\",\"Gerçekleşen Dk\":\"94\",\"Noktada Bekleme - İş Süresi\":\"6\",\"Erken/Geç Dakika\":\"\",\"POD sayısı\":\"\",\"Sipariş Tip\":\"4\",\"Planlanan Lojistik Birim\":\"1\",\"Teslim Adresi Kod\":\"0\",\"Sipariş Veren Müşteri\":\"1\",\"Ödeyen Müşteri\":\"0\",\"Teslimat İlçesi\":\"1\",\"Teslimat İli\":\"1\",\"KG\":\"0.00\",\"KG Kapasite\":\"0.00\",\"Koli\":\"0.00\",\"Koli Kapasite\":\"0.00\",\"Desi\":\"0.00\",\"Desi Kapasite\":\"0.00\",\"Araç Tipi\":\"\",\"Araç Sahiplik\":\"\",\"SeferBaslatAdet\":\"1\",\"SeferBitisAdet\":\"1\",\"SeferBaslatmayanAdet\":\"0\",\"SeferDevamEden\":\"0\",\"TeslimatPerformansAdet\":\"29\",\"TeslimatPerformans\":\"3.40\",\"TeslimatPerformansBadAdet\":\"20\",\"TeslimatPerformansBad\":\"119.23\",\"DropSayisi\":\"47\",\"AltKod\":\"\",\"Yesil\":\"47\",\"Turuncu\":\"0\",\"Kirmizi\":\"0\",\"NoktaAtisi\":\"15\",\"Yakin\":\"8\",\"Uzak\":\"0\",\"HataliKullanim\":\"24\",\"GeofenceHesaplanmayan\":\"0\",\"AdresDuzeltmeAdet\":\"\",\"Farklı Gün\":\"7\",\"Farklı Araç\":\"0\",\"Duraklama\":\"6\",\"RutDisi\":\"7\",\"PlannedStartDate\":\"2025-03-01\",\"WeekDay\":\"Saturday\"}]"

let localReportModel: [ReportModel] = []

