//
//  BrandTableViewCell.swift
//  qant
//
//  Created by Chai on 9/3/15.
//  Copyright © 2015 Chai. All rights reserved.
//

import UIKit

class BrandTableViewCell: UITableViewCell {

    @IBOutlet weak var ratingControl: Clam!
    
    
    //MARK: Properties
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var logoImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
