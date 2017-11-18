//
//  DataController.swift
//  Parquility
//
//  Created by Pankaj Kunwar on 16/11/17.
//  Copyright © 2017 Pankaj Kunwar. All rights reserved.
//

import UIKit

class DataController {
    static let sharedInstance = DataController()
    private var apiManager: ApiManager
    
    private init() {
        self.apiManager = ApiManager()
    }
    
    func fetchNearByPlaces(completion:(_ result : [LandMark]) -> Void){
        apiManager.getNearbyLondonPlaces { (result, error) in
            if result != nil && (result!["data"] != nil){
                let placeData = result!["data"] as! [Dictionary<String, Any>]
                var landMarkArray = [LandMark]()
                for (_, placeDetail) in placeData.enumerated() {
                    //parse data for creating model
                    let id =  Int(placeDetail["id"] as! String)!
                    let image = placeDetail["image"] as! String
                    let title = placeDetail["title"] as! String
                    let subtitle = placeDetail["subtitle"] as! String
                    let description = placeDetail["description"] as! String
                    let location = (Double(placeDetail["lat"] as! String)!, Double(placeDetail["long"] as! String)!)
                    
                    let landMark = LandMark(id: id, title: title, subtitle: subtitle, image: image, description: description, location: location)
                    
                    landMarkArray.append(landMark)
                }
                
                completion(landMarkArray)
            } else {
                completion([LandMark]())
            }
        }
    }

}
