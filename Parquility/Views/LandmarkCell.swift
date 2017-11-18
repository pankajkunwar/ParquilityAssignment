//
//  LandmarkCell.swift
//  Parquility
//
//  Created by Pankaj Kunwar on 16/11/17.
//  Copyright © 2017 Pankaj Kunwar. All rights reserved.
//

import UIKit

class LandmarkCell: UITableViewCell {

    @IBOutlet weak var landmarkIV: UIImageView!
    @IBOutlet weak var landmarkTitle: UILabel!
    @IBOutlet weak var landmarkSubTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
