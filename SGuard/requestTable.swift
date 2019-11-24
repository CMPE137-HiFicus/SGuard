//
//  requestTable.swift
//  SGuard
//
//  Created by Kham Tran on 11/20/19.
//  Copyright © 2019 Kham Tran. All rights reserved.
//

import UIKit

class requestTable: UITableView,UITableViewDataSource {
    private var list:[String] = []
    
    func getdata(data:[String]){
        list = data
    }
    func getcount()-> Int{
        return list.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let request = list[indexPath.row]
        
        let requestcell = tableView.dequeueReusableCell(withIdentifier: "RequestView") as! RequestTableViewCell
        requestcell.name.text = request
        return requestcell
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
