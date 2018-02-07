//
//  Utilisateur.swift
//  ProjetParking
//
//  Created by  on 24/01/2018.
//  Copyright © 2018 com.iut-bm.univ. All rights reserved.
//

import Foundation

class Utilisateur {
    var id: Int16
    var name: String
    var password: String

    init(id: Int16, name: String, password: String) {
        self.id = id
        self.name = name
        self.password = password
    }
    
    init?(json: [String: Any]) {
        guard let id = json["id"] as? Int16,
            let name = json["name"] as? String,
            let password = json["password"] as? String else { return nil }
        self.id = id
        self.name = name
        self.password = password
    }
}
