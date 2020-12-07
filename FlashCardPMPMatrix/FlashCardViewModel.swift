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
    
    
    // Count the Cells with Text needed for requesting a review
    static func initializeTheMatrix(context: NSManagedObjectContext) {
        // Load each FlashCard in the matrix or create it if it doesn't already exists
        print("LOADING FlashCardEntities...")
        cellsWithText = 0
        for currentRow in 0..<rowCount {
            for currentColumn in 0..<columnCount {
                let theFlashCardEntity = FlashCardEntity.withRowColumn(row: Int16(currentRow), column: Int16(currentColumn), context: context)
                let cardText = theFlashCardEntity.text ?? ""
                if cardText.count > 0 {
                    cellsWithText += 1 // Increment Count
                }
//                theFlashCardEntity.text = "row: \(currentRow)\ncol: \(currentColumn)"
            }
        }
//        print("Count of Cells with Text is \(cellsWithText)")
        try? context.save()
        
    }
    
    // MARK: - Constants
    
    // The PMI Matrix 6th edition has 6 columns and 11 rows (includeing header column and row)
    static let rowCount: Int = 11
    static let columnCount: Int = 6
    static var cellsWithText: Int = 0 // Number of cells with text, needed for requesting a review
    

}
