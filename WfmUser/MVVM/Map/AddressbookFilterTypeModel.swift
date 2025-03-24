//
//  AddressbookFilterTypeModel.swift
//  WfmAdmin
//
//  Created by Mustafa Alper Aydin on 30.01.2025.
//

import Foundation

struct FilterSequenceValue: Codable {
    let sequence: Int
    let value: String
    
    enum CodingKeys: String, CodingKey {
        case sequence = "Sequence"
        case value = "Value"
    }
}


struct AddressbookFilterTypeModel2: Codable, Identifiable {
    
    var id = UUID()
    var filterType: Int //1 -> Nokta, 2 -> Temsilci, 3 -> Depo
    var filterId: Int //filtre sırası
    var filterName: String //filtre adı
    var filterIcon: String //filtre iconu
    var filterStyle: Int //1 -> Text, 2 -> Spinner, 3 -> Date
    var filterValidation: String //
    var filterSpecial: String //filtrenin modelde hangi değişkene baktığı
    var selectedValue: String //
        
    var parsAtt: [FilterSequenceValue]?
    var selectedItems: Set<String> = []

}

var filters: [AddressbookFilterTypeModel2] = [
    AddressbookFilterTypeModel2(filterType: 1, filterId: 1, filterName: "Başlık", filterIcon: "", filterStyle: 1, filterValidation: "",  filterSpecial: "name", selectedValue: ""),
    AddressbookFilterTypeModel2(filterType: 1, filterId: 2, filterName: "İş Süresi", filterIcon: "", filterStyle: 2, filterValidation: "",  filterSpecial: "workTime", selectedValue: "", parsAtt: [FilterSequenceValue(sequence: 1, value: "8")]),
    AddressbookFilterTypeModel2(filterType: 1, filterId: 3, filterName: "TakipId", filterIcon: "", filterStyle: 1, filterValidation: "",  filterSpecial: "special1", selectedValue: ""),
    AddressbookFilterTypeModel2(filterType: 1, filterId: 4, filterName: "Değer Desi TL", filterIcon: "", filterStyle: 2, filterValidation: "", filterSpecial: "sequence", selectedValue: "", parsAtt: [FilterSequenceValue(sequence: 1, value: "8")]),
    AddressbookFilterTypeModel2(filterType: 1, filterId: 5, filterName: "SLA", filterIcon: "", filterStyle: 2, filterValidation: "", filterSpecial: "special4", selectedValue: "", parsAtt: [FilterSequenceValue(sequence: 1, value: "08:00-17:00")]),
    AddressbookFilterTypeModel2(filterType: 1, filterId: 6, filterName: "Frekans", filterIcon: "", filterStyle: 2, filterValidation: "", filterSpecial: "special3", selectedValue: "", parsAtt: [FilterSequenceValue(sequence: 1, value: "1"), FilterSequenceValue(sequence: 2, value: "2"), FilterSequenceValue(sequence: 3, value: "3"), FilterSequenceValue(sequence: 4, value: "4"), FilterSequenceValue(sequence: 5, value: "5"), FilterSequenceValue(sequence: 6, value: "6"), FilterSequenceValue(sequence: 7, value: "7")]),
    AddressbookFilterTypeModel2(filterType: 1, filterId: 7, filterName: "Kritik Gün", filterIcon: "", filterStyle: 2, filterValidation: "", filterSpecial: "special5", selectedValue: "", parsAtt: [FilterSequenceValue(sequence: 1, value: "Ptesi"), FilterSequenceValue(sequence: 2, value: "Salı"), FilterSequenceValue(sequence: 3, value: "Çarş"), FilterSequenceValue(sequence: 4, value: "Perş"), FilterSequenceValue(sequence: 5, value: "Cuma"), FilterSequenceValue(sequence: 6, value: "Ctesi"), FilterSequenceValue(sequence: 7, value: "Pzr")]),
    AddressbookFilterTypeModel2(filterType: 1, filterId: 8, filterName: "Kritik Temsilci", filterIcon: "", filterStyle: 2, filterValidation: "", filterSpecial: "special6", selectedValue: "", parsAtt: [FilterSequenceValue(sequence: 2610327, value: "CAFER YILMAZ"), FilterSequenceValue(sequence: 2610328, value: "RAMAZAN KAZAN"), FilterSequenceValue(sequence: 2610326, value: "SERKAN BERAT"), FilterSequenceValue(sequence: 2610329, value: "RUTAN ÖZKAN")]),
    AddressbookFilterTypeModel2(filterType: 1, filterId: 9, filterName: "Şef", filterIcon: "", filterStyle: 2, filterValidation: "", filterSpecial: "special7", selectedValue: "", parsAtt: [FilterSequenceValue(sequence: 1, value: "ANTALYA")]),
    AddressbookFilterTypeModel2(filterType: 1, filterId: 10, filterName: "Bayi", filterIcon: "", filterStyle: 2, filterValidation: "",  filterSpecial: "special8", selectedValue: "", parsAtt: []),
    AddressbookFilterTypeModel2(filterType: 1, filterId: 11, filterName: "Bölge", filterIcon: "", filterStyle: 2, filterValidation: "", filterSpecial: "special9", selectedValue: "", parsAtt: [FilterSequenceValue(sequence: 1, value: "KOŞ(ALANYA)")]),
    AddressbookFilterTypeModel2(filterType: 1, filterId: 12, filterName: "Kritik Depo", filterIcon: "", filterStyle: 2, filterValidation: "",  filterSpecial: "special10", selectedValue: "", parsAtt: [FilterSequenceValue(sequence: 2522998, value: "KOŞ(ALANYA)")]),
    AddressbookFilterTypeModel2(filterType: 1, filterId: 13, filterName: "Ağırlık - KG", filterIcon: "", filterStyle: 2, filterValidation: "",  filterSpecial: "", selectedValue: "", parsAtt: []),
    AddressbookFilterTypeModel2(filterType: 1, filterId: 14, filterName: "Hacim", filterIcon: "", filterStyle: 2, filterValidation: "",  filterSpecial: "", selectedValue: "", parsAtt: []),
    AddressbookFilterTypeModel2(filterType: 1, filterId: 15, filterName: "Araç Tipi", filterIcon: "", filterStyle: 2, filterValidation: "", filterSpecial: "nitelik5", selectedValue: "", parsAtt: [FilterSequenceValue(sequence: 1, value: "AKSEKİ"), FilterSequenceValue(sequence: 2, value: "AKSU"), FilterSequenceValue(sequence: 3, value: "ALANYA"), FilterSequenceValue(sequence: 4, value: "GAZİPASA"), FilterSequenceValue(sequence: 5, value: "GÜNDOGMUS"), FilterSequenceValue(sequence: 6, value: "MANAVGAT")]),
    AddressbookFilterTypeModel2(filterType: 1, filterId: 16, filterName: "Barkod", filterIcon: "", filterStyle: 1, filterValidation: "",  filterSpecial: "nitelik8", selectedValue: ""),
    AddressbookFilterTypeModel2(filterType: 1, filterId: 17, filterName: "Km Avantaj", filterIcon: "", filterStyle: 1, filterValidation: "",  filterSpecial: "kmAvantaj", selectedValue: ""),
    AddressbookFilterTypeModel2(filterType: 1, filterId: 18, filterName: "AdresId", filterIcon: "", filterStyle: 1, filterValidation: "",  filterSpecial: "adresId", selectedValue: ""),
    AddressbookFilterTypeModel2(filterType: 1, filterId: 19, filterName: "Sipariş Tarihi", filterIcon: "", filterStyle: 1, filterValidation: "",  filterSpecial: "slaDate", selectedValue: ""),
    AddressbookFilterTypeModel2(filterType: 1, filterId: 20, filterName: "Telefon No", filterIcon: "", filterStyle: 1, filterValidation: "",  filterSpecial: "telNo", selectedValue: ""),
    AddressbookFilterTypeModel2(filterType: 1, filterId: 21, filterName: "Sipariş Notu", filterIcon: "", filterStyle: 1, filterValidation: "",  filterSpecial: "orderNote", selectedValue: ""),
    AddressbookFilterTypeModel2(filterType: 1, filterId: 22, filterName: "Ödeme Şekli", filterIcon: "", filterStyle: 2, filterValidation: "",  filterSpecial: "paymentType", selectedValue: "", parsAtt: []),
    AddressbookFilterTypeModel2(filterType: 1, filterId: 23, filterName: "Müşteri Tipi", filterIcon: "", filterStyle: 2, filterValidation: "", filterSpecial: "customerType", selectedValue: "", parsAtt: [FilterSequenceValue(sequence: 1, value: "Askeriye"), FilterSequenceValue(sequence: 2, value: "Bakkal(<50m2)"), FilterSequenceValue(sequence: 3, value: "Benzin Istasyonu"), FilterSequenceValue(sequence: 4, value: "Bim"), FilterSequenceValue(sequence: 5, value: "Büfe"), FilterSequenceValue(sequence: 6, value: "Cafe/Restaurant"), FilterSequenceValue(sequence: 7, value: "Düğün Salonu"), FilterSequenceValue(sequence: 8, value: "Kırtasiye"), FilterSequenceValue(sequence: 9, value: "Orta Market(50-100m2)"), FilterSequenceValue(sequence: 10, value: "ÖSM"), FilterSequenceValue(sequence: 11, value: "Sok"), FilterSequenceValue(sequence: 12, value: "Turizm"), FilterSequenceValue(sequence: 13, value: "Sok"), FilterSequenceValue(sequence: 12, value: "Ulusal Zincir")]),
    AddressbookFilterTypeModel2(filterType: 1, filterId: 24, filterName: "Sipariş Tipi", filterIcon: "", filterStyle: 2, filterValidation: "", filterSpecial: "orderType", selectedValue: "", parsAtt: [FilterSequenceValue(sequence: 1, value: "Bim"), FilterSequenceValue(sequence: 2, value: "Ev Dışı Tüketim"), FilterSequenceValue(sequence: 3, value: "Geleneksel"), FilterSequenceValue(sequence: 4, value: "Ösm"), FilterSequenceValue(sequence: 5, value: "Şok"), FilterSequenceValue(sequence: 6, value: "Ulusal Zincir")]),
    AddressbookFilterTypeModel2(filterType: 1, filterId: 25, filterName: "Excel Seçimi", filterIcon: "", filterStyle: 2, filterValidation: "", filterSpecial: "adresDataId", selectedValue: ""),
    AddressbookFilterTypeModel2(filterType: 1, filterId: 26, filterName: "Kritik Nokta", filterIcon: "", filterStyle: 1, filterValidation: "",  filterSpecial: "taskType", selectedValue: "")
]

func convertToJSONFormat(_ raw: String) -> String {
    
    let jsonString = raw
        .replacingOccurrences(of: " ", with: "")
        .replacingOccurrences(of: "{", with: "{\"")
        .replacingOccurrences(of: ":", with: "\": \"")
        .replacingOccurrences(of: ",", with: "\", \"")
        .replacingOccurrences(of: "}", with: "\"}")
    
    let jsonString1 = jsonString.replacingOccurrences(of: "}\",", with: "},")
    
    let jsonString2 = jsonString1.replacingOccurrences(of: "\"{", with: "{")

    return jsonString2
}



