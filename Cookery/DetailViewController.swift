//
//  DetailViewController.swift
//  Cookery
//
//  Created by Bob Brand on 12/31/18.
//  Copyright © 2018 bobbrand. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var dishNameField: UITextField!
    @IBOutlet var categoryNameField: UITextField!
    @IBOutlet var dateLabel: UILabel!
    
    var item: Item!
    
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
}
