//
//  BlogsTVC.swift
//  HKP
//
//  Created by Amisha on 26/12/18.
//  Copyright © 2018 Amisha. All rights reserved.
//

import UIKit

class BlogsTVC: UITableViewCell {

    @IBOutlet var imgBtn: Button!
    @IBOutlet var dateLbl: Label!
    @IBOutlet var discLbl: Label!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
