//
//  SQLiteDatabase.swift
//  Avansas-iOS
//
//  Created by Banu Ortac on 8.01.2024.
//

import Foundation
import SQLite

class SQLiteDatabase {
    static let sharedInstance = SQLiteDatabase()
    var database : Connection?
    
    private init(){
        // Create connection to database
        do{
            let documentDirectory = try
                FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            
            let fileUrl = documentDirectory.appendingPathComponent("wfmUser").appendingPathExtension("sqlite3")
            
            database = try Connection(fileUrl.path)
                
            
        }catch{
            print("Creating connection to database error: \(error)")
        }
    }
    
    //Creating Table
    func createTable() {
        SQLiteCommands.createTable()
    }
    
    func updateVersiyon2(){
        //SQLiteCommands.updateVersiyon2()
    }
    
    //Update database
    func updateDatabase(database_versiyon: Int) {
        var databaseVersiyon = database_versiyon
        
        if databaseVersiyon == 0{
            //create Tables
            do {
                createTable()
                preferences.setValue(1, forKey: "database_versiyon")
                databaseVersiyon = 1
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
}


