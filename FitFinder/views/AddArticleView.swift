//
//  AddArticleView.swift
//  FitFinder
//
//  Created by Ellen Doll on 3/16/22.
//

import SwiftUI

/* Will be the view for image capture. Will also handle adding articles to
 wardrobe environment object.*/

/*TODO: Before camera functionality: create trivial view for creating article objects
 and adding them to wardrobe */
//TODO: Implement camera functionality

struct AddArticleView: View {
    @EnvironmentObject private var wardrobe: Wardrobe
    @State private var articleCategory: Category?
    @State private var showActionSheet: Bool = false
    @State private var articleName: String = String()
    
    var body: some View {
        VStack {
            Divider()
            Text("Add an article of clothing: ").font(.headline).padding(.top, 7)
            Button( (articleCategory != nil) ? articleCategory!.rawValue : "Select article category") {showActionSheet = true
            }.actionSheet(isPresented: $showActionSheet) {
                // Creates the list of buttons for the action sheet (based on the Category enum)
                var categoryList: [ActionSheet.Button] = []
                for cat in Category.allCases {
                    categoryList.append(
                        .default(Text(cat.rawValue)) {
                            articleCategory = cat
                        }
                    )
                }
                return ActionSheet(
                    title: Text("Select article category"),
                    message: Text("Please choose from the following:"),
                    buttons: categoryList)
            }.padding(5)
            TextField("Give this article of clothing a name", text:$articleName){}.padding() 
            // Button to add a new Article
            Button("+") {
                if let cat = articleCategory {
                    // Adding the actual Article
                    let article = Article(name: articleName, category: cat)
                    wardrobe.addArticle(article: article)
                    // Sets State variable to nil after Article is added
                    articleName = String()
                    
                    // Sets State variable to nil after Article is added
                    articleCategory = nil
                    print(wardrobe.articles())
                }
            }
            Divider()
            
        }
    }
}
