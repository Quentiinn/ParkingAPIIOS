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
    
    init(title: String, Subtitle: String , coordinate: CLLocationCoordinate2D){
        self.title = title
        self.subtitle = Subtitle
        self.coordinate = coordinate
    }
}
