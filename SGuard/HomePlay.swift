//
//  HomePlay.swift
//  SGuard
//
//  Created by Sang To on 11/24/19.
//  Copyright © 2019 Kham Tran. All rights reserved.
//

import UIKit
import AVFoundation
import MapKit
import CoreLocation
import FirebaseFirestore
class HomePlay: UIViewController, CLLocationManagerDelegate {
    private var ref = Firestore.firestore()
    private var location:CLLocation = CLLocation()
    let locationManager = CLLocationManager()
    var audio1: AVAudioPlayer!
    var audio2: AVAudioPlayer!
    var count = 0;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        // sound  
        let sound1 = Bundle.main.path(forResource: "S3.mp3", ofType:nil)
        let sound2 = Bundle.main.path(forResource: "S4.mp3", ofType:nil)
        
        do {
            // initialize it
            audio1 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound1!))
            audio1.numberOfLoops = 100
            audio2 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound2!))
            audio2.numberOfLoops = 100
        } catch {
            // It will print any
            print(error)
        }
        
    }
    
    func encode(latitude:CLLocationDegrees, longtitude:CLLocationDegrees)-> String{
        
        return HomePage.name + ":" + String(latitude) + ":" + String(longtitude)
    }
    
    @IBAction func play_sound1(_ sender: Any) {
        if (count%2==0) {
            audio1.play()
            count+=1
        } else {
            audio1.stop()
            count = 0
        }
    }
    
    @IBAction func play_sound2(_ sender: Any) {
        if (count%2==0) {
            audio2.play()
            count+=1
        } else {
            audio2.stop()
            count = 0
        }
    }
    
    @IBAction func play_sound3(_ sender: Any) {
        if (count%2==0) {
            audio1.play()
            audio2.play()
            count+=1
            let slocation = encode(latitude: (location.coordinate.latitude), longtitude: (location.coordinate.longitude))
            
            for s in Contact.ContactList{
            ref.collection("user").document(s).updateData(["Notification":FieldValue.arrayUnion([slocation])])
                print(String(location.coordinate.latitude) + "," + String(location.coordinate.longitude))
            }
        } else {
            audio1.stop()
            audio2.stop()
            count = 0
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.location = locations.last! as CLLocation
      }

}
