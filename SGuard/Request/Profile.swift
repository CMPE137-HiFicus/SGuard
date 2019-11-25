//
//  Profile.swift
//  SGuard
//
//  Created by Kham Tran on 11/3/19.
//  Copyright © 2019 Kham Tran. All rights reserved.
//

import UIKit
import FirebaseFirestore
class Profile: UIViewController, UITableViewDataSource {
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var Username: UILabel!
    static var name:String = ""
    static var list:[String] = []
    private var ref = Firestore.firestore()
    var refresher:UIRefreshControl = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.dataSource = self
        Username.text = Profile.name
        
        refresher.attributedTitle = NSAttributedString(string: "Pull to refesh")
        refresher.addTarget(self, action: #selector(self.refresh), for: UIControl.Event.valueChanged)
        TableView.addSubview(refresher)
        }
    func updateRequest(indexpath:String){
        ref.collection("user").document(indexpath).updateData(["Friendlist":FieldValue.arrayUnion([HomePage.name])])
        ref.collection("user").document(HomePage.name).updateData(["Friendlist":FieldValue.arrayUnion([indexpath])])
        ref.collection("user").document(HomePage.name).updateData(["Requests":FieldValue.arrayRemove([indexpath])])
    }
    
   
    @objc func refresh()
    {
        refresher.endRefreshing()
        TableView.reloadData()
    }
    
    @IBAction func acceptRequest(_ sender: UIButton) {
        let indexpath =	TableView.indexPath(for: sender.superview?.superview as! UITableViewCell)!
        updateRequest(indexpath: Profile.list[indexpath.row])
    Profile.list.remove(at: indexpath.row)
        TableView.beginUpdates()
        TableView.deleteRows(at: [indexpath], with: .automatic)
        TableView.endUpdates()
    }
    
    
    
    @IBAction func dennyRequest(_ sender:UITableViewCell) {
        let indexpath =    TableView.indexPath(for: sender.superview?.superview as! UITableViewCell)!
        ref.collection("user").document(Profile.list.remove(at: indexpath.row)).updateData(["Friendlist":FieldValue.arrayRemove([HomePage.name])])
        ref.collection("user").document(HomePage.name).updateData(["Requests":FieldValue.arrayRemove([indexpath])])
        Profile.list.remove(at: indexpath.row)
        TableView.beginUpdates()
        TableView.deleteRows(at: [indexpath], with: .automatic)
        TableView.endUpdates()
    }
    
    @IBOutlet weak var Request: UITextField!
    
    @IBAction func sendRequest(_ sender: Any) {
        let name = Request.text!
        for friend in Contact.ContactList{
            if !friend.elementsEqual(name){
                ref.collection("user").document(Request.text!).updateData(["Requests":FieldValue.arrayUnion([HomePage.name])])
            }
            else {
                Request.text = "Already in contact"
            }
        }
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Profile.list.count
      }

      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let request = Profile.list[indexPath.row]

          let requestcell = tableView.dequeueReusableCell(withIdentifier: "RequestView") as! RequestTableViewCell
          requestcell.name.text = request
          return requestcell
      }
}



