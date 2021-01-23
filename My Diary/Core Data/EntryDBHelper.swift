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
        
        var Entries = [Diary_Entry]()
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Diary_Entry")
        let timeStamp = UserDefaults.standard.double(forKey: "uniqueTime")
        let dateStamp = UserDefaults.standard.double(forKey: "uniqueDate")
    
        let condition1 = NSPredicate(format: "timeStamp == %@",String(timeStamp))
        let condition2 = NSPredicate(format: "dateStamp == %@",String(dateStamp))

        fetchRequest.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [condition1,condition2])
        fetchRequest.returnsObjectsAsFaults = false
        
        do
        {
            Entries = try context?.fetch(fetchRequest) as! [Diary_Entry]
            if !Entries.isEmpty
            {
                print(Entries.count)
                let objectUpdate = Entries.first!
                
                objectUpdate.setValue(object["detail"], forKey: "detail")
                objectUpdate.setValue(object["timeStamp"], forKey: "timeStamp")
                objectUpdate.setValue(object["title"], forKey: "title")
                objectUpdate.setValue(object["photoUrl"], forKey: "photoUrl")
                objectUpdate.setValue(object["dateStamp"], forKey: "dateStamp")
                objectUpdate.setValue(object["emojiString"], forKey: "emojiString")

            }else{
                
                let entry = NSEntityDescription.insertNewObject(forEntityName: "Diary_Entry", into: context!) as! Diary_Entry
                entry.detail = object["detail"]
                entry.timeStamp = object["timeStamp"]
                entry.title = object["title"]
                entry.photoUrl = object["photoUrl"]
                entry.dateStamp = object["dateStamp"]
                entry.emojiString = object["emojiString"]
            }
        }
        catch
        {
            print(error)
        }
        
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
