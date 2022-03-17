//
//  PickerList.swift
//  FitFinder
//
//  Created by Ellen Doll on 3/14/22.
//

import Foundation
import SwiftUI

/* The PickerList object will be displayed at the main screen of the app.
   A PickerList is a list of SwipeBoxes, which are the windows that are
   stacked on top of each other that display particular categories of
   the your articles from your wardrobe and allow you to swipe through them
   (hence the name). The boxWidth and boxHeight (dimensions that will be used
   in frame) will be determined by their category. */

struct SwipeBox: Hashable {
    var category: Category
    var boxWidth: CGFloat {
        switch category {
        case .Hat:
            return 120
        case .Hijab:
            return 120
        case .Glasses:
            return 150
        case .Top:
            return 200
        case .Pants:
            return 175
        case .Socks:
            return 125
        case .Shoes:
            return 130
        
        }
    }
    var boxHeight: CGFloat {
        switch category {
        case .Hat:
            return 120
        case .Hijab:
            return 120
        case .Glasses:
            return 75
        case .Top:
            return 200
        case .Pants:
            return 200
        case .Socks:
            return 125
        case .Shoes:
            return 125
        }
    }
} 

class PickerList: ObservableObject {
    @Published private var _swipeBoxes: [SwipeBox]
    @Published private var _selection: Int = -1
    
    init() {
        _swipeBoxes = []
        _swipeBoxes.append(SwipeBox(category: .Top))
        _swipeBoxes.append(SwipeBox(category: .Pants))
        _swipeBoxes.append(SwipeBox(category: .Shoes))
    }
    
    func addSwipeBox(swipeBox: SwipeBox) {
        var containsCategory = false
        for i in _swipeBoxes {
            if i.category == swipeBox.category {
                containsCategory = true
            }
        }
        if !containsCategory {
            _swipeBoxes.append(swipeBox)
            
        }
    }
    
    func swipeBoxes() -> [SwipeBox] {
        return _swipeBoxes
    }
    
    func select(_ i: Int) {
        _selection = i
    }
    
    func atIndex(_ i: Int) -> SwipeBox? {
        if i < _swipeBoxes.count {
            return _swipeBoxes[i]
        } else {
            return nil
        }
    }
}
