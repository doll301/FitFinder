//
//  Wardrobe.swift
//  FitFinder
//
//  Created by Ellen Doll on 3/14/22.
//

import Foundation

/* Wardrobe object will store all the articles of clothing that have been added
   by the user. Article struct represents a single article of clothing. Image property
   will be added later.*/ 
// TODO: Add image property

enum Category: String, CaseIterable {
    case Hat
    case Hijab
    case Glasses
    case Top
    case Pants
    case Socks
    case Shoes
    
}

struct Article: Hashable {
    var name: String
    var category: Category
}

class Wardrobe: ObservableObject {
    @Published private var _articles: [Article]
    
    init() {
        _articles = []
    }
    
    func addArticle(article: Article) {
        _articles.append(article)
    }
    
    func articles() -> [Article] {
        return _articles
    }
    
    
}
