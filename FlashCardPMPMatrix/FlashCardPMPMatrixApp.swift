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
        FlashCardViewModel.initializeTheMatrix(context: persistenceController.container.viewContext)
        
//        SKStoreReviewController.requestReview() // wdh - This is depricated as of iOS 14
        if let windowScene = UIApplication.shared.windows.first?.windowScene {
            SKStoreReviewController.requestReview(in: windowScene)
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
