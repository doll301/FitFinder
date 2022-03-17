//
//  WardrobeView.swift
//  FitFinder
//
//  Created by Ellen Doll on 3/16/22.
//
 
import SwiftUI

/* Will hold a grid view of all articles of clothing. Should have ability to
   sort by article.*/
// TODO: Set up grid view

struct WardrobeArticleView: View {
    var article: Article?
    @EnvironmentObject private var wardrobe: Wardrobe
    
    var body: some View {
        HStack {
                ZStack {
                    if let art = article {
                        Text(art.name)
                    }
                    
                }
        }
    }
    
}

struct WardrobeView: View {
    @EnvironmentObject private var wardrobe: Wardrobe
    
    var body: some View {
        VStack {
            Text("Your Wardrobe")
                .padding()
            // List of clothes that is generated (RUDIMENTARY)
            ScrollView {
                VStack {
                    // TODO: Sort the list based on enum
                    ForEach(wardrobe.articles(), id:\.self) {
                        article in
                        if let art = article {
                            WardrobeArticleView(article: art).environmentObject(Wardrobe())
                        }
                         
                    }
                }
            }
        }
    }
}
