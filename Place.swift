//
//  Place.swift
//  ProjetParking
//
//  Created by  on 31/01/2018.
//  Copyright © 2018 com.iut-bm.univ. All rights reserved.
//

import Foundation

class Place {
    var id: Int16
    var adresse: String
    var prixHoraire: Double
    var surveiller: Int16
    var souterrain: Int16
    var dispo: Int16
    var idUtilisateur: Int16
    
    init(id: Int16, adresse: String, prixHoraire: Double, surveiller: Int16, souterrain: Int16, dispo: Int16, idUtilisateur: Int16) {
        self.id = id
        self.adresse = adresse
        self.prixHoraire = prixHoraire
        self.surveiller = surveiller
        self.souterrain = souterrain
        self.dispo = dispo
        self.idUtilisateur = idUtilisateur
    }
    
    init() {
        self.id = 0
        self.adresse = ""
        self.prixHoraire = 0
        self.surveiller = 1
        self.souterrain = 1
        self.dispo = 1
        self.idUtilisateur = 0
    }
    
    init?(json: [String: Any]) {
        guard let id = json["id"] as? String,
            let adresse = json["adresse"] as? String,
            let prixHoraire = json["prix_horaire"] as? String,
            let surveiller = json["is_surveille"] as? String,
            let souterrain = json["is_souterrain"] as? String,
            let dispo = json["is_dispo"] as? String,
            let idUtilisateur = json["id_utilisateur"] as? String
            else { return nil }
        self.id = Int16(id)!
        self.adresse = adresse
        self.prixHoraire = Double(prixHoraire)!
        self.surveiller = Int16(surveiller)!
        self.souterrain = Int16(souterrain)!
        self.dispo = Int16(dispo)!
        self.idUtilisateur = Int16(idUtilisateur)!
    }
}
