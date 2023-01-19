//
//  Place+CoreDataProperties.swift
//  GuideBook App
//
//  Created by Zahraa Zuhaier L on 05/09/2021.
//
//

import Foundation
import CoreData


extension Place {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Place> {
        return NSFetchRequest<Place>(entityName: "Place")
    }

    @NSManaged public var address: String?
    @NSManaged public var imageName: String?
    @NSManaged public var lat: Double
    @NSManaged public var long: Double
    @NSManaged public var name: String?
    @NSManaged public var summary: String?
    @NSManaged public var note: NSSet?

}

// MARK: Generated accessors for note
extension Place {

    @objc(addNoteObject:)
    @NSManaged public func addToNote(_ value: Note)

    @objc(removeNoteObject:)
    @NSManaged public func removeFromNote(_ value: Note)

    @objc(addNote:)
    @NSManaged public func addToNote(_ values: NSSet)

    @objc(removeNote:)
    @NSManaged public func removeFromNote(_ values: NSSet)

}

extension Place : Identifiable {

}
