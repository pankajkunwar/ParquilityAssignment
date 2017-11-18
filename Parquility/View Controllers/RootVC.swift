//
//  RootVC.swift
//  Parquility
//
//  Created by Pankaj Kunwar on 14/11/17.
//  Copyright © 2017 Pankaj Kunwar. All rights reserved.
//

import UIKit

class RootVC: UIViewController {

    @IBOutlet weak var nearByPlacesButton: UIButton!
    @IBOutlet weak var locateMe: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "Parquility"
        
        //customizing button view
        nearByPlacesButton.layer.cornerRadius = 3.0
        locateMe.layer.cornerRadius = 3.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

