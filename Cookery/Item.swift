//
//  Item.swift
//  Cookery
//
//  Created by Bob Brand on 12/30/18.
//  Copyright © 2018 bobbrand. All rights reserved.
//

import UIKit

class Item: NSObject, NSCoding {
    var dishName: String
    var dishCategory: String
    let dateCreated: Date
    let itemKey: String
    
    // MARK: - Initializers
    init(dishName: String, dishCategory: String) {
        self.dishName = dishName
        self.dishCategory = dishCategory
        self.dateCreated = Date()
        self.itemKey = UUID().uuidString
        
        super.init()
    }
    
    //  This is just for testing.   Not using it.
    convenience init (random: Bool = false ) {
        if random {
            let dishNames = ["Pizza", "Salsa that Changed Your Life", "Lobster Bisque"]
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
    
    // MARK: Archiving Methods
    func encode(with aCoder: NSCoder) {
        aCoder.encode(dishName, forKey: "dishName")
        aCoder.encode(dishCategory, forKey: "dishCategory")
        aCoder.encode(dateCreated, forKey: "dateCreated")
        aCoder.encode(itemKey, forKey: "itemKey")
    }
    
    required init(coder aDecoder: NSCoder) {
        dishName = aDecoder.decodeObject(forKey: "dishName") as! String
        dishCategory = aDecoder.decodeObject(forKey: "dishCategory") as! String
        dateCreated = aDecoder.decodeObject(forKey: "dateCreated") as! Date
        itemKey = aDecoder.decodeObject(forKey: "itemKey") as! String
        
        super.init()
    }
}

