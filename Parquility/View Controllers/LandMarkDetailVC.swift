//
//  LandMarkDetailVC.swift
//  Parquility
//
//  Created by Pankaj Kunwar on 16/11/17.
//  Copyright © 2017 Pankaj Kunwar. All rights reserved.
//

import UIKit
import MapKit

class LandMarkDetailVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var landmarkDetails: LandMark!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = landmarkDetails.title
        
        // hide backButton Text
        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButton
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// MARK :- UITableViewDataSource, UITableViewDelegate
extension LandMarkDetailVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0,2:
            return view.frame.size.height/3
            
        default:
            return UITableViewAutomaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let imageCell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as! ImageCell
            imageCell.landmarkDetailIV.image = UIImage(named: landmarkDetails.image)
            return imageCell
            
        case 1:
            let descriptionCell = tableView.dequeueReusableCell(withIdentifier: "descriptionCell", for: indexPath) as! DescriptionCell
            descriptionCell.landmarkDetailTitle.text = landmarkDetails.title
            descriptionCell.landmarkDetailSubTitle.text = landmarkDetails.subtitle
            descriptionCell.landmarkDetailDescription.text = landmarkDetails.description
            return descriptionCell
            
        default:
            let navigationCell = tableView.dequeueReusableCell(withIdentifier: "navigationCell", for: indexPath) as! NavigationCell
            navigationCell.delegate = self
            //setting the coordinate point on map
            let span = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
            let location = CLLocationCoordinate2D(latitude: landmarkDetails.location.0, longitude: landmarkDetails.location.1)
            let region = MKCoordinateRegion(center: location, span: span)
            navigationCell.mapView.setRegion(region, animated: true)
            
            let annotation = MKPointAnnotation()
            
            annotation.coordinate = location
            annotation.title = landmarkDetails.title
            annotation.subtitle = landmarkDetails.subtitle
            navigationCell.mapView.addAnnotation(annotation)
            
            return navigationCell
            
        }
    }
}

extension LandMarkDetailVC: NavigationCellProtocolDelegate {
    func openMap() {
        let regionDistance:CLLocationDistance = 1000
        let coordinates = CLLocationCoordinate2D(latitude: landmarkDetails.location.0, longitude: landmarkDetails.location.1)
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan : regionSpan.span)]
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = landmarkDetails.title
        mapItem.openInMaps(launchOptions: options)
    }
}
