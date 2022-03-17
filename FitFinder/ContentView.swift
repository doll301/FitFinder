//
//  ContentView.swift
//  FitFinder
//
//  Created by Ellen Doll on 3/14/22.
//

import SwiftUI

/* Shows the actual invidiual swipe box. Will change DRASTICALLY after implementing
   camera functionality, this is currently just a placeholder. */
struct SwipeBoxView: View {
    var swipeBox: SwipeBox?
    @EnvironmentObject private var wardrobe: Wardrobe
    @EnvironmentObject private var pickerList: PickerList
    
    var body: some View {
        HStack {
                ZStack {
                    if let box = swipeBox {
                        Rectangle().foregroundColor(.white).border(.black, width: 5).cornerRadius(10.0).frame(width: box.boxWidth, height: box.boxHeight, alignment: .center)
                        Text(box.category.rawValue).foregroundColor(.black)

                    }
                    
                }
        }
    }
    
}

/* View for button/action sheet where we can add new SwipeBoxes */
struct AddPickerView: View {
    //@EnvironmentObject private var wardrobe: Wardrobe
    @EnvironmentObject private var pickerList: PickerList
    @State private var pickerCategory: Category?
    @State private var selectCategory: Bool = false
    
    var body: some View {
        VStack {
            Divider()
            Text("Add category to browse: ").font(.headline).padding(.top, 7)
            Button( (pickerCategory != nil) ? pickerCategory!.rawValue : "Select article category") {selectCategory = true
            }.actionSheet(isPresented: $selectCategory) {
                // Creates the list of buttons for the action sheet (based on the Category enum)
                var categoryList: [ActionSheet.Button] = []
                for cat in Category.allCases {
                    categoryList.append(
                        .default(Text(cat.rawValue)) {
                            pickerCategory = cat
                        }
                    )
                }
                return ActionSheet(
                    title: Text("Select article category"),
                    message: Text("Please choose from the following:"),
                    buttons: categoryList)
            }.padding(5)
            // Button to add a new SwipeBox
            Button("+") {
                if let cat = pickerCategory {
                    // Adding the actual SwipeBox
                    let swipeBox = SwipeBox(category: cat)
                    pickerList.addSwipeBox(swipeBox: swipeBox)
                    // Sets State variable to nil after SwipeBox is added
                    pickerCategory = nil
                }
            }
            
        }
    }
}


// View where the stacked list of SwipeBoxes is actually shown
struct StackedPickerView: View {
    //@EnvironmentObject private var wardrobe: Wardrobe
    @EnvironmentObject private var pickerList: PickerList
    
    var body: some View {
        VStack {
            Text("FitFinder")
                .padding()
            // List of SwipeBoxes that is generated
            ScrollView {
                VStack {
                    // TODO: Sort the list based on enum
                    ForEach(pickerList.swipeBoxes(), id:\.self) {
                        swipeBox in
                        if let box = swipeBox {
                            SwipeBoxView(swipeBox: box).environmentObject(PickerList())
                        }
                    }
                }
            }
            // View for adding a new SwipeBox
            AddPickerView().environmentObject(pickerList)
        }
    }
    
}

struct ContentView: View {
    //@EnvironmentObject private var wardrobe: Wardrobe
    @EnvironmentObject private var pickerList: PickerList
    
    var body: some View {
        TabView {
            WardrobeView().tabItem {
                Text("See Wardrobe")
            }
            // TODO: Make this the default tab somehow
            StackedPickerView().environmentObject(PickerList()).tabItem {
                Text("Create a Fit")
            }
            AddArticleView().tabItem {
                Text("Add an Article")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().environmentObject(PickerList())
        }
    }
}
