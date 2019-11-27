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
import FirebaseFirestore
class MessegeViewController: UIViewController,UITableViewDataSource {
  
    @IBOutlet weak var messegeTable: UITableView!
    static var NoticeList:[String] = []
    var size = 0
    var refresher:UIRefreshControl = UIRefreshControl()
    private var ref = Firestore.firestore().collection("user")
    override func viewDidLoad() {
        super.viewDidLoad()
       
            messegeTable.reloadData()
            refresher.attributedTitle = NSAttributedString(string: "Refeshing")
            refresher.addTarget(self, action: #selector(self.refresh), for: UIControl.Event.valueChanged)
        messegeTable.addSubview(refresher)
        messegeTable.dataSource = self
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
  
        if size != MessegeViewController.NoticeList.count{
           
            refresh()
           
            size = MessegeViewController.NoticeList.count
        }
    }
    @objc func refresh(){
        refresher.beginRefreshing()
        messegeTable.reloadData()
        refresher.endRefreshing()
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            ref.document(HomePage.name).updateData(["Notification":FieldValue.arrayRemove([MessegeViewController.NoticeList[indexPath.row]])])
                
            MessegeViewController.NoticeList.remove(at: indexPath.row)
            messegeTable.beginUpdates()
            messegeTable.deleteRows(at: [indexPath], with: .automatic)
            messegeTable.endUpdates()
            
                
        }
    }

}
