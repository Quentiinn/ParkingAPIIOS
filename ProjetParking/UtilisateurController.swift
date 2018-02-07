//
//  UtilisateurController.swift
//  ProjetParking
//
//  Created by  on 24/01/2018.
//  Copyright © 2018 com.iut-bm.univ. All rights reserved.
//

import Foundation

class UtilisateurController {
    func fetchUtilisateur(completion: @escaping (Utilisateur!) -> Void) {
        let baseURL = URL(string: "http://quentindev.ovh/Parking/user.php")!
        
        let query: [String: String] = [
        "todo": "user",
        "name": "quentin",
        "password": "azeaze"
        ]
        
        let url = baseURL.withQueries(query)!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            // completion handler
            if let data = data,
                let rawJSON = try? JSONSerialization.jsonObject(with: data),
                let json = rawJSON as? [String:String],
                let utilisateur = Utilisateur(json: json) {
                completion(utilisateur)
            }
            
        }
        task.resume()
    }
}
