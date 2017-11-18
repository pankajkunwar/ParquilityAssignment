//
//  LocatMeVC.swift
//  Parquility
//
//  Created by Pankaj Kunwar on 18/11/17.
//  Copyright © 2017 Pankaj Kunwar. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class LocatMeVC: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    var locationManager:CLLocationManager!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
