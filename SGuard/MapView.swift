//
//  MapView.swift
//  SGuard
//
//  Created by Kham Tran on 11/25/19.
//  Copyright © 2019 Kham Tran. All rights reserved.
//

import UIKit
import MapKit
class MapView: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    static let mylocation:MKPointAnnotation = MKPointAnnotation()
    override func viewDidLoad() {
        super.viewDidLoad()
        MapView.mylocation.title = "My location"
       
        let region = MKCoordinateRegion(center: MapView.mylocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001))
        mapView.setRegion(region, animated: true)
        mapView.addAnnotation(MapView.mylocation)
    }

}
