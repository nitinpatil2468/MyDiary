//
//  Diary_Entry+CoreDataProperties.swift
//  My Diary
//
//  Created by Nitin Patil on 06/12/20.
//
//

import Foundation
import CoreData


extension Diary_Entry {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Diary_Entry> {
        return NSFetchRequest<Diary_Entry>(entityName: "Diary_Entry")
    }

    @NSManaged public var title: String?
    @NSManaged public var timeStamp: String?
    @NSManaged public var photoUrl: String?
    @NSManaged public var detail: String?
    @NSManaged public var dateStamp: String?

}

extension Diary_Entry : Identifiable {

}
