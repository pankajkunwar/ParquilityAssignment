//
//  LandMarkTableVC.swift
//  Parquility
//
//  Created by Pankaj Kunwar on 16/11/17.
//  Copyright © 2017 Pankaj Kunwar. All rights reserved.
//

import UIKit

class LandMarkTableVC: UIViewController {

    @IBOutlet weak var loadingBar: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    var datasource = [LandMark]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // setting up the initial view
        title = "London Landmarks"
        tableView.isHidden = true
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 30
        loadingBar.startAnimating()
        
        //call the api to fetch the data model to display
        DataController.sharedInstance.fetchNearByPlaces { (landmarks) in
            self.datasource = landmarks
            self.tableView.isHidden = false
            self.loadingBar.stopAnimating()
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // passing the model object to the detail VC
        let detailVC = segue.destination as! LandMarkDetailVC
        detailVC.landmarkDetails = self.datasource[(self.tableView.indexPathForSelectedRow?.row)!]
    }
}

// MARK :- UITableViewDataSource, UITableViewDelegate

extension LandMarkTableVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "landmarkCell", for: indexPath) as! LandmarkCell
        let landmarkData = self.datasource[indexPath.row]
        
        cell.landmarkIV.image = UIImage(named: landmarkData.image)
        cell.landmarkTitle.text = landmarkData.title
        cell.landmarkSubTitle.text = landmarkData.subtitle
        
        return cell
    }
}
