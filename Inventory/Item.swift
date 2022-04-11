//
//  Item.swift
//  Inventory
//
//  Created by Cambrian on 2022-03-23.
//

import Foundation

class Item : NSCoding {
    var name: String
    var SKU: String
    var description: String
    var dateAdded: Date
    
    init(name: String, SKU: String, description: String, dateAdded: Date){
        self.name = name
        self.SKU = SKU
        self.description = description
        self.dateAdded = dateAdded
    }

    required init?(coder: NSCoder) {
        name = coder.decodeObject(forKey: "name") as! String
        SKU = coder.decodeObject(forKey: "SKU") as! String
        description = coder.decodeObject(forKey: "description") as! String
        dateAdded = coder.decodeObject(forKey: "dateAdded") as! Date
    }

    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(SKU, forKey: "SKU")
        coder.encode(description, forKey: "description")
        coder.encode(dateAdded, forKey: "dateAdded")
    }
}
