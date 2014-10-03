//
//  MyTableViewCell.swift
//  messaging-swift
//
//  Created by Matthew Schmulen on 9/28/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//

import UIKit

class MessagingTableViewCell: UITableViewCell {

    @IBOutlet weak var imageUserProfile: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelMessage: UILabel!
    @IBOutlet weak var labelDateTime: UILabel!

    
    func loadItem(name: String, image: String) {
        imageUserProfile.image = UIImage(named: image)
        labelName.text = name
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
