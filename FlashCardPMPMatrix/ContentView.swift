//
//  ContentView.swift
//  FlashCardPMPMatrix
//
//  Created by William Hause on 11/22/20.
//
//  Memorize the 49 Processes in the 5 "Process Groups" and 9 "Knowledge Areas" in PMBOK 6th Edition
//    https://www.examspm.com/2018/08/07/memorize-the-49-processes-pmbok-6th-edition/
//    Key Words: PMP,Exam,PMI,PMBOK,Process,Groups,Group,Knowledge,Areas,Matrix,Project,Management,Study,Practice
//
// Tutorial to create this PizzaRestaurant Core Data Demo:
//    https://blckbirds.com/post/core-data-and-swiftui/
//
//  1 - Creat project with CoreData and SwiftUI boxes checked
//  2 - Remove the default 'Item' entity code from the "ContentView.swift" file leaving only the normal 'ContenView' (one line calling Text("Hello World") and 'ContenView_Previews' (one line calling ContenView()) structs
//  3 - Delete the 'Item' entity from the '.xcdatamodelId' file
//  4 - Add your new entity E.g. 'Order' for this tutorial to the '.xcdatamodelId' file
//  5 - Replace 'Item' with your new 'Order' entity in the preview for loop in 'Persistence.swift'
//      Add the appropriate attributes to the 'Order' entity
//  6 - Generate the 'Order+CoreDataClass.swift' and 'Order+CoreDataProperties.swift' files as follows
//    a. Select the '.xcdatamodelId' file
//    b. select the 'Order' entity
//    c. From the menu, select Editor->'Create NSManagedObject Subclass...' to generate the two .swift files
//  7 - Open the '.xcdatamodelId' file and click on the 'Order' entity
//  8 - in the Attributes inspector set 'codegen' to say 'Manual/None'
//  9 - Open the 'Order+CoreDataProperties.swift' file and remove the '?' from the end of the attributes
//  10 - At this point the tutorial shows how to create an 'enum' for the order status attribute so that strigns don't need to be used.  I'm not listing those steps here but you create getters and setters to access and convert from enum to string
//  11 - Update the preview code in 'ContentView.swift' by changing the 'ContentView()' call to say
//      ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//      ContentView has an environment attributes called '.managedObjectContext' that tells it the viewContext to use.
// NEXT Continue in the tutorial starting at the "Composing Our UI" section about 1/3 way down
//
//  20 - Add "@Environment(\.managedObjectContext) private var viewContext" to views that load/save data
//  21 - Add "@FetchRequest" property and 'FetchedResults<Order>'  needed to load data
//
// =============
//
//  Localization Internationalization
//    - video here to localize this app: https://www.youtube.com/watch?v=oXa4en79CHg
//    - Chinese is the number one language to localize your iOS app into, followed by Japanese, Korean, German, French, Spanish, Italian and Malay
//
// Localization i18n - Translations of Common Terms: https://www.icanlocalize.com/site/tutorials/mobile-app-keywords/
//
// DIRECTIONS: How to create an app preview with iMovie
//    https://developer.apple.com/support/imovie/
//
// Icon Builder Website:
//  https://appicon.co
//
// Screen Shots
//   - 4 shots using iPhone "8 Plus" simulator
//   - 4 shots using iPhone "11 Pro Max" simulator
//
// Game Center Leader Boards - Apple Docs  https://developer.apple.com/library/archive/documentation/NetworkingInternet/Conceptual/GameKit_Guide/Introduction/Introduction.html#//apple_ref/doc/uid/TP40008304
//
//  Some Leaderboard Tutorial
//    Use this example: https://medium.com/swlh/how-to-integrate-gamekit-ios-794061428197
//    Use this Video Tutorial: https://www.google.com/search?q=game+center+leaderboard+swift+tutorial&newwindow=1&sxsrf=ALeKk01Bg1uOrX6PizEaPXXrfCtJHlbZBA:1600966767114&source=lnms&sa=X&ved=0ahUKEwisus37oYLsAhWYXM0KHV0kBV04ChD8BQgKKAA&biw=1688&bih=1236&dpr=2#kpvalbx=_gdBsX-TSAtaDtQaHtpDoBQ42
//   Another Leaderboard Example:  https://code.tutsplus.com/tutorials/game-center-and-leaderboards-for-your-ios-app--cms-27488
//
//
// Font List: http://iosfonts.com
//
// SpriteKit Example: Breakout Game: http://www.brianadvent.com/simple-ios-breakout-game-with-spritekit/
//   1 - Remove all three Demo functions from GameScene.swift - NOTE: The demo functions that xcode currently creates have different names now
//       a. didMoveToView
//       b. touchesBegan
//       c. update
//   2 - Add 2 Init methods to GameScene.swift
//       a. override init(size: CGSize) {
//       b. required init?(coder aDecoder: NSCoder) {
//   3 - GameViewController.swift Changes
//       a. Remove contents of viewDidLoad() except for the call to super.viewDidLoad()
//       b. Add function: viewWillLayoutSubviews() - this is a better place to initialize the game scene because we don't know the screen size in viewDidLoad but do know it in viewWillLayoutSubviews
//       c.
//
// Stanford Lecture 1: SwiftUI - Concentration Game
//   - https://www.youtube.com/watch?v=jbtqIBpUG7g&t=3s
//
//
//
//  Core Data Tutorial: https://www.youtube.com/watch?v=O7u9nYWjvKk
//    - Create element, Load, Save and Delete ends at minute 49
//    - Filtering and Sorting starting at minute 51
//    - Relationships between Entities (Minute 59) - Eg. an entity that has an array of another entity
//
//  vvvv Excelent Core Data Stanford Lecture Tutorial vvvv
//  Core Data Stanford Class Tutorial (June 2020) 1:33:00 - Explains how to use Core Data and that Core Data/
//    is an object oriented database - June 22, 2020 - Uses 'FlightAware' to get flight data
//    YouTube: https://www.youtube.com/watch?v=yOhyOpXvaec
//      - Setup 6:00
//      - 22:00 - Automatically generated code to set '.environment(\.managedObjectContect, context)
//      - 24:00 - Entity Creation
//      - 30:50 - Setting Entity Relationships
//      - 42:00 - Loading (Fetching) Data with a predicate query string
//      - 52:25 - Force refresh with '.objectWillChange.send()'
//      - 54:00-59 - Create getters/seters for optional fields to avoid crashes
//      - 1:33:00 - Adding @FetchRequest() at top of struct is heart of automatic updates E.g.
//              @FetchRequest var flights: FetchResults<Flight>
//      -
//
//
//   CORE DATA PLAN -
//      - Create method to Load requested Entity or create one and return it if the requested one doesn't already exist. (46:00 in Stanford lecture 12)
//      - Use 'RoundedRectangle() view to hold each cell
//
//
//


import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        MatrixView().padding(5)
    }
}

struct MatrixView: View {
   @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        VStack(spacing: 5) {
            ForEach(0..<FlashCardViewModel.rowCount) { rowNumber in
                // NOTE: Breaking this out into function call to avoid compiler error "The compiler is unable to
                // type-check this expression in reasonable time; try breaking up the expression into distinct sub-expressions"
                hStackRow(rowNumber: Int16(rowNumber))
            }
        }
    }

    // Create row of cards for the specified row number
    func hStackRow(rowNumber: Int16) -> some View {
        HStack(spacing: 5) {
            ForEach(0..<FlashCardViewModel.columnCount) { colNumber in
                Group { // COLOR Based on Row, Column
                    
                    if (colNumber == 0) && (rowNumber == 0) { // ORIGIN CELL
                        CardView(row: rowNumber, column: Int16(colNumber), fillColor: originCellColor)
                            .onTapGesture(count:2) {
                                print("Double Tap1")
                            }
                            .onTapGesture(count:1) {
                                cardTapHandler(row: rowNumber, col: Int16(colNumber))
                            }
                    }
                    
                    else if (colNumber == 0) && (rowNumber != 0) { // ROW HEADERS (First Column)
                        CardView(row: rowNumber, column: Int16(colNumber), fillColor: rowHeaderColor)
                            .onTapGesture(count:2) {
                                print("Double Tap2")
                            }
                            .onTapGesture(count:1) {
                                cardTapHandler(row: rowNumber, col: Int16(colNumber))
                            }
                    }
                    
                    else if (colNumber != 0) && (rowNumber == 0) { // COLUMN HEADERS (First Row)
                        CardView(row: rowNumber, column: Int16(colNumber), fillColor: columnHeaderColor)
                            .onTapGesture(count:2) {
                                print("Double Tap3")
                            }
                            .onTapGesture(count:1) {
                                cardTapHandler(row: rowNumber, col: Int16(colNumber))
                            }
                    }

                    else if (colNumber != 0) && (rowNumber != 0) { // BODY CELLS
                        CardView(row: rowNumber, column: Int16(colNumber), fillColor: tableCellColor)
                            .onTapGesture(count:2) {
                                print("Double Tap4")
                            }
                            .onTapGesture(count:1) {
                                cardTapHandler(row: rowNumber, col: Int16(colNumber))
                            }
                    }
                }
            }
        }
//        .padding(2)
        .font(Font.system(size: 10.0))
    }
    
    
    func cardTapHandler(row: Int16, col: Int16) {
        print("Card Tapped! row: \(row), col: \(col)")
        
        let flashCardEntity = FlashCardEntity.withRowColumn(row: row, column: col, context: viewContext)
        
        // Flip card
        flashCardEntity.isHidden = !flashCardEntity.isHidden
        
        flashCardEntity.text = "☃️ \nrow: \(row), col: \(col) \nRow2\nrow3\nRow4\nrow5"

//        flashCardEntity.objectWillChange.send() // Cause Views to update Stanford Lesson 12 at 52:20
        
        try? viewContext.save()
    }

    
    // MARK: - Constants
    let columnHeaderColor: Color = Color.init(red: 0.7, green: 0.9, blue: 1.0)
    let rowHeaderColor:    Color = Color.init(red: 0.9, green: 1.0, blue: 0.9)
    let originCellColor:   Color = Color.init(red: 1.0, green: 1.0, blue: 1.0)
    let tableCellColor:    Color = Color.init(red: 0.9, green: 0.9, blue: 0.9)

}

struct CardView: View {
    // vvvvvv Xcode - Based on Code Generated by XCode for Core Data vvvvvvv
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \FlashCardEntity.row, ascending: true),
                          NSSortDescriptor(keyPath: \FlashCardEntity.column, ascending: true)],
        animation: .default)
    private var flashCardEntities: FetchedResults<FlashCardEntity>
    // ^^^^^^ Xcode - Based on Code Generated by XCode for Core Data ^^^^^^^

    let row: Int16
    let column: Int16
    let fillColor: Color // use Color.init(red: 0.9, green: 0.9, blue: 1.0)
    
    
    // NOTE: This view relies on the FlashCardEntities being sorted by row
    // and column to update the correct cell
    var body: some View {
        
        ForEach(flashCardEntities, id: \.self) { flashCardEntity in
            if (flashCardEntity.row == row) && (flashCardEntity.column == column) {
                if (!flashCardEntity.isHidden) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5.0).fill(fillColor)
                        RoundedRectangle(cornerRadius: 5.0).stroke(lineWidth:1)
                        Text("\(flashCardEntities[Int(column + row*Int16(FlashCardViewModel.columnCount))].text!)")
                            .padding(2)
                            .font(.system(size: 12)) // Maximum font size to use
                            .minimumScaleFactor(0.01) // Minimum size to reduce to fit view
                    }.transition(.scale)

                } else {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5.0).fill(fillColor)
                        RoundedRectangle(cornerRadius: 5.0).stroke(lineWidth:1)
                        Text("?").font(.system(size:50)).minimumScaleFactor(0.01)
                    } .transition(.scale)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}


/*
// FLASH CARD LIST VIEW
//
 
 import SwiftUI
 import CoreData

 struct ContentView: View {
     @Environment(\.managedObjectContext) private var viewContext

     @FetchRequest(
         sortDescriptors: [NSSortDescriptor(keyPath: \FlashCardEntity.text, ascending: true)],
         animation: .default)
     private var flashCardEntities: FetchedResults<FlashCardEntity>

     var body: some View {
         List {
             ForEach(flashCardEntities) { flashCardEntity in
                 Text("FlashCardEntity \(flashCardEntity.text!), at column: \(flashCardEntity.column), row: \(flashCardEntity.row)")
             }
             .onDelete(perform: deleteFlashCardEntities)
         }
         .toolbar {
             #if os(iOS)
             EditButton()
             #endif

             Button(action: addItem) {
                 Label("Add Item", systemImage: "plus")
             }
         }
     }

     private func addItem() {
         withAnimation {
             let newFlashCardEntity = FlashCardEntity(context: viewContext)
             newFlashCardEntity.row = 0
             newFlashCardEntity.column = 0
             newFlashCardEntity.text = "FlashCardEntity added at \(Date())"
                 //.timestamp = Date()

             do {
                 try viewContext.save()
             } catch {
                 // Replace this implementation with code to handle the error appropriately.
                 // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 let nsError = error as NSError
                 fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
             }
         }
     }

     private func deleteFlashCardEntities(offsets: IndexSet) {
         withAnimation {
             offsets.map { flashCardEntities[$0] }.forEach(viewContext.delete)

             do {
                 try viewContext.save()
             } catch {
                 // Replace this implementation with code to handle the error appropriately.
                 // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 let nsError = error as NSError
                 fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
             }
         }
     }
 }

 struct ContentView_Previews: PreviewProvider {
     static var previews: some View {
         ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
     }
 }

 */
