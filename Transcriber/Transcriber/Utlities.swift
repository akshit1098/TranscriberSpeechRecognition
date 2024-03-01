//
//  Utlities.swift
//  Transcriber
//
//  Created by Akshit Saxena on 3/1/24.
//

import Foundation


class Utilities{
    func getDocsDirectory()->URL{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        let docsDirect = paths[0]
        return docsDirect
    }
    
    func getAudioFileUrl()->URL?{
        do{
            let audioUrl = try getDocsDirectory().appendingPathComponent(getDateAndTime() + ".m4a")
            return audioUrl
        }
        catch _ {
            return nil
        }
    }
    
    
    func getDateAndTime()->String{
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd-HH-mm-ss"
        
        let timeString = formatter.string(from: date)
        return timeString
    }
    
    
}
