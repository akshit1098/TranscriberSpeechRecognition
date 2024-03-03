//
//  CoreDataHelper.swift
//  Transcriber
//
//  Created by Akshit Saxena on 3/2/24.
//

import Foundation

import CoreData

class CoreDataHelper{
    
    init(){
        let container = NSPersistentContainer(name: "Transcriber")
        container.loadPersistentStores { storeDescription, error in
            if let error = error{
                print("grantk \(error)")
            }
            else{
                print("CoreData Fine")
            }
        }
    }
    
    
}
