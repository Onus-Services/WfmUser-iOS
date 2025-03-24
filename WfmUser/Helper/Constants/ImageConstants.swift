//
//  ImageConstants.swift
//  WfmAdmin
//
//  Created by Mustafa Alper Aydin on 27.01.2025.
//

import Foundation

enum ImageConstants: String {
    ///Splash
    case splashGoodNight = "iyi_aksamlar"
    case splashGoodDay = "iyi_gunler"
    case splashGoodMorning = "morning"
    ///offlineCard
    case offlineCardWarning = "uyari_icon"
    case offlineCardClicked = "tiklanabilir_icon"
    ///backgorund
    case loginBackground = "login_background"
    ///logo
    case avansas = "avansas_logo"
    case rotamen = "rotamen_logo"
    ///Header
    case headerMenu = "menu"
    
    case calendar = "calendar"
    case closeFilter = "closeFilter"
    case closeFilterLine = "closeFilterLine"
    case openFilter = "openFilter"
    case store = "store"
    case user = "user"
    
    case reportCompare = "reportCompare"
    case reportFav = "reportFav"
    case reportFullScreen = "reportFullScreen"
    case raporUnfavIcon = "rapor_unfav_icon"
    case raporFavIcon = "rapor_fav_icon"
    case simplification = "Simplification"
    case raporKarsilastirma = "rapor_karsilastirma_icon"
    case raporBuyutIcon = "rapor_buyut_icon"
    
    
    case iconDeadline = "iconDeadline"
    case iconGreen = "iconGreen"
    case iconRed = "iconRed"
    case iconRuler = "iconRuler"
    case iconWidth = "iconWidth"
    case iconZone = "iconZone"
    case iconChevronUp = "iconChevronUp"
    case iconChevronDown = "iconChevronDown"
    case iconCamera = "iconCamera"
    case iconCount = "iconCount"
    case iconRoad = "iconRoad"
    case iconRoute = "iconRoute"
    case iconRouteOpen = "iconRouteOpen"
    
    case mapVehicleMarker = "mapVehicleMarker"
    case mapOlumsuzMarker = "mapOlumsuzMarker"
    case mapOlumluMarker = "mapOlumluMarker"
    case mapPlanlananMarker = "mapPlanlananMarker"
    case seciliIsMarkerFinish = "secili_is_marker_finish"
    case seciliIsMarker = "secili_is_marker"
    
    case gIconBeklemeSuresi = "gIcon_bekleme_suresi"
    case gIconDevamEdenSiparis = "gIcon_devam_eden_siparis"
    case gIconGerceklesenKm = "gIcon_gerceklesen_km"
    case gIconGerceklesenSiparisSaati = "gIcon_gerceklesen_siparis_saati"
    case gIconOlumluSiparis = "gIcon_olumlu_siparis"
    case gIconOlumsuzSiparis = "gIcon_olumsuz_siparis"
    case gIconOrtalamaGeofence = "gIcon_ortalama_geofence"
    case gIconOrtalamaSeferSuresi = "gIcon_ortalama_sefer_suresi"
    case gIconPlanlananKm = "gIcon_planlanan_km"
    case gIconPlanlananSiparisSaati = "gIcon_planlanan_siparis_saati"
    case gIconPod = "gIcon_pod"
    case gIconSeferBaslangic = "gIcon_sefer_baslangic"
    case gIconSeferBitis = "gIcon_sefer_bitis"
    case gIconSeferDevam = "gIcon_sefer_devam"
    case gIconSeferTamamlanan = "gIcon_sefer_tamamlanan"
    
    case oDIconClock = "oDIconClock"
    case oDIconDriver = "oDIconDriver"
    case oDIconMapPin = "oDIconMapPin"
    case oDIconTruck = "oDIconTruck"
    case oDIconUser = "oDIconUser"
    case oDIconGecmis = "oDIconGecmis"
    case oDIconInfo = "oDIconInfo"
    case oDIconIsListe = "oDIconIsListe"
    case oDIconSearch = "oDIconSearch"
    case oDIconXSquare = "oDIconXSquare"
    
    case smFiltre = "sm_filtre"
    case smSearch = "sm_search"
    case smAdd = "sm_add"
    case smSend = "sm_send"
    
    
    case headerMenuNew = "headerMenu"
    case leftListAlertMessage = "leftListAlertMessage"
    case leftListEng = "leftListEng"
    case leftListFooterLogo = "leftListFooterLogo"
    case leftListHome = "leftListHome"
    case leftListList = "leftListList"
    case leftListLogout = "leftListLogout"
    case leftListMap = "leftListMap"
    case leftListOrderDetail = "leftListOrderDetail"
    case leftListProfile = "leftListProfile"
    case leftListProfileBg = "leftListProfileBg"
    case leftListTr = "leftListTr"
    case leftListBell = "leftListBell"
    case leftListInfo = "leftListInfo"
    
    case leftListSSS = "leftListSSS"
    case leftListKvkk = "leftListKvkk"
    case leftListGizlilik = "leftListGizlilik"
    case leftListIzinler = "leftListIzinler"
    case leftListDepo = "leftListDepo"
    
    case rxAdminLogo = "rx_admin_logo"
    case rxAdminLogo1 = "rx_admin_logo1"
    
    case otoRefreshMic = "oto_refresh_mic"
    case otoRefreshRefresh = "oto_refresh_refresh"
    case otoRefreshVector = "oto_refresh_vector"
    
    case gunSecimIcon = "gun_secim_icon"
    case seferDevam = "sefer_devam"
    case toplamKullaniciIcon = "toplam_kullanici_icon"
    
    case mapDevamEden = "devam_eden_siparis_map"
    case mapGerceklesenKm = "gerceklesen_km_map"
    case mapOlumlu = "olumlu_siparis_map"
    case mapOlumsuz = "olumsuz_siparis_map"
    case mapOrtGeo = "ortalama_geofence_map"
    case mapPlanlananKm = "planlanan_km_map"
    case mapBaslangic = "sefer_baslangic_map"
    case mapBitis = "sefer_bitis_map"
    case mapSurucu = "surucu_map"
    case adresDegistirBtn = "adres_degistir_btn"
    case adresDegistiriliyor = "adres_degistiriliyor"
    case learnAddressIcon = "surukle_birak_marker"
    
    case info = "info"
    
    case notfTestIcon = "notf_test_icon"
    
    
    case wToptoplananKm = "wToptoplananKm"
    case wToptoplamSiparis = "wToptoplamSiparis"
    case wToptoplamBolge = "wToptoplamBolge"
    case wToptoplamArac = "wToptoplamArac"
    case wTophesaplananKm = "wTophesaplananKm"
    case wTesolumsuz = "wTesolumsuz"
    case wTesolumlu = "wTesolumlu"
    case wTesdevamEden = "wTesdevamEden"
    case wSefseferbitirmeyen = "wSefseferbitirmeyen"
    case wSefseferbitiren = "wSefseferbitiren"
    case wSefseferbaslatmayan = "wSefseferbaslatmayan"
    case wSefseferbaslatan = "wSefseferbaslatan"
    case wOrtortverimlilik = "wOrtortverimlilik"
    case wOrtortteslimatsure = "wOrtortteslimatsure"
    case wOrtortseferbitirme = "wOrtortseferbitirme"
    case wOrtortgeofence = "wOrtortgeofence"
    case wGun = "wGun"
    case wRutIci = "wRutIci"
    case wRutDisi = "wRutDisi"
    case wDuraklama = "wDuraklama"
    case wSapma = "wSapma"
    case wRut = "wRut"
    
    case oAracayuklendi = "o_aracayuklendi"
    case oCikissubesinde = "o_cikissubesinde"
    case oKismiteslimat = "o_kismiteslimat"
    case oNoktada = "o_noktada"
    case oNoktadacevapbekliyor = "o_noktadacevapbekliyor"
    case oPlanlandi = "o_planlandi"
    case oTeslimedildi = "o_teslimedildi"
    case oTeslimedilemedi = "o_teslimedilemedi"
    case oYolda = "o_yolda"
    
    
    case podDesc = "podDesc"
    case podIslemDate = "podIslemDate"
    case podIsleType = "podIsleType"
    case podNakliyeTarihi = "podNakliyeTarihi"
    case podNo = "podNo"
    case podOrderNo = "podOrderNo"
    case podPerson = "podPerson"
    case podType = "podType"
    
    case xSquare = "x-square"
    case cameraC = "cameraC"
    
    case SMtrashBox = "trash_box"
    case SMnotifBell = "notif_bell"
    case SMemptyBox = "empty_box"
    
    case addressBookPointMarker = "home"
    case addressBookTemsilciMarker = "ic_truck"
    case addressBookDepoMarker = "industry"
    
    case infoEmail = "email"
    case infoRotamen = "rotamen_logo_black"
    case infoAdressIcon = "adress_icon"
    
    case bottomBarDashboard = "bottomBarDashboard"
    case bottomBarAdresDefteri = "bottomBarAdresDefteri"
    case bottomBarRotaPlan = "bottomBarRotaPlan"
    
    
    case gidiyorumIcon = "gidiyorum_icon"
}
