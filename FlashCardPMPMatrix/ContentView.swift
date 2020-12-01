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
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        MatrixView()
    }
        
}

struct MatrixView: View {
    
    var body: some View {
        VStack {
            ForEach(0..<FlashCardViewModel.rowCount) { theRow in
                hStackRow(rowNumber: Int16(theRow))
            }
        }
    }

    // Create row of cards for the specified row number
    func hStackRow(rowNumber: Int16) -> some View {
        HStack {
            ForEach(0..<FlashCardViewModel.columnCount) { colNumber in
                Group {
                    if (colNumber == 0) && (rowNumber == 0) { // ORIGIN CELL
                        CardView(row: rowNumber, column: Int16(colNumber), fillColor: originCellColor) .onTapGesture {
                            print("Card Tapped row: \(rowNumber), column: \(colNumber)")
                        }
                    }
                    
                    else if (colNumber == 0) && (rowNumber != 0) { // ROW HEADERS (First Column)
                        CardView(row: rowNumber, column: Int16(colNumber), fillColor: rowHeaderColor) .onTapGesture {
                            print("Card Tapped row: \(rowNumber), column: \(colNumber)")
                        }
                    }
                    
                    else if (colNumber != 0) && (rowNumber == 0) { // COLUMN HEADERS (First Row)
                        CardView(row: rowNumber, column: Int16(colNumber), fillColor: columnHeaderColor) .onTapGesture {
                            print("Card Tapped row: \(rowNumber), column: \(colNumber)")
                        }
                    }

                    else if (colNumber != 0) && (rowNumber != 0) { // BODY CELLS
                        CardView(row: rowNumber, column: Int16(colNumber), fillColor: tableCellColor) .onTapGesture {
                            print("Card Tapped row: \(rowNumber), column: \(colNumber)")
                        }
                    }
                }
            }
        }
        .padding(2)
//        .foregroundColor(Color.blue)
        .font(Font.system(size: 10.0))
    }
    
    // MARK: - Constants
    let columnHeaderColor: Color = Color.init(red: 0.7, green: 0.9, blue: 1.0)
    let rowHeaderColor:    Color = Color.init(red: 0.9, green: 1.0, blue: 0.9)
    let originCellColor:   Color = Color.init(red: 1.0, green: 1.0, blue: 1.0)
    let tableCellColor:    Color = Color.init(red: 0.9, green: 0.9, blue: 0.9)

}

struct CardView: View {
    @Environment(\.managedObjectContext) private var viewContext
    let row: Int16
    let column: Int16
    let fillColor: Color // use Color.init(red: 0.9, green: 0.9, blue: 1.0)
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5.0).fill(fillColor)
            RoundedRectangle(cornerRadius: 5.0).stroke(lineWidth:1)
            Text("\(FlashCardEntity.withRowColumn(row: row, column: column, context: viewContext).text ?? "")")
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
