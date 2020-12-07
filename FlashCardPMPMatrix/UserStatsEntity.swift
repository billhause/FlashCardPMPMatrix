//
//  UserStatsEntity.swift
//  FlashCardPMPMatrix
//
//  Created by William Hause on 12/7/20.
//

import CoreData

extension UserStatsEntity {
    
    // If one exists, return it, otherwise create one and return it
    static func getUserStatsEntity(context: NSManagedObjectContext) -> UserStatsEntity {
        let request = NSFetchRequest<UserStatsEntity>(entityName: "UserStatsEntity")
        let userStatsEntities = try? context.fetch(request)
        
        // If we find one, return it.  Otherwise create one and return it
        if let userStatsEntity = userStatsEntities!.first {
            return userStatsEntity
        } else {
            let userStatsEntity = UserStatsEntity(context: context)
            userStatsEntity.runsWithLoadedMatrix = 0
            try? context.save()
            return userStatsEntity
        }
        
    }
}


