//
//  ASMenuItem.swift
//  ProteusVision
//
//  Created by Nitin Patil on 10/12/20.
//  Copyright © 2020 Proteus Technologies. All rights reserved.
//

import Foundation


class EntryItem: NSObject {
    
    
     var DateStamp : String?
     var SavedEntries : [Diary_Entry]?
     var TITLE : String?
     var Detail : String?
     var Images : [String]?
     var TimeStamp : String?
     var Entries : [EntryItem]?
    
    override init(){
        super.init()
    }

    func setModel(){
        
        if let SavedEntries = EntryDBHelper.sharedInstance.getEntries(){
            
            var entryItems = [EntryItem]()

            for diaryEntry in SavedEntries{
                
                let entryItem = EntryItem()
                entryItem.setTitle(diaryEntry.title!)
                entryItem.setTime(diaryEntry.timeStamp!)
                entryItem.setDate(diaryEntry.dateStamp!)
                entryItem.setDetails(diaryEntry.detail!)
                entryItem.setImages(diaryEntry.photoUrl!)
                entryItems.append(entryItem)

            }
            setEntries(entryItems)
        }
    }
    
     func setEntries(_ Entries:[EntryItem]){

        self.Entries = Entries;

    }
    
    public func getEntries()->[EntryItem]?{

        return Entries!;
    }

     func setTitle(_ TITLE:String){

        self.TITLE = TITLE;

    }
    
     func setDetails(_ Detail:String){

        self.Detail = Detail;

    }
    
     func setTime(_ TimeStamp:String){

        self.TimeStamp = TimeStamp;

    }
    
     func setDate(_ DateStamp:String){

        self.DateStamp = DateStamp;

    }
    
     func setImages(_ images:String){

        let imageArray = images.components(separatedBy: ",")
        self.Images = imageArray

    }
//
    public func getTITLE()->String{

        return TITLE!;
    }
//
    public func getImages()->[String]{

        return Images!;
    }
    
    public func getDetails()->String{

        return Detail!;
    }
    public func getTime()->String{

        return TimeStamp!;
    }
    public func getDate()->String{

        return DateStamp!;
    }
}




   

  
 

   



   


































////  ASMenuItem.swift
////  ProteusVision
////
////  Created by Nitin Patil on 10/12/20.
////  Copyright © 2020 Proteus Technologies. All rights reserved.
////
//
//import Foundation
//
//
//class ASMenuItem: NSObject {
//
//     var TITLE : String?
//     var id : String?
//     var subOptionMenu : [SubOptionMenu]?
//     var icon : String?
//
//     var asMenuItems = [SubOptionMenu]()
//     var subOptionMenus = [SubOptionMenu]()
//     var returnMenu : SubOptionMenu? = nil
//
//     var xmlString : String?
//
////     var TITLE : String?
////     var id : String?
////     var subOptionMenu : [SubOptionMenu]?
////     var icon : String?
////
////     var asMenuItems = [SubOptionMenu]()
////     var subOptionMenus = [SubOptionMenu]()
////     var returnMenu : SubOptionMenu? = nil
////
////     var xmlString : String?
//
//
//    init(xmlString : String) {
//
//        super.init()
//        self.xmlString = xmlString
//        self.setASMenus()
//
//    }
//
//    func getObjectInfo(objectString : String , Menus :[SubOptionMenu])-> SubOptionMenu?{
//
//        for menu in Menus{
//
//            if menu.getSubOptionMenus() == nil {
//
//                if menu.getOBJNAME() == objectString{
//
//                    returnMenu = menu;
//                    break;
//                }
//            }else{
//                getObjectInfo(objectString: objectString,Menus: menu.getSubOptionMenus()!)
//            }
//        }
//        return returnMenu
//    }
//
//    func setASMenus(){
//
//        let parser = ParseXMLData(xml: self.xmlString!)
//        let jsonString = parser.parseXML()
//        print(self.xmlString!)
//
//        do {
//            let jsonData = jsonString.data(using: .utf8)
//
//            let mainMenuInfo = try JSONDecoder().decode(MenuInfo.self, from: jsonData!)
//
//
//            self.asMenuItems.removeAll()
//            self.subOptionMenus.removeAll()
//
//            if mainMenuInfo.APPLICATION?.FOLDER != nil{
//
//                let element = (mainMenuInfo.APPLICATION?.FOLDER)
//
//
//
//                switch element {
//                case .object(let object):
//
//                    let menuItem = SubOptionMenu();
//                    var subOptionMenus = [SubOptionMenu]();
//
//                    menuItem.setIcon(icon: object._icon!);
//                    menuItem.setId(id: object._id!);
//                    menuItem.setTITLE(TITLE:object.TITLE!);
//
//                    subOptionMenus = getSubMenus(jsonObject: object);
//                    menuItem.setSubOptionMenus(subOptionMenus: subOptionMenus);
//                    asMenuItems.append(menuItem);
//
//                case .array(let array):
//
//                    for object in array {
//                        let menuItem = SubOptionMenu();
//                        var subOptionMenus = [SubOptionMenu]();
//
//                        menuItem.setIcon(icon: object._icon!);
//                        menuItem.setId(id: object._id!);
//                        menuItem.setTITLE(TITLE:object.TITLE!);
//
//                        subOptionMenus = getSubMenus(jsonObject: object);
//                        menuItem.setSubOptionMenus(subOptionMenus: subOptionMenus);
//                        asMenuItems.append(menuItem);
//                    }
//
//
//                case .none:
//                    print("ok")
//
//                }
//                self.subOptionMenu = asMenuItems
//            }
//        } catch {
//
//        }
//
//    }
//
//
//    public func getSubOptionMenu()->[SubOptionMenu]?{
//
//        return (subOptionMenu);
//    }
//
//    public func getIcon()->String{
//
//        return icon!;
//    }
//
//    public func setSubOptionMenu(subOptionMenu:[SubOptionMenu]){
//
//        self.subOptionMenu = subOptionMenu;
//
//    }
//
//    public func setIcon(icon:String){
//
//        self.icon = icon;
//
//    }
//
//    public func setTitle(TITLE:String){
//
//        self.TITLE = TITLE;
//
//    }
//
//    public func getTITLE()->String{
//
//        return TITLE!;
//    }
//
//    public func getId()->String{
//
//        return id!;
//    }
//
//    public func setId(id:String){
//
//        self.id = id;
//
//    }
//
//     func getSubMenus(jsonObject : subMenuArray)->[SubOptionMenu]{
//
//        if (jsonObject.OPTION != nil){
//
//            switch jsonObject.OPTION {
//
//            case .object(let object):
//
//                let subOptionMenu = SubOptionMenu();
//                var subOptionMenus = [SubOptionMenu]();
//                subOptionMenu.setIcon(icon:object._icon! );
//                subOptionMenu.setId(id:object._id! );
//                subOptionMenu.setTITLE(TITLE: object.TITLE! );
//                subOptionMenu.setADHOC_RIGHTS(ADHOC_RIGHTS: object.ADHOC_RIGHTS!);
//                subOptionMenu.setOBJNAME(OBJNAME: object.OBJNAME!);
//                subOptionMenu.setOBJTYPE(OBJTYPE: object.OBJTYPE!);
//                subOptionMenu.setFREEZ_MENU(FREEZ_MENU: object.FREEZ_MENU!);
//                subOptionMenus.append(subOptionMenu);
//                return subOptionMenus
//
//
//            case .array(let array):
//
//                var subOptionMenus = [SubOptionMenu]();
//
//                for object in array {
//
//                    let subOptionMenu = SubOptionMenu();
//                    subOptionMenu.setIcon(icon:object._icon! );
//                    subOptionMenu.setId(id:object._id! );
//                    subOptionMenu.setTITLE(TITLE: object.TITLE! );
//                    subOptionMenu.setADHOC_RIGHTS(ADHOC_RIGHTS: object.ADHOC_RIGHTS!);
//                    subOptionMenu.setOBJNAME(OBJNAME: object.OBJNAME!);
//                    subOptionMenu.setOBJTYPE(OBJTYPE: object.OBJTYPE!);
//                    subOptionMenu.setFREEZ_MENU(FREEZ_MENU: object.FREEZ_MENU!);
//                    subOptionMenus.append(subOptionMenu);
//                }
//                return subOptionMenus
//
//            case .none:
//                print("ok")
//
//            }
//        }
//
//        if (jsonObject.FOLDER != nil){
//
//            switch jsonObject.FOLDER {
//
//            case .object(let object):
//
//                let subOptionMenu = SubOptionMenu();
//                var subOptionMenus = [SubOptionMenu]();
//
//                subOptionMenu.setIcon(icon:object._icon! );
//                subOptionMenu.setId(id:object._id! );
//                subOptionMenu.setTITLE(TITLE: object.TITLE! );
//
//                var subOptions = [SubOptionMenu]();
//                subOptions = getSubMenus(jsonObject: object);
//                subOptionMenu.setSubOptionMenus(subOptionMenus: subOptions);
//                subOptionMenus.append(subOptionMenu);
//                return subOptionMenus
//
//
//
//            case .array(let array):
//
//                var subOptionMenus = [SubOptionMenu]();
//
//                for object in array {
//
//                    let subOptionMenu = SubOptionMenu();
//
//                    subOptionMenu.setIcon(icon:object._icon! );
//                    subOptionMenu.setId(id:object._id! );
//                    subOptionMenu.setTITLE(TITLE: object.TITLE! );
//
//                    let subOptions = getSubMenus(jsonObject: object);
//                    subOptionMenu.setSubOptionMenus(subOptionMenus: subOptions);
//                    subOptionMenus.append(subOptionMenu);
//
//                }
//                return subOptionMenus
//
//
//
//            case .none:
//                print("ok")
//
//            }
//        }
//
//        return [SubOptionMenu]()
//    }
//}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
