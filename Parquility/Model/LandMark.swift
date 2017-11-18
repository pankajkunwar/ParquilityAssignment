//
//  LandMark.swift
//  Parquility
//
//  Created by Pankaj Kunwar on 16/11/17.
//  Copyright © 2017 Pankaj Kunwar. All rights reserved.
//

import UIKit

class LandMark {
    var id: Int
    var title: String
    var subtitle: String
    var image: String
    var description: String
    var location: (Double, Double)
    
    init(id: Int, title: String, subtitle: String, image: String, description: String, location: (Double, Double)) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.image = image
        self.description = description
        self.location = location
    }
}
