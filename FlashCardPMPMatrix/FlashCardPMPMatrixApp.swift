//
//  FlashCardPMPMatrixApp.swift
//  FlashCardPMPMatrix
//
//  Created by William Hause on 11/22/20.
//

import SwiftUI

@main
struct FlashCardPMPMatrixApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
