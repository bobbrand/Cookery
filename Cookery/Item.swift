//
//  Item.swift
//  Cookery
//
//  Created by Bob Brand on 12/30/18.
//  Copyright © 2018 bobbrand. All rights reserved.
//

import UIKit

class Item: NSObject {
    var dishName: String
    var dishCategory: String
    let dateCreated: Date
    
    init(dishName: String, dishCategory: String) {
        self.dishName = dishName
        self.dishCategory = dishCategory
        self.dateCreated = Date()
        
        super.init()
    }
    
    convenience init (random: Bool = false ) {
        if random {
            let dishNames = ["Pizza", "Salsa of Life", "Lobster Bisque"]
            let dishCategory = ["Bread", "Salsas", "Main Dishes"]
            
            var idx = arc4random_uniform( UInt32(dishNames.count))
            let randomDish = dishNames[Int(idx)]
            
            idx = arc4random_uniform( UInt32(dishCategory.count))
            let randomCategory = dishCategory[Int(idx)]
            
            self.init(dishName: randomDish, dishCategory: randomCategory)
        } else {
            self.init(dishName: "", dishCategory: "")
        }
    }
}

