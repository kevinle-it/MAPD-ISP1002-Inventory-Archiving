//
//  ItemList.swift
//  Inventory
//
//  Created by Cambrian on 2022-03-23.
//

import Foundation

// Item List Model to handle multiple operations on an item list such as: Add, Remove, or Change Position in the list, and saving and loading data to and from archive
class ItemList{
    var items = [Item]()
    let itemURL: URL = {
        let documentDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentDirectories.first!
        return documentDirectory.appendingPathComponent("item.archive")
    }()
    
    // Load data from archive on Item List initializing
    init() {
        do {
            let data = try Data(contentsOf: itemURL)
            items = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as! [Item]
        } catch let err {
            print(err)
        }
    }
    
    func addItem(item: Item){
        items.append(item)
    }
    
    func deleteItem(row: Int){
        items.remove(at: row)
    }
    
    func moveItem(from: Int, to: Int){
        let temp = items[from]
        deleteItem(row: from)
        items.insert(temp, at: to)
    }
    
    // Archive items data to document directory
    func save() {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: items, requiringSecureCoding: false)
            try data.write(to: itemURL)
        } catch let err {
            print(err)
        }
    }
    
}
