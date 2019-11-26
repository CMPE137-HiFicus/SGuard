//
//  MessegeViewController.swift
//  SGuard
//
//  Created by Kham Tran on 11/25/19.
//  Copyright © 2019 Kham Tran. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
class MessegeViewController: UIViewController,UITableViewDataSource {
   
    @IBOutlet weak var messegeTable: UITableView!
    static var NoticeList:[String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        messegeTable.dataSource = self
    }
    func decode(messege:String) ->[String.SubSequence]{
        return messege.split(separator: ":", maxSplits: 2, omittingEmptySubsequences: true)
    }
    
    @IBAction func showNotice(_ sender: UIButton) {
        let index = messegeTable.indexPath(for: sender.superview?.superview as! UITableViewCell)
        let element = decode(messege: MessegeViewController.NoticeList[index!.row])
        let latitude = CLLocationDegrees(element[1])
        let longtitude = CLLocationDegrees(element[2])
        MapView.mylocation.coordinate = CLLocationCoordinate2D( latitude: latitude!,  longitude: longtitude!)
        performSegue(withIdentifier: "Map", sender: self)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MessegeViewController.NoticeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let notice = decode(messege: MessegeViewController.NoticeList[indexPath.row])[0]
        let cell = tableView.dequeueReusableCell(withIdentifier: "messege") as! MessegeCell
        cell.name.text = String(notice) 
        return cell
    }
    

}
