//
//  ApiManager.swift
//  Parquility
//
//  Created by Pankaj Kunwar on 16/11/17.
//  Copyright © 2017 Pankaj Kunwar. All rights reserved.
//

import UIKit

class ApiManager {

    func getNearbyLondonPlaces(completionHandler:(_ result: Dictionary<String, Any>?, _ error: Error?) -> Void) {
        let url = Bundle.main.url(forResource: "data", withExtension: "json")
        do {
            let data = try Data(contentsOf: url!)
            do {
                let details = try JSONSerialization.jsonObject(with: data, options: []) as! Dictionary<String, Any>
                completionHandler(details, nil)
            } catch {
                print("Error deserializing JSON: \(error)")
                completionHandler(nil, error)
            }

        } catch {
            print("Error parsing JSON: \(error)")
            completionHandler(nil, error)
        }
    }
}
