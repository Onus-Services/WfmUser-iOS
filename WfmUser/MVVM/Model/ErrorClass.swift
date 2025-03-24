//
//  ErrorClass.swift
//  WfmAdmin
//
//  Created by Mustafa Alper Aydin on 27.01.2025.
//

import Foundation

struct ErrorClass: Codable{
    var ErrorCode: Int?
    var ErrorMessageStr: String?
    
    init(){
        ErrorCode = -1
        ErrorMessageStr = ""
    }
}

struct WarningMessageModel: Codable{
    var code: String?
    var message: String?
    var type: Int?
    var source: String?
    var title: String?
    
    init(){
        code = ""
        message = ""
        type = -1
        source = ErrorSource.MOBILE
        title = ""
    }
    
    init(code: String?, message: String?, type: Int?, source: String?, title: String?) {
        self.code = code
        self.message = message
        self.type = type
        self.source = source
        self.title = title
    }
}

struct ErrorSource {
    static let MOBILE: String = "0"
    static let API: String = "1"
}

struct ErrorTypes {
    static let FAILED: Int = 0
    static let SUCCESS: Int = 1
    static let WARNING: Int = 2
}

struct ErrorCodes {
    static let SESSION_KILL: String = "-10101"
    static let SP_GIDEMEMIS: String = "-6"
    static let SERVISTE_HATA_ALMIS: String = "-7"
}

struct ErrorList {
    static let EmailGiriniz: String = "E001"
    static let GecersizEmail: String = "E002"
    static let SifreGiriniz: String = "E003"
    static let SifreEnaz6HaneliOlmalidir: String = "E004"
    static let hatahatahata: String = "E005"
}
