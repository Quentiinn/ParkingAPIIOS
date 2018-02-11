//
//  AnnotationPin.swift
//  ProjetParking
//
//  Created by quentin courvoisier on 10/02/2018.
//  Copyright © 2018 com.iut-bm.univ. All rights reserved.
//

import MapKit

class AnnotationPin: NSObject, MKAnnotation {
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    var adresse: String?
    var prix: Double
    var surveiller: Int16
    var souterrain: Int16
    var dispo: Int16
    var id: Int16
    
    init(title: String, Subtitle: String , coordinate: CLLocationCoordinate2D , adresse: String, prix: Double , surveiller: Int16 , souterrain: Int16 , dispo: Int16, id: Int16){
        self.title = title
        self.subtitle = Subtitle
        self.coordinate = coordinate
        self.adresse = adresse
        self.prix = prix
        self.souterrain = souterrain
        self.surveiller = surveiller
        self.dispo = dispo
        self.id = id
    }
}
