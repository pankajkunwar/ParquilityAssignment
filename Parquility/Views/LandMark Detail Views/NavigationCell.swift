//
//  NavigationCell.swift
//  Parquility
//
//  Created by Pankaj Kunwar on 16/11/17.
//  Copyright © 2017 Pankaj Kunwar. All rights reserved.
//

import UIKit
import MapKit

protocol NavigationCellProtocolDelegate: class {
    func openMap()
}

class NavigationCell: UITableViewCell {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var directionButton: UIButton!
    weak var delegate: NavigationCellProtocolDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    //MARK :- Storyboard actions
    
    @IBAction func getDirection(_ sender: UIButton) {
        delegate?.openMap()
    }
}
