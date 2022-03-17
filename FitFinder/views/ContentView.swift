//
//  ContentView.swift
//  FitFinder
//
//  Created by Ellen Doll on 3/14/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var wardrobe: Wardrobe
    @EnvironmentObject private var pickerList: PickerList
    // Variable that allows us to make a particular tab the default
    @State private var selection = 2
    
    var body: some View {
        TabView(selection: $selection) {
            WardrobeView().environmentObject(Wardrobe()).tabItem {
                Text("See Wardrobe").font(.headline)
            }.tag(1)
            // TODO: Make this the default tab somehow
            StackedPickerView().environmentObject(PickerList()).environmentObject(Wardrobe()).tabItem {
                Text("Create a Fit").font(.headline)
            }.tag(2)
            AddArticleView().environmentObject(Wardrobe()).tabItem {
                Text("Add an Article").font(.headline)
            }.tag(3)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().environmentObject(PickerList()).environmentObject(Wardrobe())
        }
    }
}
