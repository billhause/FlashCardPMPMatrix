//
//  FlashCardEntity.swift
//  FlashCardPMPMatrix
//
//  Created by William Hause on 11/25/20.
//

import CoreData


// FlashCardEntity is like a little "View-Mode" in MVVM
// Class - This is a class, not a struct
//
// NOTE: Entities are made 'Identifiable' when XCode creates the class - it puts on a stub.  Adding Comparable allows them to be used in dictionaries and sets etc.
extension FlashCardEntity: Comparable {
    public static func < (lhs: FlashCardEntity, rhs: FlashCardEntity) -> Bool {
        if lhs.row != rhs.row {
            return lhs.row < rhs.row
        } else {
            return lhs.column < rhs.column
        }
    }

    // If the requested item doesn't exist, then create one and return it.
    static func withRowColumn(row: Int16, column: Int16, context: NSManagedObjectContext) -> FlashCardEntity {
        // see https://www.youtube.com/watch?v=yOhyOpXvaec at 39:30
        // Look up the row,column in Core Data
        // If found, return it
        // If not found, create one and return it.
        let request = NSFetchRequest<FlashCardEntity>(entityName: "FlashCardEntity")
        request.predicate = NSPredicate(format: "row = %@ AND column = %@", NSNumber(value: row), NSNumber(value: column))
        
        // sortDescriptors line May not be needed!
        request.sortDescriptors = [NSSortDescriptor(key: "row", ascending: true), NSSortDescriptor(key: "column", ascending: true)]
        
        // Objects are returned in an array - Returns an empty array if no FlashCardEntities with the row,column are found
        let flashCardEntities = try? context.fetch(request) // Crashes Here wdhx
        
        // If we found one, return it.  IF the returned array is empty then we need to create one.
        if let flashCardEntity = flashCardEntities!.first {
            // if found, return it
            print("Found Existing FlashCardEntity for row: \(row), column: \(column)")
            return flashCardEntity
        } else {
            // If no flashCardEntity was found, create one
            let flashCardEntity = FlashCardEntity(context: context)
            flashCardEntity.row = row
            flashCardEntity.column = column
            flashCardEntity.text = "" // Initialize to empty string
            flashCardEntity.isHidden = true
            flashCardEntity.id = UUID()
            
            flashCardEntity.objectWillChange.send() // Needed? Cause any views looking at this Entity to redraw themselves
            
            print("created FlashCardEntity for row: \(row), column: \(column)")
            
            // Save the created FlashCardEntity
            try? context.save() // Not handling the try/catch because there's nothing I would be able to do about it.
            
            return flashCardEntity
        }
    }
    
    
}
