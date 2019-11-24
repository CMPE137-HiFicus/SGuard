//
//  Contact.swift
//  SGuard
//
//  Created by Kham Tran on 11/6/19.
//  Copyright © 2019 Kham Tran. All rights reserved.
//

import UIKit

class Contact: UIViewController,UITableViewDataSource  {
    static var ContactList:[String] = []
    @IBOutlet weak var contact: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        contact.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Contact.ContactList.count
      }

      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let request = Contact.ContactList[indexPath.row]

          let requestcell = tableView.dequeueReusableCell(withIdentifier: "contact") as! ContactCell
        requestcell.name.text = request
          return requestcell
      }
}
