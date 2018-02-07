//
//  PlaceController.swift
//  ProjetParking
//
//  Created by  on 31/01/2018.
//  Copyright © 2018 com.iut-bm.univ. All rights reserved.
//

import Foundation



class PlaceController {
    var toto = [Place]()
    func fetchPlace(completion: @escaping (Place?) -> Void) {
        let baseURL = URL(string: "http://quentindev.ovh/Parking/user.php")!
        
        let query: [String: String] = [
            "todo": "selectAllPlace"
        ]
        
        
        
        let url = baseURL.withQueries(query)!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            // completion handler
            if let data = data,
                let rawJson = try? JSONSerialization.jsonObject(with: data),
                let json = rawJson as? [[String : String]]{
                print(json)
              
                for json in json{
                    let parkingInfo = Place(json:json)
                    completion(parkingInfo)
                }
                
            }
        
            }
        task.resume()

        
            
            
            
        
            
        }
        //task.resume()
    
    }

