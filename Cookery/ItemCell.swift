//
//  ItemCell.swift
//  Cookery
//
//  Created by Bob Brand on 12/30/18.
//  Copyright © 2018 bobbrand. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
    @IBOutlet var dishNameLabel: UILabel!
    @IBOutlet var dishCategoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        dishNameLabel.adjustsFontForContentSizeCategory = true
        dishCategoryLabel.adjustsFontForContentSizeCategory = true
    }
}
