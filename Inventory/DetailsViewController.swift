//
//  DetailsViewController.swift
//  Inventory
//
//  Created by Cambrian on 2022-03-23.
//

import UIKit

class DetailsViewController: UIViewController {

    // create properties for the segue prepare function from ItemTableViewController to pass to
    var itemList: ItemList!
    var selectedItemIndex: Int?
    var isEditMode: Bool = false

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var SKUField: UITextField!
    @IBOutlet weak var descField: UITextField!
    @IBOutlet weak var dateField: UIDatePicker!
    
    // Hide red border color on editing
    @IBAction func nameFieldChange(_ sender: UITextField) {
        nameField.layer.borderWidth = 0
    }
    // Hide red border color on editing
    @IBAction func SKUFieldChanged(_ sender: UITextField) {
        SKUField.layer.borderWidth = 0
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Fill selected item data into form
        if isEditMode && selectedItemIndex != nil {
            let selectedItem = itemList.items[selectedItemIndex!]
            nameField.text = selectedItem.name
            SKUField.text = selectedItem.SKU
            descField.text = selectedItem.itemDescription
            dateField.date = selectedItem.dateAdded
        }
    }
    
    // Handle clicking Save button
    @IBAction func save(_ sender: Any) {
        // Name & SKU Fields are required to add new item
        if !nameField.text!.isEmpty && !SKUField.text!.isEmpty {
            let item = Item(name: nameField.text!, SKU: SKUField.text!, description: descField.text!, dateAdded: dateField.date)
            if isEditMode && selectedItemIndex != nil {
                itemList.items[selectedItemIndex!] = item
            } else {
                itemList.addItem(item: item)
            }
            // Go back to Items scene
            self.navigationController?.popViewController(animated: true)
        } else if nameField.text!.isEmpty && SKUField.text!.isEmpty {
            // Only show warning in red color if field is not focused
            if !nameField.isFocused {
                nameField.layer.borderColor = UIColor.systemRed.cgColor
                nameField.layer.borderWidth = 1
            }
            // Only show warning in red color if field is not focused
            if !SKUField.isFocused {
                SKUField.layer.borderColor = UIColor.systemRed.cgColor
                SKUField.layer.borderWidth = 1
            }
        } else if nameField.text!.isEmpty {
            // Only show warning in red color if field is not focused
            if !nameField.isFocused {
                nameField.layer.borderColor = UIColor.systemRed.cgColor
                nameField.layer.borderWidth = 1
            }
        } else if SKUField.text!.isEmpty {
            // Only show warning in red color if field is not focused
            if !SKUField.isFocused {
                SKUField.layer.borderColor = UIColor.systemRed.cgColor
                SKUField.layer.borderWidth = 1
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
