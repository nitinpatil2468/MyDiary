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
            
            
            for data in entries as [NSManagedObject] {
                print(data.value(forKey: "photoUrl") as! String)
            }
            
        } catch {
            
            print("Failed")
        }
        return entries
    }
    
//
//    func getPinKey() -> String{
//
//        var userInfo = [USER_INFO]()
//        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "USER_INFO")
//
//        let currentUser = UserDefaults.standard.string(forKey: "currentUser")
//        let serverUrl = UserDefaults.standard.string(forKey: "Server")
//
//        let condition1 = NSPredicate(format: "userId == %@",currentUser!)
//        let condition2 = NSPredicate(format: "serverUrl == %@", serverUrl!)
//        fetchRequest.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [condition1,condition2])
//
//        var pinKey = String()
//
//        do{
//
//           userInfo = try context?.fetch(fetchRequest) as! [USER_INFO]
//            if !userInfo.isEmpty {
//
//                let currentModuleName = UserDefaults.standard.string(forKey: "currentModule")
//                let previousModules = userInfo.last?.modules?.allObjects as! [MODULE_INFO]
//
//
//                for module in previousModules {
//                    if module.moduleName == currentModuleName {
//
//                        pinKey = module.pinKey!
//
//                    }
//                }
//            }
//           }
//           catch
//           {
//               print(error)
//           }
//           return pinKey
//
//    }
//
//
//
////    func checkForModule(selectedModule : String) -> Bool{
////
////        var userInfo = [USER_INFO]()
////        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "USER_INFO")
////
////        let currentUser = UserDefaults.standard.string(forKey: "currentUser")
////        let serverUrl = UserDefaults.standard.string(forKey: "Server")
////
////           let condition1 = NSPredicate(format: "userId == %@",currentUser!)
////               let condition2 = NSPredicate(format: "serverUrl == %@", serverUrl!)
////                fetchRequest.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [condition1,condition2])
////
////        var isPresent = false
////
////        do{
////
////        userInfo = try context?.fetch(fetchRequest) as! [USER_INFO]
////            if !userInfo.isEmpty {
////
////                let previousModules = userInfo.last?.modules?.allObjects as! [MODULE_INFO]
////                var moduleArray = [String]()
////
////                for module in previousModules {
////                    moduleArray.append(module.moduleName!)
////                }
////
////                if !moduleArray.contains(selectedModule) {
////                    isPresent =  false
////                }else{
////                    isPresent = true
////                }
////            }
////        }
////        catch
////        {
////            print(error)
////        }
////
////
////
////        return isPresent
////
////
////    }
//
//    func checkForModule(selectedModule : String) -> Bool{
//
//        var moduleInfo = [MODULE_INFO]()
//        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "MODULE_INFO")
//        let condition = NSPredicate(format: "moduleName == %@",selectedModule)
//        fetchRequest.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [condition])
//
//        let currentUser = UserDefaults.standard.string(forKey: "currentUser")
//        let serverUrl = UserDefaults.standard.string(forKey: "Server")
//
//        var isPresent = false
//
//        do{
//
//            moduleInfo = try context?.fetch(fetchRequest) as! [MODULE_INFO]
//            if !moduleInfo.isEmpty {
//
//                for module in moduleInfo{
//
//                    let userinfo = module.user as! USER_INFO
//                    if userinfo.userId == currentUser && userinfo.serverUrl == serverUrl {
//
//                        isPresent = true
//
//                    }
//                }
//            }
//        }
//        catch
//        {
//            print(error)
//        }
//
//
//
//        return isPresent
//
//
//    }
//
//    func deleteModule(ModuleName : String){
//
//        var moduleInfo = [MODULE_INFO]()
//        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "MODULE_INFO")
//        let condition = NSPredicate(format: "moduleName == %@",ModuleName)
//        fetchRequest.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [condition])
//
//        let currentUser = UserDefaults.standard.string(forKey: "currentUser")
//        let serverUrl = UserDefaults.standard.string(forKey: "Server")
//
//        do{
//
//            moduleInfo = try context?.fetch(fetchRequest) as! [MODULE_INFO]
//            if !moduleInfo.isEmpty {
//
//                for module in moduleInfo{
//
//                    let userinfo = module.user!
//                    if userinfo.userId == currentUser && userinfo.serverUrl == serverUrl {
//
//                        context?.delete(module)
//                        do {
//
//                             try context?.save()
//
//                        }catch{
//
//                            print("fail")
//
//                        }
//
//
//                    }
//                }
//            }
//        }
//               catch
//               {
//                   print(error)
//               }
//
//    }
//
//
//
//    func getModule(ModuleName : String) -> MODULE_INFO{
//
//        var moduleInfo = [MODULE_INFO]()
//        var outputModule = MODULE_INFO()
//
//         let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "MODULE_INFO")
//         let condition = NSPredicate(format: "moduleName == %@",ModuleName)
//         fetchRequest.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [condition])
//
//         let currentUser = UserDefaults.standard.string(forKey: "currentUser")
//         let serverUrl = UserDefaults.standard.string(forKey: "Server")
//
//         do{
//
//             moduleInfo = try context?.fetch(fetchRequest) as! [MODULE_INFO]
//             if !moduleInfo.isEmpty {
//
//                 for module in moduleInfo{
//
//                     let userinfo = module.user as! USER_INFO
//                     if userinfo.userId == currentUser && userinfo.serverUrl == serverUrl {
//
//                        outputModule = module
//
//                     }
//                 }
//             }
//         }
//                catch
//                {
//                    print(error)
//                }
//
//        return outputModule
//
//    }
//
//    func getUserInfo() -> [USER_INFO]{
//
//        var userInfo = [USER_INFO]()
//        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "USER_INFO")
//
//        fetchRequest.returnsObjectsAsFaults = false
//
//
//                           do {
//                              userInfo = try context?.fetch(fetchRequest) as! [USER_INFO]
//
//                           } catch {
//
//                               print("Failed")
//                           }
//              return userInfo
//
//    }
//
//    func getModules()-> [MODULE_INFO] {
//
//        var modulesArray = [MODULE_INFO]()
//        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "MODULE_INFO")
//
//        do{
//            modulesArray = try context?.fetch(fetchRequest) as! [MODULE_INFO]
//
//        }
//        catch
//        {
//            print(error)
//        }
//
//        return modulesArray
//    }
//
//
//    func updateModuleInfo(value:String, key:String){
//
//       var moduleInfo = [MODULE_INFO]()
//
//         let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "MODULE_INFO")
//        let ModuleName = UserDefaults.standard.string(forKey: "currentModule")!
//
//        let condition = NSPredicate(format: "moduleName == %@",ModuleName)
//              fetchRequest.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [condition])
//
//              let currentUser = UserDefaults.standard.string(forKey: "currentUser")
//              let serverUrl = UserDefaults.standard.string(forKey: "Server")
//
//              fetchRequest.returnsObjectsAsFaults = false
//
//
//        do
//        {
//            moduleInfo = try context?.fetch(fetchRequest) as! [MODULE_INFO]
//
//            if !moduleInfo.isEmpty {
//
//                for module in moduleInfo{
//
//                    let userinfo = module.user as! USER_INFO
//                    if userinfo.userId == currentUser && userinfo.serverUrl == serverUrl {
//                        module.setValue(value, forKey: key)
//                        do{
//                            try context?.save()
//                        }
//                        catch
//                        {
//                            print("Failed")
//                        }
//
//                    }
//                }
//            }
//        }
//        catch
//        {
//            print(error)
//        }
//
//    }
//
}
