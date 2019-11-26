//
//  Contact.swift
//  SGuard
//
//  Created by Kham Tran on 11/6/19.
//  Copyright © 2019 Kham Tran. All rights reserved.
//

import UIKit
import FirebaseFirestore
class Contact: UIViewController,UITableViewDataSource  {
    let ref = Firestore.firestore().collection("user")
    static var ContactList:[String] = []
    @IBOutlet weak var contact: UITableView!
     var refresher:UIRefreshControl = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        contact.dataSource = self
        refresher.attributedTitle = NSAttributedString(string: "Refeshing")
        refresher.addTarget(self, action: #selector(self.refresh), for: UIControl.Event.valueChanged)
        contact.addSubview(refresher)
    }
    
    @objc func refresh()
       {
           refresher.endRefreshing()
           contact.reloadData()
       }
    @IBAction func unfriend(_ sender: UIButton) {
        let index = contact.indexPath(for: sender.superview?.superview as! UITableViewCell)
        ref.document(Contact.ContactList[index!.row]).updateData(["Friendlist":FieldValue.arrayRemove([HomePage.name])])
        ref.document(HomePage.name).updateData(["Friendlist":FieldValue.arrayRemove([Contact.ContactList[index!.row]])])
            Contact.ContactList.remove(at: index!.row)
            contact.beginUpdates()
            contact.deleteRows(at: [index!], with: .automatic)
            contact.endUpdates()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Contact.ContactList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contactfriend = Contact.ContactList[indexPath.row]
        let contactcell = tableView.dequeueReusableCell(withIdentifier: "contact") as! ContactCell
        contactcell.name.text = contactfriend
        return contactcell
    }
}
