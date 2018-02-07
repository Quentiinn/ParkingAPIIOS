//
//  MapViewController.swift
//  ProjetParking
//
//  Created by  on 24/01/2018.
//  Copyright © 2018 com.iut-bm.univ. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit



class MapViewController: UIViewController  , CLLocationManagerDelegate{

    @IBOutlet weak var map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        var initi:CLLocation
        initi = CLLocation(latitude : 47.6581356, longitude : 6.84562070000004)
        centerMapOnLocation(location: initi)

        let placeController = PlaceController()
        placeController.fetchPlace { (place) in
            let geoCoder = CLGeocoder()
            geoCoder.geocodeAddressString((place?.adresse)!){
                placemarks, error in
                let placemarks = placemarks?.first
                let lat = placemarks?.location?.coordinate.latitude
                let long = placemarks?.location?.coordinate.longitude
                print(place?.adresse)
                print(lat)
                print(long)
                let annotation = MKPointAnnotation()
                let initialLocation: CLLocationCoordinate2D
                if lat != nil{
                    initialLocation = CLLocationCoordinate2DMake(lat!, long!)
                    annotation.coordinate = initialLocation
                    annotation.title = place?.adresse
                    //annotation.subtitle =
                    self.map.addAnnotation(annotation);
                }

            }
                
                
            
        }
        // Do any additional setup after loading the view.
    }

    let regionRadius: CLLocationDistance = 10000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius, regionRadius)
        
        
        map.setRegion(coordinateRegion, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}