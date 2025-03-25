//
//  HomePageViewModel.swift
//  WfmAdmin
//
//  Created by Mustafa Alper Aydin on 28.01.2025.
//

import Foundation
import heresdk
import SwiftUI

class HomePageViewModel: ObservableObject {
    
    @Published var showAlert = false
    @Published var error = ""
    @Published var errorType = 0
    @Published var errorCode = 0
    
    @Published var isLoading = false
    @Published var isButtonLoading = false
    
    @Published var isWeeklyView: Bool = true
    @Published var pointsArray: [PointModel] = []
    @Published var personelRoutePointArray: [PointModel] = []
    @Published var personelRoutePointArrayFrekansFilter: [PointModel] = []
    @Published var editPersonelRoutePointArrayFrekansFilter: [PointModel] = []
    @Published var personelDayRoutePointArray: [PointModel] = []
    @Published var dayPointCount: [Int] = []
    @Published var frekansDialogIsReady: Bool = false
    @Published var selectedPoint: PointModel?
    @Published var isPointDialog: Bool = false
    @Published var isDayMapExcDialog: Bool = false
    @Published var dialogExcPoint: PointModel?
    @Published var clickedPoint: PointModel?
    
    @Published var mapView: MapView = MapView.init(frame: .zero)
    @Published var dayRoutePointMarker: [MapMarker] = []
    @Published var weekRoutePointMarker: [MapMarker] = []
    @Published var navigateSelectedPointMarker: MapMarker?
    @Published var coordinates: [GeoCoordinates] = [] //boundingbox için noktalar
    
    @Published var isLocErrInfo: Bool = false
    @Published var selectedPoints: [PointModel] = []
    
    @Published var isToastMessage: Bool = false //toast message kontorlü
    @Published var isToastMessageText: String = "" //toast message text
    @Published var isToastMessageBgColor: Color = .MyColor.failedWarningColor //toast message text
    
    @Published var editAddress: Bool = false
    @Published var pinOnMap: Bool = false
    @Published var addressOnCenterMap: String = "..." //adres öğrenme
    @Published var place: Place? //adres öğrenme
    @Published var isAddNewAddressDialog: Bool = false
    
    @Published var newAddressFilter: [AddressbookFilterTypeModel2] = filters
    @Published var isPickerViewOpen: Bool = true
    @Published var selectedFilterIndex: Int = -1
    
    @Published var isFullScreenChart: Bool = false
    @Published var fullScreenChartReportType: ReportType = .barTeslimat
    @Published var fullScreenChartDetail: ChartDetailModel = ChartDetailModel()
    
    @Published var reportDetailArray: [ReportModel] = []
    @Published var widgetArrayOnlyData: [WidgetModelOnlyData] = []
    @Published var widgets: [WidgetModelArray] = [WidgetModelArray(title: String(localized: "WDTeslimat"), color: .NewColor.widgetTeslimat, widget: []), WidgetModelArray(title: String(localized: "WDSefer"), color: .NewColor.widgetSefer, widget: []), WidgetModelArray(title: String(localized: "WDOrtalama"), color: .NewColor.widgetOrtalama, widget: []), WidgetModelArray(title: String(localized: "WDToplam"), color: .NewColor.widgetToplam, widget: []), WidgetModelArray(title: String(localized: "WDRut"), color: .NewColor.widgetRut, widget: [])]
    @Published var isReportOneDay: Bool = false
    
    //ekranda gösterilecek raporlar dizisi
    @Published var addedReport: [ReportType] = []
    //localde kaydedilen raporlar dizisi
    @Published var localReport: [ReportType] = []
    
    @Published var routeSetting: [RouteSettingModel] = []
    
    @Published var globalSelectedDateType: SelectedDateType = .today
    @Published var gloablSelectedFirstDate: Date = Date()
    @Published var globalSelectedSecondDate: Date = Date()
    @Published var customDate1: Date = Date()
    @Published var customDate2: Date = Date()
    
    
    @Published var homePagePageType: Int = 0
    
    private let networkManager: NetworkManager
    init(networkManager: NetworkManager = NetworkManager()) {
        print("init-HomePageViewModel")
        self.networkManager = networkManager
        //noktaTemsilciDepo()
        loadUsers()
        getReportAll(resultHandler: { r in
            //
        })
        getRouteSetting()
    }
    
    func errorDialogCallFunc<T>(response: ApiResponseFunc.ResponseResult<T>) {
        self.error = response.errorText
        self.errorCode = response.errorCode
        self.errorType = response.errorType
        if errorCode != -10 {
            self.showAlert = true
        }
    }
    
    // MARK: Execution
    func executionV1MultiBody(allCloseOrder: Bool = false, topluMxRoute: String = "",executionType: CLong, executionStr: String = "", point: PointModel? = nil, mxRoutePointIds: String = "", coklu: Bool = false, resultHandler:@escaping (Bool) -> ()) {
        print("executionStrexecutionStrexecutionStr - \(executionStr)")
        self.isLoading = true
        var pointError: Bool = false
        if [LecyStatus.gitmedim, LecyStatus.gidiyorum, LecyStatus.teslimatFormuDolduruluyor, LecyStatus.noNameStatus4].contains(executionType) {
            self.isLoading = false
            self.isButtonLoading = true
        } else {
            self.isLoading = true
        }
        
        if true {
            /*if executionType == LecyStatus.olumsuzTeslimat {
                SQLiteCommands.updatePointStatus(pointId: (point?.mxRoutePointsId)!, pointStatusId: LecyStatus.olumsuzTeslimat)
                //self?.updateExecutionPoint(statusId: LecyStatus.olumsuzTeslimat)
            } else if executionType == LecyStatus.olumluTeslimat {
                SQLiteCommands.updatePointStatus(pointId: (point?.mxRoutePointsId)!, pointStatusId: LecyStatus.olumluTeslimat)
                //self?.updateExecutionPoint(statusId: LecyStatus.olumluTeslimat)
            } else if executionType == LecyStatus.kismiOlumluTeslimat {
                SQLiteCommands.updatePointStatus(pointId: (point?.mxRoutePointsId)!, pointStatusId: LecyStatus.sorunluOlumluTeslimat)
                //self?.updateExecutionPoint(statusId: LecyStatus.sorunluOlumluTeslimat)
            } else if executionType == LecyStatus.gitmedim {
                SQLiteCommands.updatePointStatus(pointId: (point?.mxRoutePointsId)!, pointStatusId: LecyStatus.gitmedim)
                //self?.updateExecutionPoint(statusId: LecyStatus.gitmedim)
            } else {
                SQLiteCommands.updatePointStatus(pointId: (point?.mxRoutePointsId)!, pointStatusId: executionType)
                //self?.updateExecutionPoint(statusId: executionType)
            } */
            
            self.updateExecutionPoint(point: point!, statusId: executionType)
            self.isLoading = false
            self.isButtonLoading = false
            
            resultHandler(true)
        } else {
            let mobileId: String = preferences.string(forKey: "token") ?? ""
            
            if !pointError {
                var mxRouteId: String = ""
                if point != nil {
                    mxRouteId = "\(point!.mxRoutePointsId)"
                } else if mxRoutePointIds != "" {
                    mxRouteId = mxRoutePointIds
                } else {
                    mxRouteId = ""
                }
                if /*!self.isNetworkErrorMain*/ true {
                    print("QWUEUWQEUQWUEqweqwe")
                    var task = {
                        print("executionStrexecutionStrexecutionStr11 - \(executionStr)")
                        self.networkManager.executionV1MultiBody(executionId: -1, mxRouteId: -1/*self.user.MxRouteId!*/, mxBlockId: -1/*self.user.MxBlockId!*/, executionType: executionType == LecyStatus.kismiOlumluTeslimat ? LecyStatus.olumluTeslimat : executionType, executionStr: executionStr, latitude: Float(lastLocation?.coordinate.latitude ?? -1.0), longitude: Float(lastLocation?.coordinate.longitude ?? -1.0), /*mxRoutePointIds: point == nil ? "" : "\(point!.MxRoutePointsId!)"*/mxRoutePointIds: allCloseOrder ? topluMxRoute : mxRouteId, accuracy: Float(lastLocation?.speedAccuracy ?? -1.0), speed: Float(lastLocation?.speed ?? -1.0), height: Float(lastLocation?.verticalAccuracy ?? -1.0), mobileId: mobileId, completion: { [weak self] result in
                            guard self != nil else { return }
                            let result1: ApiResponseFunc.ResponseResult<Int> = ApiResponseFunc().jsonStringToModel(api: "executionV1MultiBody", result: result)
                            if result1.isError {
                                print("result1111 - \(result1)")
                                self?.errorDialogCallFunc(response: result1)
                                self?.isButtonLoading = false
                                resultHandler(false)
                            } else {
                                if point == nil {
                                    
                                    /*self?.blockStatusId = result1.data.first!
                                    SQLiteCommands.updateBlockStatus(blockStatus: self?.blockStatusId ?? -1)
                                    print("uqwyeuqyweu result - \(result) ---- \(self?.blockStatusId)")
                                    if executionType == LecyStatus.noNameStatus3 || executionType == LecyStatus.noNameStatus4 {
                                        preferences.set(false, forKey: "send_rating")
                                        /*self?.endDayCharts = true
                                        preferences.set(true, forKey: "end_day_charts")*/
                                        self?.endDay = true
                                        preferences.set(true, forKey: "end_day_charts")
                                        preferences.set("\(self?.pointArray111.count ?? 0 - 2)#\(self?.pointArray111.count ?? 0 - 2)#\(self?.pointArray111.filter{ !$0.isCenterPoint() && $0.ExecutionType == ExecutionTypes.olumlu }.count ?? 0)#\(self?.pointArray111.filter{ $0.ExecutionType == ExecutionTypes.olumsuz }.count ?? 0)#\((self?.rxTotal.PlannedDistance ?? -1000.0) / 1000.0)#\((preferences.double(forKey: "totalDistance")))", forKey: "endDayStats")
                                        SQLiteCommands.updateUserMxBlockRouteId(mxBlockId: -1, mxRouteId: -1)
                                        SQLiteCommands.deletePointTable()
                                        self?.user = SQLiteCommands.getUser(type: 9) ?? LoginUser()
                                        self?.blockStatusId = self?.user.MxBlockId ?? -1
                                        SQLiteCommands.updateBlockStatus(blockStatus: self?.blockStatusId ?? -1)
                                    } else if executionType == LecyStatus.olumsuzTeslimat {
                                        self?.blockStatusId = LucyStatus.noNameStatus5
                                        SQLiteCommands.updateBlockStatus(blockStatus: self?.blockStatusId ?? -1)
                                        self?.getPlannedList{ result in }
                                    } else if executionType == LucyStatus.noNameStatus1 {
                                        self?.pointArray111 = SQLiteCommands.getPointModelArray() ?? []
                                        self?.pointArray = (self?.pointArray111.filter { $0.ExecutionType == ExecutionTypes.islemYok })!
                                    } */
                                    
                                } else {
                                    if executionType == LecyStatus.olumsuzTeslimat {
                                        SQLiteCommands.updatePointStatus(pointId: (point?.mxRoutePointsId)!, pointStatusId: LecyStatus.olumsuzTeslimat)
                                        //self?.updateExecutionPoint(statusId: LecyStatus.olumsuzTeslimat)
                                    } else if executionType == LecyStatus.olumluTeslimat {
                                        SQLiteCommands.updatePointStatus(pointId: (point?.mxRoutePointsId)!, pointStatusId: LecyStatus.olumluTeslimat)
                                        //self?.updateExecutionPoint(statusId: LecyStatus.olumluTeslimat)
                                    } else if executionType == LecyStatus.kismiOlumluTeslimat {
                                        SQLiteCommands.updatePointStatus(pointId: (point?.mxRoutePointsId)!, pointStatusId: LecyStatus.sorunluOlumluTeslimat)
                                        //self?.updateExecutionPoint(statusId: LecyStatus.sorunluOlumluTeslimat)
                                    } else if executionType == LecyStatus.gitmedim {
                                        SQLiteCommands.updatePointStatus(pointId: (point?.mxRoutePointsId)!, pointStatusId: LecyStatus.gitmedim)
                                        //self?.updateExecutionPoint(statusId: LecyStatus.gitmedim)
                                    } else {
                                        SQLiteCommands.updatePointStatus(pointId: (point?.mxRoutePointsId)!, pointStatusId: executionType)
                                        //self?.updateExecutionPoint(statusId: executionType)
                                    }
                                }
                                if !coklu {
                                    self?.isButtonLoading = false
                                }
                                resultHandler(true)
                            }
                            self?.isLoading = false
                        })
                    }
                    
                    if !preferences.bool(forKey: "isApiBusy_shared") {
                        print("‼️‼️‼️ApiBusy")
                        task()
                    } else {
                        self.isLoading = true
                        pendingTasks.append(task)
                    }
                } /*else {
                    if point == nil {
                        self.blockStatusId = executionType
                        SQLiteCommands.updateBlockStatus(blockStatus: self.blockStatusId)
                        if executionType == LecyStatus.noNameStatus3 || executionType == LecyStatus.noNameStatus4 {
                            preferences.set(false, forKey: "send_rating")
                            self.endDay = true
                            preferences.set(true, forKey: "end_day_charts")
                            preferences.set("\(self.pointArray111.count - 2)#\(self.pointArray111.count - 2)#\(self.pointArray111.filter{ !$0.isCenterPoint() && $0.ExecutionType == ExecutionTypes.olumlu }.count)#\(self.pointArray111.filter{ $0.ExecutionType == ExecutionTypes.olumsuz }.count)#\((self.rxTotal.PlannedDistance ?? -1000.0) / 1000.0)#\((preferences.double(forKey: "totalDistance")))", forKey: "endDayStats")
                            print("end_day_charts = \(preferences.bool(forKey: "end_day_charts"))")
                            SQLiteCommands.updateUserMxBlockRouteId(mxBlockId: -1, mxRouteId: -1)
                            SQLiteCommands.deletePointTable()
                            self.user = SQLiteCommands.getUser(type: 9) ?? LoginUser()
                            self.blockStatusId = self.user.MxBlockId ?? -1
                            SQLiteCommands.updateBlockStatus(blockStatus: self.blockStatusId)
                        } else if executionType == LecyStatus.olumsuzTeslimat {
                            self.blockStatusId = LucyStatus.noNameStatus5
                            SQLiteCommands.updateBlockStatus(blockStatus: self.blockStatusId)
                            self.getPlannedList{ result in }
                        }
                    } else {
                        if executionType == LecyStatus.olumsuzTeslimat {
                            SQLiteCommands.updatePointStatus(pointId: (point?.MxRoutePointsId!)!, pointStatusId: LecyStatus.olumsuzTeslimat)
                            self.updateExecutionPoint(statusId: LecyStatus.olumsuzTeslimat)
                        } else if executionType == LecyStatus.olumluTeslimat {
                            SQLiteCommands.updatePointStatus(pointId: (point?.MxRoutePointsId!)!, pointStatusId: LecyStatus.olumluTeslimat)
                            self.updateExecutionPoint(statusId: LecyStatus.olumluTeslimat)
                        } else if executionType == LecyStatus.kismiOlumluTeslimat {
                            SQLiteCommands.updatePointStatus(pointId: (point?.MxRoutePointsId!)!, pointStatusId: LecyStatus.sorunluOlumluTeslimat)
                            self.updateExecutionPoint(statusId: LecyStatus.sorunluOlumluTeslimat)
                        } else if executionType == LecyStatus.gitmedim {
                            SQLiteCommands.updatePointStatus(pointId: (point?.MxRoutePointsId!)!, pointStatusId: LecyStatus.gitmedim)
                            self.updateExecutionPoint(statusId: LecyStatus.gitmedim)
                        } else {
                            SQLiteCommands.updatePointStatus(pointId: (point?.MxRoutePointsId!)!, pointStatusId: executionType)
                            self.updateExecutionPoint(statusId: executionType)
                        }
                        self.pointArray111 = SQLiteCommands.getPointModelArray() ?? []
                        self.pointArray = (self.pointArray111.filter { $0.ExecutionType == ExecutionTypes.islemYok })
                    }
                    
                    _ = SQLiteCommands.insertOfflineData(OfflineModel(OffUUID: "MOBILE_SET_MXROUTE_EXECUTION_V1_MULTI\(executionType)|\(mxRouteId)",  OffAPI: "MOBILE_SET_MXROUTE_EXECUTION_V1_MULTI", OffExecutionBody: "\(-1),\(user.MxRouteId!),\(user.MxBlockId!),\(executionType),\(executionStr),\(Float(lastLocation?.coordinate.latitude ?? -1.0)),\(Float(lastLocation?.coordinate.longitude ?? -1.0)),\(mxRouteId),\(Float(lastLocation?.speedAccuracy ?? -1.0)),\(Float(lastLocation?.verticalAccuracy ?? -1.0))", OffMxRoutePointId: -1, OffMxBlockId: -1, OffRequestDateTime: "", OffIsSend: false))
                    self.isButtonLoading = false
                    resultHandler(true)
                    self.isLoading = false
                } */
                
            }
        }
    }
    
    
    func loadUsers() {
        guard let fileURL = Bundle.main.url(forResource: "wfmUser", withExtension: "txt") else {
            print("❌ Dosya bulunamadı!")
            return
        }

        do {
            let rawData = try Data(contentsOf: fileURL)
                
            // 1. JSON'u String olarak oku
            guard let jsonString = String(data: rawData, encoding: .utf8) else {
                print("❌ Dosya içeriği stringe çevrilemedi!")
                return
            }
                
            print("✅ JSON STRING OKUNDU: \(jsonString.prefix(200))...")  // İlk 200 karakteri göster (kontrol amaçlı)
                
            // 2. İlk JSON decode işlemi: String formatında saklanan JSON'u tekrar JSON'a çevir
            guard let jsonData = jsonString.data(using: .utf8) else {
                print("❌ JSON string, Data'ya çevrilemedi!")
                return
            }
                
            let jsonStringDecoded: String
            do {
                jsonStringDecoded = try JSONDecoder().decode(String.self, from: jsonData)
                print("✅ JSON STRING DECODE EDİLDİ")
            } catch {
                print("❌ İlk JSON decode hatası: \(error.localizedDescription)")
                return
            }
                
            // 3. İkinci JSON decode işlemi: Asıl JSON veri modeline çevir
            guard let finalJsonData = jsonStringDecoded.data(using: .utf8) else {
                print("❌ Final JSON data oluşturulamadı!")
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode([PointModel].self, from: finalJsonData)
                DispatchQueue.main.async {
                    self.pointsArray = decodedData
                    self.personelRoutePointArray = self.pointsArray.filter { $0.arac == "07 BDU 311" }
                    self.personelRoutePointArrayFrekansFilter = self.personelRoutePointArray
                    self.frekansDialogIsReady = true
                    self.insertAndGetDayPointArray(type: 0)
                }
                print("✅ JSON BAŞARIYLA DECODE EDİLDİ!")
            } catch let DecodingError.dataCorrupted(context) {
                print("❌ Data Corrupted: \(context)")
            } catch let DecodingError.keyNotFound(key, context) {
                print("❌ Eksik Anahtar: \(key.stringValue) – Context: \(context.debugDescription)")
            } catch let DecodingError.typeMismatch(type, context) {
                print("❌ Tür Uyumsuzluğu: \(type) – Context: \(context.debugDescription)")
            } catch let DecodingError.valueNotFound(value, context) {
                print("❌ Değer Eksik: \(value) – Context: \(context.debugDescription)")
            } catch {
                print("❌ Genel JSON Decode Hatası: \(error.localizedDescription)")
            }
        } catch {
            print("❌ Dosya okuma hatası: \(error.localizedDescription)")
        }
    }
    
    func insertAndGetDayPointArray(type: Int = 1) {
        if type == 1 {
            
        } else {
            var dayArray = self.personelRoutePointArray.filter { $0.haftaninGunu == "\(currentWeekdayNumber())" }
            SQLiteCommands.insertPointArray(dayArray)
        }
        self.personelDayRoutePointArray = SQLiteCommands.getPointModelArray() ?? []
    }
    
    func updateExecutionPoint(point: PointModel, statusId: Int) {
        
        /*if statusId == LecyStatus.yolda || statusId == LecyStatus.gitmedim {
            selectedPoint?.ExecutionType = 0
        } */
        
        //selectedPoint?.executionStatusId = statusId
        
        if let index = self.personelDayRoutePointArray.firstIndex(where: { $0.mxRoutePointsId == point.mxRoutePointsId }) {
            self.personelDayRoutePointArray[index].executionStatusId = statusId
        }
        
        SQLiteCommands.updatePointStatus(pointId: (point.mxRoutePointsId), pointStatusId: statusId)
        self.isLoading = true
        self.personelDayRoutePointArray = []
        withAnimation {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                self.personelDayRoutePointArray = SQLiteCommands.getPointModelArray() ?? []
                self.selectedPoint?.executionStatusId = statusId
                self.showAlert = false
                self.isLoading = false
            }
        }
    }
    
    func showToast(message: String, type: Int = 0) {
        // Önceki toast mesajını iptal et
        isToastMessage = false
                
        // Yeni toast mesajını göster
        self.isToastMessageText = message
        if type == 0 {
            isToastMessageBgColor = .MyColor.failedWarningColor
        } else {
            isToastMessageBgColor = .MyColor.successWarningColor
        }
        isToastMessage = true
                
        // 2 saniye sonra toast mesajını gizle
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation {
                self.isToastMessage = false
            }
        }
    }
    
    func isExcLocationError(_ status: Int) -> Bool {
        if self.isLocErrInfo {
            self.error = "İşlem yapabilmek için konum izinlerini açmanız gerekmektedir."
            self.errorCode = -10
            self.errorType = ErrorTypes.WARNING
            self.showAlert = true
            /*self.executionV1MultiBody(executionType: 101, executionStr: "\(status)#\(PointExecutionDetailsViewModel().durum(status: status))") { result in
                //
            } */
            //return true
            return false
        } else {
            return false
        }
    }
    
    // MARK: sürükleme başlaması
    func onPanStart() {
        self.addressOnCenterMap = "..."
        self.place = nil
    }
    
    // MARK: sürükleme bırakma
    func onPanEnd(coor: GeoCoordinates) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            MapHelpherClass().reverseGeocode(coordinates: coor, resultHandler: {place in
                if place != nil{
                    self.addressOnCenterMap = place!.address.addressText
                    self.place = place
                }
                
            })
        }
    }
    
    func getDayRoutePointMarker() {
        clearAllMarker()
        for nokta in self.personelDayRoutePointArray {
            MapHelpherClass().createMarkerAddressBook(point: nokta) { markers in
                if markers.first != nil {
                    self.dayRoutePointMarker.append(markers.first!)
                    self.coordinates.append(GeoCoordinates(latitude: Double(nokta.enlem) ?? -1.0, longitude: Double(nokta.boylam) ?? -1.0))
                }
            }
        }
        
        if self.dayRoutePointMarker != [] {
            self.mapView.mapScene.addMapMarkers(self.dayRoutePointMarker)
        }
        setBoundingBoxToCoordinates()
    }
    
    func getNavigateSelectedPointMarker() {
        
        clearAllMarker()
        if let nokta = self.selectedPoint {
            MapHelpherClass().createMarkerAddressBook(point: nokta) { markers in
                if markers.first != nil {
                    self.navigateSelectedPointMarker = markers.first!
                    self.coordinates.append(GeoCoordinates(latitude: Double(nokta.enlem) ?? -1.0, longitude: Double(nokta.boylam) ?? -1.0))
                }
            }
        }
        
        if self.navigateSelectedPointMarker != nil {
            self.mapView.mapScene.addMapMarker(self.navigateSelectedPointMarker!)
        }
        setBoundingBoxToCoordinates()
    }
    
    func clearNavigateSelectedPointMarker() {
        if navigateSelectedPointMarker != nil {
            self.mapView.mapScene.removeMapMarker(self.navigateSelectedPointMarker!)
            navigateSelectedPointMarker = nil
        }
    }
    
    func clearDayRoutePointMarker() {
        coordinates = []
        if self.dayRoutePointMarker != [] {
            self.mapView.mapScene.removeMapMarkers(dayRoutePointMarker)
            self.dayRoutePointMarker = []
        }
    }
    
    func getWeeklyRoutePointMarker() {
        clearAllMarker()
        editPersonelRoutePointArrayFrekansFilter = []
        for i in 0..<self.personelRoutePointArrayFrekansFilter.count {
            var nokta = self.personelRoutePointArrayFrekansFilter[i]
            if let index = self.editPersonelRoutePointArrayFrekansFilter.firstIndex(where: { $0.takipId == nokta.takipId }) {
                self.editPersonelRoutePointArrayFrekansFilter[index].haftaninGunu = "\(self.editPersonelRoutePointArrayFrekansFilter[index].haftaninGunu),\(nokta.haftaninGunu)"
                self.editPersonelRoutePointArrayFrekansFilter[index].baslangicZamani = "\(self.editPersonelRoutePointArrayFrekansFilter[index].baslangicZamani),\(nokta.baslangicZamani)"
                self.editPersonelRoutePointArrayFrekansFilter[index].bitisZamani = "\(self.editPersonelRoutePointArrayFrekansFilter[index].bitisZamani),\(nokta.bitisZamani)"
                self.editPersonelRoutePointArrayFrekansFilter[index].mesafeKM = "\(self.editPersonelRoutePointArrayFrekansFilter[index].mesafeKM),\(nokta.mesafeKM)"
                self.editPersonelRoutePointArrayFrekansFilter[index].sureDK = "\(self.editPersonelRoutePointArrayFrekansFilter[index].sureDK),\(nokta.sureDK)"
            } else {
                nokta.haftaninGunu = "\(nokta.haftaninGunu)"
                nokta.baslangicZamani = "\(nokta.baslangicZamani)"
                nokta.bitisZamani = "\(nokta.bitisZamani)"
                nokta.mesafeKM = "\(nokta.mesafeKM)"
                nokta.sureDK = "\(nokta.sureDK)"
                self.editPersonelRoutePointArrayFrekansFilter.append(nokta)
            }
        }
        
        for nokta in self.editPersonelRoutePointArrayFrekansFilter {
            let stringArray = nokta.kritikGun.components(separatedBy: ", ").map { $0.trimmingCharacters(in: .whitespaces) }
            MapHelpherClass().createMarkerAddressBook(point: nokta, week: true, kritikGun: stringArray) { markers in
                if markers.first != nil {
                    self.weekRoutePointMarker.append(markers.first!)
                    self.coordinates.append(GeoCoordinates(latitude: Double(nokta.enlem) ?? -1.0, longitude: Double(nokta.boylam) ?? -1.0))
                }
            }
        }
        
        if self.weekRoutePointMarker != [] {
            self.mapView.mapScene.addMapMarkers(self.weekRoutePointMarker)
        }
        setBoundingBoxToCoordinates()
    }
    
    func clearWeeklyRoutePointMarker() {
        coordinates = []
        if self.weekRoutePointMarker != [] {
            self.mapView.mapScene.removeMapMarkers(weekRoutePointMarker)
            self.weekRoutePointMarker = []
        }
    }
    
    func clearAllMarker() {
        clearWeeklyRoutePointMarker()
        clearDayRoutePointMarker()
        clearNavigateSelectedPointMarker()
    }
    
    
    func setBoundingBoxToCoordinates() {
        if coordinates != [] {
            self.mapView.setBoundingBox(coordinates: coordinates)
        }
    }
    
    func markerClicked(groupingList: [MapMarker]) {
        for i in groupingList {
            let isTitle = i.metadata?.getString(key: MarkerTypesKey.pointMarkerId) ?? ""
            print("isTitlevisTitle - \(isTitle)")
            if isTitle != "" {
                print("aajajajaja")
                var selectNokta = editPersonelRoutePointArrayFrekansFilter.filter { "\($0.takipId)" == isTitle }.first
                print("selectNokta - \(selectNokta)")
                
                if selectNokta != nil {
                    print("YYYYY")
                    self.selectedPoint = selectNokta
                    self.isPointDialog = true
                }
            }
        }
    }
    
    func dayMarkerClicked(groupingList: [MapMarker]) {
        for i in groupingList {
            let isTitle = i.metadata?.getString(key: MarkerTypesKey.pointMarkerId) ?? ""
            print("isTitlevisTitle - \(isTitle)")
            if isTitle != "" {
                print("aajajajaja")
                var selectNokta = personelDayRoutePointArray.filter { "\($0.takipId)" == isTitle }.first
                print("selectNokta - \(selectNokta)")
                
                if selectNokta != nil {
                    print("YYYYY")
                    self.selectedPoint = selectNokta
                    self.isDayMapExcDialog = true
                }
            }
        }
    }
    
    func getRouteSetting() {
        if isDummyData {
            if let jsonData = routeSettingStr.data(using: .utf8) {
                do {
                    let company = try JSONDecoder().decode([RouteSettingModel].self, from: jsonData)
                    print("Parsed ModelgetRouteSetting: \(company)")
                    self.routeSetting = company
                    
                } catch {
                    print("JSON parse error: \(error)")
                }
            }
            self.isLoading = false
            print("self.isLoading15")
        }
    }
    
    
    
    func getReportAll(loading: Bool = false, resultHandler:@escaping (Bool) -> ()) {
        if loading {
            self.isLoading = true
        }
        
        //BU API OK
        if isDummyData {
            if let jsonData = reportModelStr.data(using: .utf8) {
                do {
                    let company = try JSONDecoder().decode([ReportModel].self, from: jsonData)
                    print("Parsed Model: \(company)")
                    self.reportDetailArray = [company.filter { $0.aracPlaka == "07 BDU 310" }.first!]
                    self.fillWidgets()
                } catch {
                    print("JSON parse error: \(error)")
                }
            }
            self.isLoading = false
            print("self.isLoading15")
        } else {
            /*let mobileId: String = preferences.string(forKey: "token") ?? ""
            
            let plateString = globalSelectedUserPlateArray.map { "\($0)" }.joined(separator: ",")
            let storeString = globalSelectedStoreArray.map { "\($0)" }.joined(separator: ",")
            
            if globalSelectedDateType == .today {
                gloablSelectedFirstDate = Date()
                globalSelectedSecondDate = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
            } else if globalSelectedDateType == .tomorrow {
                gloablSelectedFirstDate = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
                globalSelectedSecondDate = Date()
            } else if globalSelectedDateType == .lastWeek {
                gloablSelectedFirstDate = Calendar.current.date(byAdding: .day, value: -8, to: Date())!
                globalSelectedSecondDate = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
            }
            
            if localNetwork {
                /*let sql = SQLiteCommands.getSqlReportModel(plate: self.globalSelectedUserPlateArray.map { "\($0)" }.joined(separator: ","), store: self.globalSelectedStoreArray.map { "\($0)" }.joined(separator: ","), date: "\(formatDate(self.gloablSelectedFirstDate))-\(formatDate(self.globalSelectedSecondDate))")
                self.reportDetailArray = sql?.sqlReportReport ?? []
                self.fillWidgets()
                self.isLoading = false */
            } else {
                networkManager.getReportAll(StartDate: "2025-02-01"/*formatDate(self.gloablSelectedFirstDate)*/, EndDate: "2025-02-03"/*formatDate(self.globalSelectedSecondDate)*/, StaffIds: plateString, ReportTypeA: 33, CompanyIds: /*storeString*/"110641,110642,110659", SessionKey: mobileId, completion: { [weak self] result in
                    guard self != nil else { return }
                    
                    let result1: ApiResponseFunc.ResponseResult<[ReportModel]> = ApiResponseFunc().jsonStringToModel(api: "getReportAll", result: result)
                    if result1.isError {
                        print("getReportAll hatalı")
                        self?.errorDialogCallFunc(response: result1)
                        resultHandler(true)
                        if loading {
                            self?.isLoading = false
                            print("self.isLoading16")
                        }
                    } else {
                        if result1.data.first?.first != nil {
                            self?.reportDetailArray = result1.data.first!
                            
                            
                            if loading {
                                self?.isLoading = false
                                print("self.isLoading17")
                            }
                            self?.fillWidgets()
                            resultHandler(true)
                            //SQLiteCommands.updateReportModel(self!.reportDetailArray)
                            print("getReportAll başarılı")
                            
                        } else {
                            self?.reportDetailArray = []
                            if loading {
                                self?.isLoading = false
                                print("self.isLoading18")
                            }
                            resultHandler(true)
                        }
                    }
                })
            } */
        }
    }
    
    func fillWidgets() {
        widgetArrayOnlyData = []
        widgets[0].widget = []
        widgets[1].widget = []
        widgets[2].widget = []
        widgets[3].widget = []
        widgets[4].widget = []
        
        //Bölge
        let uniqueDepoSet = Set(self.reportDetailArray.map { $0.depo })
        let uniqueDepoCount = uniqueDepoSet.count
        
        self.widgetArrayOnlyData.append(WidgetModelOnlyData(widgetType: .bolge, widgetTitle: String(localized: "WDBölge"), itemBgColor1: .blue, itemBgColor2: .blue.opacity(0.5), itemIconText: ImageConstants.wToptoplamBolge.rawValue, itemValue: "\(uniqueDepoCount)", itemValueText: "", itemValueTextColor: .blue))
        
        print("Bölge: \(uniqueDepoCount)")
        
        //Gun
        let uniqueWidgetGun = Set(self.reportDetailArray.map { $0.plannedStartDate })
        let uniqueWidgetGunCount = uniqueWidgetGun.count
        
        self.widgetArrayOnlyData.append(WidgetModelOnlyData(widgetType: .gun, widgetTitle: String(localized: "WDGün"), itemBgColor1: .red, itemBgColor2: .red.opacity(0.5), itemIconText: ImageConstants.wGun.rawValue, itemValue: "\(uniqueWidgetGunCount)", itemValueText: "", itemValueTextColor: .red))
        
        print("GUN: \(uniqueWidgetGunCount)")
        
        //Araç
        let uniqueAracSet = Set(self.reportDetailArray.map { $0.aracPlaka })
        let uniqueAracCount = uniqueAracSet.count
        
        self.widgetArrayOnlyData.append(WidgetModelOnlyData(widgetType: .arac, widgetTitle: String(localized: "WDArac"), itemBgColor1: .red, itemBgColor2: .red.opacity(0.5), itemIconText: ImageConstants.wToptoplamArac.rawValue, itemValue: "\(uniqueAracCount)", itemValueText: "", itemValueTextColor: .red))
        
        print("Araç: \(uniqueAracCount)")
        
        //Sefer Başlatan/Bitiren
        let toplamSeferBaslatAdet = self.reportDetailArray.reduce(0) { $0 + $1.seferBaslatAdet }
        let toplamSeferBaslatmayanAdet = self.reportDetailArray.reduce(0) { $0 + $1.seferBaslatmayanAdet }
        self.widgetArrayOnlyData.append(WidgetModelOnlyData(widgetType: .seferBaslatan, widgetTitle: String(localized: "WDBaslatan"), itemBgColor1: .green, itemBgColor2: .green.opacity(0.5), itemIconText: ImageConstants.wSefseferbaslatan.rawValue, itemValue: "\(toplamSeferBaslatAdet)", itemValueText: String(localized: "WDBaslatan1"), itemValueTextColor: .green))
        self.widgetArrayOnlyData.append(WidgetModelOnlyData(widgetType: .seferBaslatmayan, widgetTitle: String(localized: "WDBaslatmayan"), itemBgColor1: .red, itemBgColor2: .red, itemIconText: ImageConstants.wSefseferbaslatmayan.rawValue, itemValue: "\(toplamSeferBaslatmayanAdet)", itemValueText: String(localized: "WDBaslatmayan1"), itemValueTextColor: .red))
        
        print("SeferBaşlatan: \(toplamSeferBaslatAdet)")
        print("SeferBaşlatmayan: \(toplamSeferBaslatmayanAdet)")
        
        //Sefer Bitiren/Bitirmeyen
        let toplamSeferBitisAdet = self.reportDetailArray.reduce(0) { $0 + $1.seferBitisAdet }
        let toplamSeferDevamEden = self.reportDetailArray.reduce(0) { $0 + $1.seferDevamEden }
        
        self.widgetArrayOnlyData.append(WidgetModelOnlyData(widgetType: .seferBitiren, widgetTitle: String(localized: "WDBitiren"), itemBgColor1: .blue, itemBgColor2: .blue.opacity(0.5), itemIconText: ImageConstants.wSefseferbitiren.rawValue, itemValue: "\(toplamSeferBitisAdet)", itemValueText: String(localized: "WDBitiren1"), itemValueTextColor: .blue))
        self.widgetArrayOnlyData.append(WidgetModelOnlyData(widgetType: .seferBitirmeyen, widgetTitle: String(localized: "WDBitirmeyen"), itemBgColor1: .red, itemBgColor2: .red, itemIconText: ImageConstants.wSefseferbitirmeyen.rawValue, itemValue: "\(toplamSeferDevamEden)", itemValueText: String(localized: "WDBitirmeyen1"), itemValueTextColor: .red))
        
        print("SeferBitiren: \(toplamSeferBitisAdet)")
        print("SeferBitirmeyen: \(toplamSeferDevamEden)")
        
        //Olumlu/Olumsuz/Devam Eden
        let toplamOlumluAdet = self.reportDetailArray.reduce(0) { $0 + $1.olumluAdet }
        let toplamKismiOlumluAdet = self.reportDetailArray.reduce(0) { $0 + $1.kismiOlumluAdet }
        let toplamOlumsuzAdet = self.reportDetailArray.reduce(0) { $0 + $1.olumsuzAdet }
        let toplamDevamEdenAdet = self.reportDetailArray.reduce(0) { $0 + $1.ugranMamisAdet }
        let toplamDevamEdenAdet1 = self.reportDetailArray.reduce(0) { $0 + $1.devamEdenAdet }
        
        self.widgetArrayOnlyData.append(WidgetModelOnlyData(widgetType: .olumlu, widgetTitle: String(localized: "WDOlumlu"), itemBgColor1: .blue, itemBgColor2: .blue.opacity(0.5), itemIconText: ImageConstants.wTesolumlu.rawValue, itemValue: "\(toplamOlumluAdet + toplamKismiOlumluAdet)", itemValueText: String(localized: "WDBitiren1"), itemValueTextColor: .blue))
        self.widgetArrayOnlyData.append(WidgetModelOnlyData(widgetType: .olumsuz, widgetTitle: String(localized: "WDOlumsuz"), itemBgColor1: .red, itemBgColor2: .red, itemIconText: ImageConstants.wTesolumsuz.rawValue, itemValue: "\(toplamOlumsuzAdet)", itemValueText: String(localized: "WDBitirmeyen1"), itemValueTextColor: .red))
        self.widgetArrayOnlyData.append(WidgetModelOnlyData(widgetType: .devamEden, widgetTitle: String(localized: "WDDevam"), itemBgColor1: .red, itemBgColor2: .red, itemIconText: ImageConstants.wTesdevamEden.rawValue, itemValue: "\(toplamDevamEdenAdet + toplamDevamEdenAdet1)", itemValueText: String(localized: "WDBitirmeyen1"), itemValueTextColor: .red))
        
        print("Olumlu: \(toplamOlumluAdet + toplamKismiOlumluAdet)")
        print("Olumsuz: \(toplamOlumsuzAdet)")
        print("DevamEden: \(toplamDevamEdenAdet + toplamDevamEdenAdet1)")
        
        //Tamamlanmış Devam Eden
        var toplamAdet = self.reportDetailArray.reduce(0) { $0 + $1.toplamAdet }
        var tamamlanmis = 0
        if toplamAdet != 0 {
            tamamlanmis = ((toplamOlumluAdet + toplamKismiOlumluAdet + toplamOlumsuzAdet) / toplamAdet) * 100
        }
        var devamEdenPer = 100 - tamamlanmis
        
        /*self.widgetArrayOnlyData.append(WidgetModelOnlyData(widgetType: .tamamlanmis, widgetTitle: "Limit Üstü", itemBgColor1: .purple, itemBgColor2: .purple.opacity(0.5), itemIconText: "checkmark.circle", itemValue: "\(tamamlanmis) %", itemValueText: "Biti\nren", itemValueTextColor: .purple))
        self.widgetArrayOnlyData.append(WidgetModelOnlyData(widgetType: .devamEden, widgetTitle: "Bitir\nmeyen", itemBgColor1: .red, itemBgColor2: .red, itemIconText: "xmark.circle", itemValue: "\(devamEdenPer) %", itemValueText: "Bitir\nmeyen", itemValueTextColor: .red)) */
        
        print("Tamamlanmış: \(tamamlanmis) %")
        print("DevamEden: \(devamEdenPer) %")
        
        //toplamsipariş
        var toplamSiparis = toplamOlumluAdet + toplamOlumsuzAdet + toplamKismiOlumluAdet + toplamDevamEdenAdet + toplamDevamEdenAdet1
        self.widgetArrayOnlyData.append(WidgetModelOnlyData(widgetType: .toplamSiparis, widgetTitle: String(localized: "WDSiparis"), itemBgColor1: .red, itemBgColor2: .red, itemIconText: ImageConstants.wToptoplamSiparis.rawValue, itemValue: "\(toplamSiparis)", itemValueText: String(localized: "WDToplamSefer"), itemValueTextColor: .white))
        
        //Limit Üstü/Altı
        let toplamKgBuyuk = self.reportDetailArray.reduce(0) { $0 + ($1.dropSayisi >= 40 ? 1 : 0) }
        let toplamKgKucuk = self.reportDetailArray.reduce(0) { $0 + ($1.dropSayisi < 40 ? 1 : 0) }
        
        self.widgetArrayOnlyData.append(WidgetModelOnlyData(widgetType: .limitUstu, widgetTitle: String(localized: "WDLimitUstu"), itemBgColor1: .purple, itemBgColor2: .purple.opacity(0.5), itemIconText: "checkmark.circle", itemValue: "\(toplamKgBuyuk)", itemValueText: String(localized: "WDBitiren1"), itemValueTextColor: .purple))
        self.widgetArrayOnlyData.append(WidgetModelOnlyData(widgetType: .limitAlti, widgetTitle: String(localized: "WDBitirmeyen1"), itemBgColor1: .red, itemBgColor2: .red, itemIconText: "xmark.circle", itemValue: "\(toplamKgKucuk)", itemValueText: String(localized: "WDBitirmeyen1"), itemValueTextColor: .red))
        
        print("LimitÜstü: \(toplamKgBuyuk)")
        print("LimitAltı: \(toplamKgKucuk)")
        
        //Ortalam Verimlilik
        var ortVerimlilik = (Double(toplamOlumluAdet) / Double((toplamOlumluAdet + toplamOlumsuzAdet + toplamKismiOlumluAdet))) * 100
        if Double(toplamOlumluAdet) == 0.0 || Double((toplamOlumluAdet + toplamOlumsuzAdet + toplamKismiOlumluAdet)) == 0.0 {
            ortVerimlilik = 0
        }
        self.widgetArrayOnlyData.append(WidgetModelOnlyData(widgetType: .verimlilik, widgetTitle: String(localized: "WDVerimlilik"), itemBgColor1: .purple, itemBgColor2: .purple.opacity(0.5), itemIconText: ImageConstants.wOrtortverimlilik.rawValue, itemValue: "\(String(format: "%.2f", ortVerimlilik))", itemValueText: String(localized: "WDBitiren1"), itemValueTextColor: .purple))
        print("OrtalamaVerimlilik: \(ortVerimlilik)")
        
        //Teslimat Araç Başı/Drop Başı
        let toplamDrop = self.reportDetailArray.reduce(0) { $0 + $1.dropSayisi }
        var teslimatAracBasi = "0" + "/" + "0"
        var dropAracBasi = "" + "/" + "0"
        
        if uniqueAracCount != 0 {
            teslimatAracBasi = "\(toplamAdet)" + "/" + ("\(toplamAdet / uniqueAracCount)")
            dropAracBasi = "\(toplamDrop)" + "/" + ("\(toplamDrop / uniqueAracCount)")
        }
        
        self.widgetArrayOnlyData.append(WidgetModelOnlyData(widgetType: .teslimatArac, widgetTitle: String(localized: "WDLimitUstu"), itemBgColor1: .purple, itemBgColor2: .purple.opacity(0.5), itemIconText: "checkmark.circle", itemValue: "\(teslimatAracBasi)", itemValueText: String(localized: "WDBitiren"), itemValueTextColor: .purple))
        self.widgetArrayOnlyData.append(WidgetModelOnlyData(widgetType: .teslimatDrop, widgetTitle: String(localized: "WDLimitUstu"), itemBgColor1: .purple, itemBgColor2: .purple.opacity(0.5), itemIconText: "checkmark.circle", itemValue: "\(dropAracBasi)", itemValueText: String(localized: "WDBitiren"), itemValueTextColor: .purple))
        //String(format: "%.2f", cell.itemValueD)
        
        print("TeslimatAraçBaşı: \(teslimatAracBasi)")
        print("DropAraçBaşı: \(dropAracBasi)")
        
        //Ort Sefer Bitirme
        let toplamGerceklesenDkBolumToplamAdet = self.reportDetailArray.reduce(0.0) { total, report in
            if report.seferBitisAdet > 0 {
                return total + (Double(report.gerceklesenDk) / Double(report.toplamAdet))
            } else {
                return total
            }
        }
        
        //let seferBitisAdetiBuyukSifirOlanSayisi = self.reportDetailArray.filter { $0.seferBitisAdet > 0 }.count
        //let oran = seferBitisAdetiBuyukSifirOlanSayisi > 0 ? toplamGerceklesenDkBolumToplamAdet / Double(seferBitisAdetiBuyukSifirOlanSayisi) : 0
        
        var toplamSeferSuresi = self.reportDetailArray.reduce(0) { $0 + (Int($1.toplamSeferSuresi) ?? 0) }
        
        var oran = 0.0
        if uniqueAracCount != 0 {
            oran = Double(toplamSeferSuresi) / Double(uniqueAracCount)
        }
        
        
        self.widgetArrayOnlyData.append(WidgetModelOnlyData(widgetType: .ortSeferBitirme, widgetTitle: String(localized: "WDSeferBit"), itemBgColor1: .blue, itemBgColor2: .blue.opacity(0.5), itemIconText: ImageConstants.wOrtortseferbitirme.rawValue, itemValue: String(format: "%.2f", oran), itemValueText: "", itemValueTextColor: .blue))
        
        print("OrtalamaSeferBitirme: \(oran) DK")
        
        //OrtalamaTeslimatSüresi
        
        var toplamTeslimatSuresi = self.reportDetailArray.reduce(0.0) { $0 + (Double($1.teslimatPerformans) ?? 0) }
        var oranTes = 0.0
        if uniqueAracCount != 0 {
            oranTes = Double(toplamTeslimatSuresi) / Double(uniqueAracCount)
        }
        
        self.widgetArrayOnlyData.append(WidgetModelOnlyData(widgetType: .ortTeslimatSure, widgetTitle: String(localized: "WDTeslimat"), itemBgColor1: .blue, itemBgColor2: .blue.opacity(0.5), itemIconText: ImageConstants.wOrtortteslimatsure.rawValue, itemValue: "\(Double(oranTes))", itemValueText: "", itemValueTextColor: .blue))
        
        print("OrtalamaTeslimatSüresi: \(oranTes) DK")
        
        //Hesaplanan/Toplanan
        let toplamHesaplananKm = self.reportDetailArray.reduce(0.0) { $0 + $1.planlananKM }
        let toplamGerceklesenKm = self.reportDetailArray.reduce(0.0) { $0 + $1.gerceklesenKM }
        
        self.widgetArrayOnlyData.append(WidgetModelOnlyData(widgetType: .hesaplananKm, widgetTitle: String(localized: "WDHesKm"), itemBgColor1: .orange, itemBgColor2: .orange.opacity(0.5), itemIconText: ImageConstants.wTophesaplananKm.rawValue, itemValue: "\(toplamHesaplananKm)", itemValueText: String(localized: "WDBitiren1"), itemValueTextColor: .orange))
        self.widgetArrayOnlyData.append(WidgetModelOnlyData(widgetType: .toplananKm, widgetTitle: String(localized: "WDTopKm"), itemBgColor1: .pink, itemBgColor2: .pink, itemIconText: ImageConstants.wToptoplananKm.rawValue, itemValue: "\(toplamGerceklesenKm)", itemValueText: String(localized: "WDBitirmeyen1"), itemValueTextColor: .pink))
        
        print("HesaplananKM: \(toplamHesaplananKm)KM")
        print("ToplananKM: \(toplamGerceklesenKm)KM")
        
        var kmVerimlilik = 0.0
        if toplamGerceklesenKm != 0 && toplamHesaplananKm != 0 {
            kmVerimlilik = (toplamGerceklesenKm / toplamHesaplananKm) * 100
        }
        //let kmVerimlilik = (toplamGerceklesenKm / toplamHesaplananKm) * 100
        self.widgetArrayOnlyData.append(WidgetModelOnlyData(widgetType: .kmVerimlilik, widgetTitle: String(localized: "WDKmVer"), itemBgColor1: .pink, itemBgColor2: .pink, itemIconText: ImageConstants.wToptoplananKm.rawValue, itemValue: "\(String(format: "%.2f", kmVerimlilik)) %", itemValueText: String(localized: "WDBitirmeyen1"), itemValueTextColor: .pink))
        
        
        
        //Ortalama Geofence
        var filterArr = self.reportDetailArray.filter { $0.geofence <= 1.5 }
        var toplamGeofence = filterArr.reduce(0.0) { $0 + $1.geofence }
        var ortGeofence = 0.0
        
        if Double(toplamGeofence) != 0.0 && Double(filterArr.count) != 0.0 {
            ortGeofence = Double(toplamGeofence) / Double(filterArr.count)
        }
        self.widgetArrayOnlyData.append(WidgetModelOnlyData(widgetType: .ortGeofence, widgetTitle: String(localized: "WDGeofence"), itemBgColor1: .pink, itemBgColor2: .pink, itemIconText: ImageConstants.wOrtortgeofence.rawValue, itemValue: "\(ortGeofence) KM", itemValueText: String(localized: "WDBitirmeyen1"), itemValueTextColor: .pink))
        var toplamYakin = self.reportDetailArray.reduce(0) { $0 + $1.yakin }
        var toplamNoktaAtisi = self.reportDetailArray.reduce(0) { $0 + $1.noktaAtisi }
        
        var persGeofence = (Double((toplamYakin + toplamNoktaAtisi)) / Double((toplamOlumluAdet + toplamKismiOlumluAdet + toplamOlumsuzAdet))) * 100
        
        if Double((toplamYakin + toplamNoktaAtisi)) == 0.0 || Double((toplamOlumluAdet + toplamKismiOlumluAdet + toplamOlumsuzAdet)) == 0.0 {
            persGeofence = 0
        }
        
        /*self.widgetArrayOnlyData.append(WidgetModelOnlyData(widgetType: .ortGeofence, widgetTitle: "KM", itemBgColor1: .pink, itemBgColor2: .pink, itemIconText: ImageConstants.wTesolumlu.rawValue, itemValue: "\(persGeofence) %", itemValueText: "Bitir\nmeyen", itemValueTextColor: .pink)) */
        
        print("OrtalamaGeofence: \(ortGeofence) KM")
        print("OrtalamaGeofence%: \(persGeofence) %")
        
        let toplamNoktadaBeklemeSuresi = self.reportDetailArray.reduce(0) { $0 + (Int($1.noktadaBeklemeIsSuresi) ?? 0) }
        print("toplamNoktadaBeklemeSuresi - \(toplamNoktadaBeklemeSuresi)")
        var ortBeklemeSuresi: Int = 0
        if toplamNoktadaBeklemeSuresi != 0 {
            ortBeklemeSuresi = toplamNoktadaBeklemeSuresi / (toplamOlumluAdet + toplamOlumsuzAdet + toplamKismiOlumluAdet)
        }
        print("ortBeklemeSuresi - \(ortBeklemeSuresi)")
        var ortBeklemeSuresiHHDD = formatToHoursAndMinutes(from: ortBeklemeSuresi)
        self.widgetArrayOnlyData.append(WidgetModelOnlyData(widgetType: .ortBeklemeSuresi, widgetTitle: String(localized: "WDOrtBek"), itemBgColor1: .pink, itemBgColor2: .pink, itemIconText: ImageConstants.wOrtortgeofence.rawValue, itemValue: "\(ortBeklemeSuresi) DK", itemValueText: String(localized: "WDBitirmeyen1"), itemValueTextColor: .pink))
        
        let rut = self.reportDetailArray.reduce(0) { $0 + (Int($1.rutSayi)) }
        self.widgetArrayOnlyData.append(WidgetModelOnlyData(widgetType: .rut, widgetTitle: String(localized: "WDRut1"), itemBgColor1: .red, itemBgColor2: .red.opacity(0.5), itemIconText: ImageConstants.wRut.rawValue, itemValue: "\(rut)", itemValueText: "", itemValueTextColor: .red))
        
        print("RUT: \(rut)")
        
        let rutIcıZiyaret = toplamOlumluAdet + toplamKismiOlumluAdet
        self.widgetArrayOnlyData.append(WidgetModelOnlyData(widgetType: .rutIciZiyaret, widgetTitle: String(localized: "WDRutIci"), itemBgColor1: .red, itemBgColor2: .red.opacity(0.5), itemIconText: ImageConstants.wRutIci.rawValue, itemValue: "\(rutIcıZiyaret)", itemValueText: "", itemValueTextColor: .red))
        
        print("RUT İÇİ ZİYARET: \(rutIcıZiyaret)")
        
        let rutDisi = self.reportDetailArray.reduce(0) { $0 + (Int($1.rutDisi)) }
        self.widgetArrayOnlyData.append(WidgetModelOnlyData(widgetType: .rutDisi, widgetTitle: String(localized: "WDRutDisi"), itemBgColor1: .red, itemBgColor2: .red.opacity(0.5), itemIconText: ImageConstants.wRutDisi.rawValue, itemValue: "\(rutDisi)", itemValueText: "", itemValueTextColor: .red))
        
        print("RUT DIŞI: \(rutDisi)")
        
        let sapmaSayisi = toplamOlumsuzAdet
        self.widgetArrayOnlyData.append(WidgetModelOnlyData(widgetType: .sapmaSayisi, widgetTitle: String(localized: "WDSapma"), itemBgColor1: .red, itemBgColor2: .red.opacity(0.5), itemIconText: ImageConstants.wSapma.rawValue, itemValue: "\(sapmaSayisi)", itemValueText: "", itemValueTextColor: .red))
        
        print("SAPMA SAYISI: \(sapmaSayisi)")
        
        let duraklama = self.reportDetailArray.reduce(0) { $0 + (Int($1.duraklama)) }
        self.widgetArrayOnlyData.append(WidgetModelOnlyData(widgetType: .duraklama, widgetTitle: String(localized: "WDDuraklama"), itemBgColor1: .red, itemBgColor2: .red.opacity(0.5), itemIconText: ImageConstants.wDuraklama.rawValue, itemValue: "\(duraklama)", itemValueText: "", itemValueTextColor: .red))
        
        print("DURAKLAMA: \(duraklama)")
        
        
        

        for widget in widgetArrayOnlyData {
            print("widget - \(widget.itemValueText) -- \(widget)")
            if [WidgetType.olumlu, WidgetType.olumsuz, WidgetType.devamEden].contains(widget.widgetType) { //teslimat
                widgets[0].widget.append(widget)
            } else if [WidgetType.seferBaslatan, WidgetType.seferBaslatmayan, WidgetType.seferBitiren, WidgetType.seferBitirmeyen].contains(widget.widgetType) { //sefer
                widgets[1].widget.append(widget)
            } else if [WidgetType.ortTeslimatSure, WidgetType.ortSeferBitirme, WidgetType.ortGeofence, WidgetType.verimlilik, WidgetType.ortBeklemeSuresi].contains(widget.widgetType) { //ortalama
                widgets[2].widget.append(widget)
            } else if [WidgetType.bolge, WidgetType.arac, WidgetType.gun, WidgetType.toplamSiparis, WidgetType.hesaplananKm, WidgetType.toplananKm, WidgetType.kmVerimlilik].contains(widget.widgetType) { //toplam
                widgets[3].widget.append(widget)
            } else if [WidgetType.sapmaSayisi, WidgetType.rutIciZiyaret, WidgetType.rut, WidgetType.rutDisi, WidgetType.duraklama].contains(widget.widgetType) {
                widgets[4].widget.append(widget)
            }
        }
    }
}

