//
//  AppDelegate.swift
//  WfmAdmin
//
//  Created by Mustafa Alper Aydin on 27.01.2025.
//

import SwiftUI
import CoreLocation
import UserNotifications
import Firebase
import FirebaseMessaging

class AppDelegate: NSObject, UIApplicationDelegate, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    let gcmMessageIDKey = "gcm.message_id"
    //let alertChecker = AlertChecker.shared
    func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        Messaging.messaging().delegate = self
        UNUserNotificationCenter.current().delegate = self
        
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
              options: authOptions,
            completionHandler: { _, _ in }
        )

        application.registerForRemoteNotifications()
        
        let databaseVersiyon = preferences.integer(forKey: "database_versiyon")
        SQLiteDatabase.sharedInstance.updateDatabase(database_versiyon: databaseVersiyon)
        
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 20.0
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.showsBackgroundLocationIndicator = true
        locationManager.startUpdatingLocation()
        locationManager.startMonitoringSignificantLocationChanges()
        
        //onLaunchPushNotification(launchOptions: launchOptions)
        updateRemoteConfig()
        //AlertChecker.shared.startChecking()
        //alertChecker.startChecking()
        return true
    }
    
    func updateRemoteConfig() {
        print("updateRemoteConfig-1-1")
        let remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
        print("aaadddadadad")
        
        remoteConfig.addOnConfigUpdateListener { configUpdate, error in
            print("aaasdasdasdasdasdsad")
            guard let configUpdate, error == nil else {
                print("Error listening for config updates: \(error)")
                return
            }

            print("Updated keys: \(configUpdate.updatedKeys)")

            remoteConfig.activate { changed, error in
                guard error == nil else { return print("errorremote - \(error)") }
                DispatchQueue.main.async {
                    let accessKeyID = remoteConfig.configValue(forKey: MapKey.keyID).stringValue ?? ""
                    let accessKeySecret = remoteConfig.configValue(forKey: MapKey.keySecret).stringValue ?? ""
                    let autoSuggestApiKey = remoteConfig.configValue(forKey: MapKey.autoSuggestKey).stringValue ?? ""
                    let is_crash_demo = remoteConfig.configValue(forKey: "is_crash_demo").boolValue ?? false
                    preferences.set(accessKeyID, forKey: "accessKeyID")
                    preferences.set(accessKeySecret, forKey: "accessKeySecret")
                    preferences.set(autoSuggestApiKey, forKey: "autoSuggestApiKey")
                    preferences.set(is_crash_demo, forKey: "is_crash_demo")
                    print("accessKeyID - \(accessKeyID)")
                    print("accessKeySecret - \(accessKeySecret)")
                    print("autoSuggestApiKey - \(autoSuggestApiKey)")
                }
            }
        }
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        print("APNs token retrieved: \(deviceToken)")

        // With swizzling disabled you must set the APNs token here.
        Messaging.messaging().apnsToken = deviceToken
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("\(error)")
        print("application didFailToRegisterForRemoteNotificationsWithError")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first{
            lastLocation = location
            //NotificationCenter.default.post(name: Notification.Name("LocationUpdated"), object: location) //lokasyon değişince başka bir yeri tetiklemek istersen bu notf kullanılabilir
            //LocationFunc().locationSending(location: location)
        }
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    
    func onLaunchPushNotification(launchOptions: [UIApplication.LaunchOptionsKey: Any]?){
        
        guard let dic = launchOptions?[.remoteNotification] as? [AnyHashable: Any] else{
            return
        }
        processNotificationData(json: dic)
    }
    
    func processNotificationData(json: [AnyHashable: Any]){
        print("processNotificationData - \(json)")
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification) async -> UNNotificationPresentationOptions {
        let dic = notification.request.content.userInfo
        processNotificationData(json: dic)
        return [.banner, .list, .sound]
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse) async {
        let dic = response.notification.request.content.userInfo
        
        processNotificationData(json: dic)
    }

}

extension AppDelegate: MessagingDelegate {
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        print("fcmTokenXXXXXX")
        print(fcmToken ?? "")
        
        if let token = fcmToken{
            //shared'a kaydet
            preferences.set(token, forKey: "token")
        }
    }
    
    func complexFunction(value: Int, flag: Bool) -> String {
        if value == 0 {
            return "Sıfır"
        }
        
        if value > 0 {
            if flag {
                for i in 0..<value {
                    if i % 2 == 0 {
                        print("Çift: \(i)")
                    } else {
                        print("Tek: \(i)")
                    }
                }
                switch value {
                case 1:
                    return "Bir"
                case 2, 3:
                    return "İki veya Üç"
                case 4...10:
                    return "Dört ile On Arasında"
                default:
                    return "Diğer"
                }
            } else {
                while value > 0 {
                    print("Value: \(value)")
                    break
                }
                return "Pozitif ama flag false"
            }
        } else {
            guard flag else {
                return "Negatif ve flag false"
            }
            if value < -10 {
                return "Çok Negatif"
            } else if value < -5 {
                return "Orta Negatif"
            } else {
                return "Az Negatif"
            }
        }
    }
    
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
        print("122233")
        print(userInfo)
        var notfModel: NotificationResponseModel = NotificationResponseModel()
        for notf in userInfo {
            if notf.key.description == "Type" {
                notfModel.Type1 = Int(notf.value as! String)
                /*let stringValue = notf.value as? String ?? "0"
                notfModel.Type1 = Int(stringValue) ?? 0*/
            } else if notf.key.description == "MxRouteId" {
                notfModel.MxRouteId = Int(notf.value as! String)
                /*let stringValue = notf.value as? String ?? "0"
                notfModel.MxRouteId = Int(stringValue) ?? 0*/
            } else if notf.key.description == "MxBlockId" {
                // notfModel.MxBlockId = Int(notf.value as! String)
                let stringValue = notf.value as? String ?? "0"
                notfModel.MxBlockId = Int(stringValue) ?? 0
            } else if notf.key.description == "BlockStatusId" {
                // notfModel.BlockStatusId = Int(notf.value as! String)
                let stringValue = notf.value as? String ?? "0"
                notfModel.BlockStatusId = Int(stringValue) ?? 0
            } else if notf.key.description == "BlockExecutionStatusId" {
                // notfModel.BlockExecutionStatusId = Int(notf.value as! String)
                let stringValue = notf.value as? String ?? "0"
                notfModel.BlockExecutionStatusId = Int(stringValue) ?? 0
            } else if notf.key.description == "BlockActionDesc" {
                notfModel.BlockActionDesc = notf.value as? String
            } else if notf.key.description == "PointStatusId" {
                // notfModel.PointStatusId = Int(notf.value as! String)
                let stringValue = notf.value as? String ?? "0"
                notfModel.PointStatusId = Int(stringValue) ?? 0
            } else if notf.key.description == "PointId" {
                // notfModel.PointId = Int(notf.value as! String)
                let stringValue = notf.value as? String ?? "0"
                notfModel.PointId = Int(stringValue) ?? 0
            } else if notf.key.description == "Show" {
                notfModel.Show = Int(notf.value as! String)
                /*let stringValue = notf.value as? String ?? "0"
                notfModel.Show = Int(stringValue) ?? 0*/
            } else if notf.key.description == "ActionDesc" {
                notfModel.ActionDesc = notf.value as? String
            } else if notf.key.description == "UseSandBox" {
                notfModel.UseSandBox = Int(notf.value as! String)
                /*let stringValue = notf.value as? String ?? "0"
                notfModel.UseSandBox = Int(stringValue) ?? 0*/
            } else if notf.key.description == "ExecutionType" {
                notfModel.ExecutionType = Int(notf.value as! String)
                /*let stringValue = notf.value as? String ?? "0"
                notfModel.ExecutionType = Int(stringValue) ?? 0*/
            }
        }
        
        
        if notfModel.Type1 == 2 {
            NotificationCenter.default.post(name: .notification2, object: nil, userInfo: ["notification2Model" : notfModel])
        } else if notfModel.Type1 == 3 {
            NotificationCenter.default.post(name: .notification3, object: nil, userInfo: ["notification3Model" : notfModel])
        }
        
        processNotificationData(json: userInfo)
        completionHandler(.newData)
    }
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
        print("fcmToken: ", fcmToken)
        let dataDict:[String: String] = ["token": fcmToken]
        NotificationCenter.default.post(name: Notification.Name("FCMToken"), object: nil, userInfo: dataDict)
    }
}
