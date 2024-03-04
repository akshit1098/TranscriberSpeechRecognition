//
//  CoreDataHelper.swift
//  Transcriber
//
//  Created by Akshit Saxena on 3/2/24.
//

import Foundation

import CoreData
import UIKit

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
    
    func getContext()->NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    
    func storeTranscription(audioFileUrl: String, textFileUrl: String){
        let context = getContext()
        
        let entity = NSEntityDescription.entity(forEntityName: "Transcription", in: context)
        
        let transc = NSManagedObject(entity: entity!, insertInto: context)
        
        transc.setValue(audioFileUrl, forKey: "audioFileUrlString")
        
        transc.setValue(textFileUrl, forKey: "textFileUrlString")

        do{
            try context.save()
            print("grantk saved...")
        }
        catch{
            
        }
    }
    
    
}
