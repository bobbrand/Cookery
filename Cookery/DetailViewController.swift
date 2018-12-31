//
//  DetailViewController.swift
//  Cookery
//
//  Created by Bob Brand on 12/31/18.
//  Copyright © 2018 bobbrand. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var dishNameField: UITextField!
    @IBOutlet var categoryNameField: UITextField!
    @IBOutlet var dateLabel: UILabel!
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    var item: Item! {
        didSet {
            navigationItem.title = item.dishName
        }
    }
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    } ()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        dishNameField.text = item.dishName
        categoryNameField.text = item.dishCategory
        dateLabel.text = dateFormatter.string(from: item.dateCreated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Gracefully remove any keyboard
        view.endEditing(true)
        
        // "Save" changes to item
        item.dishName = dishNameField.text ?? ""
        item.dishCategory = categoryNameField.text ?? ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
