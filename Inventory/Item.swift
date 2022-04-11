//
//  Item.swift
//  Inventory
//
//  Created by Cambrian on 2022-03-23.
//

import Foundation

// Item Data Model
class Item : NSObject, NSCoding {
    var name: String
    var SKU: String
    var itemDescription: String
    var dateAdded: Date
    
    init(name: String, SKU: String, description: String, dateAdded: Date){
        self.name = name
        self.SKU = SKU
        self.itemDescription = description
        self.dateAdded = dateAdded
    }

    // Decode item data from archive
    required init?(coder: NSCoder) {
        name = coder.decodeObject(forKey: "name") as! String
        SKU = coder.decodeObject(forKey: "SKU") as! String
        itemDescription = coder.decodeObject(forKey: "itemDescription") as! String
        dateAdded = coder.decodeObject(forKey: "dateAdded") as! Date
        
        super.init()
    }

    // Encode for archiving item data
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(SKU, forKey: "SKU")
        coder.encode(itemDescription, forKey: "itemDescription")
        coder.encode(dateAdded, forKey: "dateAdded")
    }
}
