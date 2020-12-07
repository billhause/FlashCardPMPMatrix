//
//  FlashCardPMPMatrixApp.swift
//  FlashCardPMPMatrix
//
//  Created by William Hause on 11/22/20.
//

import SwiftUI
import StoreKit

@main
struct FlashCardPMPMatrixApp: App {
    @Environment(\.scenePhase) private var scenePhase // wdh added
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) { newScenePhase in // wdh added
//            print(".onChange(of: scenePhase) called")
//            print("previousScenePhase = \(scenePhase)")
//            print("newScenePhase = \(newScenePhase)") // Equatable is passed into this callback
            
            // The system calls the `action` closure on the main thread, so avoid
            // long-running tasks in the closure. If you need to perform such tasks,
            // dispatch to a background queue:
            //   E.g. DispatchQueue.global(qos: .background).async {
            //                 // ...
            //        }
            
            switch newScenePhase {
            case .active:
                scenePhaseActive(previousScenePhase: scenePhase)

            case .inactive:
                scenePhaseInactive(previousScenePhase: scenePhase)
                
            case .background:
                scenePhaseBackground(previousScenePhase: scenePhase)
            
            @unknown default: // In case new ScenePhases are added in the future
                print("wdh unhandled newScenePhase: \(newScenePhase)")
            }
        }
    }
    
    // wdh added
    // Called when the scene becomes active (like on startup and when moving out of the background
    func scenePhaseActive(previousScenePhase: ScenePhase) {
        print("wdh scenePhaseActive() Called, previous ScenePhase was \(previousScenePhase)")
        
        // Initialize the FlashCard Matrix
        let viewContext = persistenceController.container.viewContext
        FlashCardViewModel.initializeTheMatrix(context: viewContext)
        
        // REQUEST REVIEW
        // Do at least 45 cells have text?
        print("Count of flashcards with Text is \(FlashCardViewModel.cellsWithText)")
        if FlashCardViewModel.cellsWithText >= Self.CELL_TEXT_THRESHOLD {
            // If so, increment the run count
            UserStatsEntity.getUserStatsEntity(context: viewContext).runsWithLoadedMatrix += 1
            try? viewContext.save()

            let practiceRunCount = UserStatsEntity.getUserStatsEntity(context: viewContext).runsWithLoadedMatrix
            print("practiceRunCount = \(practiceRunCount)")
            // Have there been at least 3 runs since 45 cells have had text
            if practiceRunCount > Self.PRACTICE_RUN_THRESHOLD {
                // If so, request the review
                if let windowScene = UIApplication.shared.windows.first?.windowScene {
                    SKStoreReviewController.requestReview(in: windowScene)
                }
            }
        }
    }
    
    // wdh added
    // called when the scene becomes inactive but before going into the background
    // Also called when moving out of the Background before Active is called
    func scenePhaseInactive(previousScenePhase: ScenePhase) {

        switch previousScenePhase {
        case .active:
            print("wdh scenePhaseInactive() Called, previous ScenePhase was .active")
        case .background:
            print("wdh scenePhaseInactive() Called, previous ScenePhase was .background")
        default:
            print("previous ScenePhase was not .active or .background")
        }
        
    }
    
    // wdh added
    // called when the scene moves to the background after Inactive is called
    func scenePhaseBackground(previousScenePhase: ScenePhase) {
        print("wdh scenePhaseBackground() Called, previous ScenePhase was \(previousScenePhase)")
    }
    
    // MARK: - Constants
    private static let CELL_TEXT_THRESHOLD = 45   // 45 cards must have text in them
    private static let PRACTICE_RUN_THRESHOLD = 3 // 3 runs needed after the matrix has been fleshed out before requesting review
    
}

/* // Original generated code
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
*/
