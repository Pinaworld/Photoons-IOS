//
//  MapController.swift
//  photoons
//
//  Created by Developer on 21/07/2019.
//  Copyright © 2019 benoit. All rights reserved.
//

import UIKit
import MapKit

class customPin: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var photo: [Photo]
    
    init(pinTitle:String, pinSubTitle:String, location:CLLocationCoordinate2D, photo: [Photo]) {
        self.title = pinTitle
        self.subtitle = pinSubTitle
        self.coordinate = location
        self.photo = photo
    }
}

class MapController: UIViewController, MKMapViewDelegate {

    var locationManager = CLLocationManager()
    
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setMarker()
        // Do any additional setup after loading the view.
    }
    
    func setMarker(){
        if let path = Bundle.main.path(forResource: "dataEvent", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: [])
                let event = try? JSONDecoder().decode(Event.self, from: data)
                for e in event! {
                    let location = CLLocationCoordinate2D(latitude: e.latitude, longitude:e.longitude)
                    let region = MKCoordinateRegionMakeWithDistance(location, 8000, 8000)
                    self.mapView.setRegion(region, animated: true)
                    
                    let pin = customPin(pinTitle: e.title, pinSubTitle: e.eventDescription, location: location, photo: e.photo)
                    self.mapView.addAnnotation(pin)
                    self.mapView.delegate = self
                    
                }
                
            } catch {
                // handle error
            }
        }
    }
    @IBAction func disconnect(_ sender: Any) {
        
        UserDefaults.standard.set(nil, forKey: "e_mail")
        UserDefaults.standard.set(nil, forKey: "e_pseudo")
        UserDefaults.standard.set(nil, forKey: "e_age")
        performSegue(withIdentifier: "Login", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "targetEvent" {
            let targetEvent = segue.destination as! TargetEventController
            let output = sender as! photoons.customPin
            targetEvent.annotation = output
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let annotation = view.annotation {
            print("Your annotation title is: \(annotation.title! ?? "error")");
            
            performSegue(withIdentifier: "targetEvent", sender: annotation)
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        
        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "customannotation")
        let pinImage = UIImage(named: "icon")
        let size = CGSize(width: 50, height: 50)
        UIGraphicsBeginImageContext(size)
        pinImage!.draw(in: CGRect(x:0, y:0, width: size.width, height: size.height))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        annotationView.image = resizedImage
        annotationView.isEnabled = true
        annotationView.canShowCallout = true
        
        let btn = UIButton(type: .detailDisclosure)
        annotationView.rightCalloutAccessoryView = btn
        
        return annotationView
    }

}
