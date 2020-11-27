//
//  FlashCardViewModel.swift
//  FlashCardPMPMatrix
//
//  Created by William Hause on 11/25/20.
//
// MVVM - VIEW-MODEL class

import CoreData

class FlashCardViewModel {
 
    
    // MARK: - Access to the Model

    
    
    // MARK: - Intent(s) - Views ask the ViewModel to do things with the model
    // These are the things that the Views can do to change the model
    
    
    static func initializeTheMatrix(context: NSManagedObjectContext) {
        // Load each FlashCard in the matrix or create it if it doesn't already exists
        print("LOADING FlashCardEntities...")
        for currentRow in 0..<rowCount {
            for currentColumn in 0..<columnCount {
                let theFlashCardEntity = FlashCardEntity.withRowColumn(row: currentRow, column: currentColumn, context: context)
            }
        }
        
    }
    
    // MARK: - Constants
    
    // The PMI Matrix 6th edition has 6 columns and 11 rows (includeing header column and row)
    static let rowCount: Int16 = 6
    static let columnCount: Int16 = 11
    

}
