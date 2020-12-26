//
//EntryDBHelper.swift
//  ProteusVision
//
//  Created by Nitin Patil on 30/06/20.
//  Copyright © 2020 Proteus Technologies. All rights reserved.
//

import Foundation
import CoreData
import UIKit


@available(iOS 11.0, *)
class EntryDBHelper{
    
    static var sharedInstance = EntryDBHelper()
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext

 
    
    func addNewEntry(object:[String:String]){
        
        let entry = NSEntityDescription.insertNewObject(forEntityName: "Diary_Entry", into: context!) as! Diary_Entry
        entry.detail = object["detail"]
        entry.timeStamp = object["timeStamp"]
        entry.title = object["title"]
        entry.photoUrl = object["photoUrl"]
        entry.dateStamp = object["dateStamp"]
        entry.emojiString = object["emojiString"]


        do{
            try context?.save()
        }catch{
            print("no data")
        }
        
    }
    
    func getEntries() -> [Diary_Entry]?{
        
        var entries = [Diary_Entry]()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Diary_Entry")
        
        
        do {
            entries = try context?.fetch(fetchRequest) as! [Diary_Entry]
        } catch {
            
            print("Failed")
        }
        return entries
    }
    
}
