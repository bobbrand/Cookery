//
//  ItemStore.swift
//  Cookery
//
//  Created by Bob Brand on 12/30/18.
//  Copyright © 2018 bobbrand. All rights reserved.
//

import UIKit

class ItemStore {
    
    var allItems = [Item]()
    
    // Get a file system URL for the app's document folder in the sandbox
    let itemArchiveURL: URL = {
        let documentsDirectories =
            FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("items.archive")
    }()
    
    
    // MARK: - Initializer
    
    // Get all of the items out of the file system
    init() {
        if let archivedItems =
            NSKeyedUnarchiver.unarchiveObject(withFile: itemArchiveURL.path) as? [Item] {
            allItems = archivedItems
        }
    }
    
    // MARK: - Actions
    
    // Create a blank item
    @discardableResult func createItem() -> Item {
        let newItem = Item(dishName: " ", dishCategory: " ")
        allItems.append(newItem)
        return(newItem)
    }
    
    func removeItem(_ item: Item) {
        if let index = allItems.index(of: item) {
            allItems.remove(at: index)
        }
    }
    
    func moveItem(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        
        // Get reference to object being mvoed so you can reinsert it
        let movedItem = allItems[fromIndex]
        
        // Remove item from array
        allItems.remove(at: fromIndex)
        
        // Insert item in array at new location
        allItems.insert(movedItem, at: toIndex)
    }
    
    func saveChanges() -> Bool {
        print("Saving items to: \(itemArchiveURL.path)")
        return NSKeyedArchiver.archiveRootObject(allItems, toFile: itemArchiveURL.path)
    }
}
