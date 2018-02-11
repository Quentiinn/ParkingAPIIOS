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



class MapViewController: UIViewController  , CLLocationManagerDelegate, MKMapViewDelegate{

    @IBOutlet weak var map: MKMapView!
    
    var pin: AnnotationPin!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var initi:CLLocation
        map.delegate = self
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
                
                let initialLocation: CLLocationCoordinate2D
                if lat != nil{
                    initialLocation = CLLocationCoordinate2DMake(lat!, long!)
                    self.pin = AnnotationPin(title: (place?.adresse)! , Subtitle: String(describing: place?.prixHoraire) , coordinate: initialLocation , adresse: (place?.adresse)! , prix: (place?.prixHoraire)!, surveiller: (place?.surveiller)! , souterrain: (place?.souterrain)! , dispo: (place?.dispo)! , id: (place?.id)! )
                    self.map.addAnnotation(self.pin)
                }

            }
        }
        // Do any additional setup after loading the view.
    }
    
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let pinView = MKPinAnnotationView(annotation: pin, reuseIdentifier: "pin")
            pinView.canShowCallout = true
        
        pinView.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        return pinView
    }
    
    

    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let annView = view.annotation as! AnnotationPin
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detalleVC = storyboard.instantiateViewController(withIdentifier: "Detalle") as! DetailViewController
        detalleVC.adresse = annView.adresse!
        detalleVC.prix = Int16(Int(annView.prix))
        detalleVC.dispo = Int16(annView.dispo)
        detalleVC.surveiller = Int16(annView.surveiller)
        detalleVC.souterrain = Int16(annView.souterrain)
        detalleVC.id = Int16(annView.id)
      
        
        self.navigationController?.pushViewController(detalleVC, animated: true)
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
