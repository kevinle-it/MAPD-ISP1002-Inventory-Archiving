//
//  DetailsViewController.swift
//  Inventory
//
//  Created by Cambrian on 2022-03-23.
//

import UIKit

class DetailsViewController: UIViewController {

    // create a property for the segue prepare function from ItemTableViewController to pass to
    var itemList: ItemList!

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var SKUField: UITextField!
    @IBOutlet weak var descField: UITextField!
    @IBOutlet weak var dateField: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    // Handle clicking Save button
    @IBAction func save(_ sender: Any) {
        // Name & SKU Fields are required to add new item
        if !nameField.text!.isEmpty && !SKUField.text!.isEmpty {
            let item = Item(name: nameField.text!, SKU: SKUField.text!, description: descField.text!, dateAdded: dateField.date)
            itemList.addItem(item: item)
            // Go back to Items scene
            self.navigationController?.popViewController(animated: true)
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
