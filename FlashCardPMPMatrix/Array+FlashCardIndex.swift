//
//  Array+FlashCardIndex.swift
//  FlashCardPMPMatrix
//
//  Created by William Hause on 12/1/20.
//

import Foundation
import CoreData

extension Array where Element: FlashCardEntity {
//extension FetchedResults {
    func indexByRowColumn(row: Int16, col: Int16) -> Int? {
        for index in 0..<self.count {
            if (self[index].row == row) && (self[index].column == col) {
                return index
            }
        }
        return nil // No match found - This should never happen
    }
}


