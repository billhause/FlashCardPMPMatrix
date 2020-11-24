//
//  FlashCardEntity+CoreDataProperties.swift
//  FlashCardPMPMatrix
//
//  Created by William Hause on 11/24/20.
//
//

import Foundation
import CoreData


extension FlashCardEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FlashCardEntity> {
        return NSFetchRequest<FlashCardEntity>(entityName: "FlashCardEntity")
    }

    @NSManaged public var column: Int16
    @NSManaged public var isHidden: Bool
    @NSManaged public var row: Int16
    @NSManaged public var text: String?

}

extension FlashCardEntity : Identifiable {

}
