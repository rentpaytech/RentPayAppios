//
//  TenantsListScreen.swift
//  RentPayApp
//
//  Created by Ritik Yadav on 08/06/23.
//

import UIKit

class TenantsListScreen: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var propertyNameLabel: UILabel!
    
    @IBAction func addTenantButton(_ sender: UIButton) {
        performSegue(withIdentifier: "tenantsListToAddTenant", sender: self)
    }
    
    @IBOutlet weak var tenantListTable: UITableView!
    
    var propertyTitle: String?
    
    var tenants: [String] = ["John Doe", "Jane Smith", "Bob Johnson"]
    var roomNumbers: [String] = ["101", "102", "103"]
    var floorNumbers: [String] = ["1", "1", "2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if let propertyTitle = propertyTitle {
            propertyNameLabel.text = propertyTitle
        }
        
        tenantListTable.dataSource = self
        tenantListTable.rowHeight = 75
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tenants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tenantCell", for: indexPath) as! TenantCell
        
        cell.tenantNameLabel.text = tenants[indexPath.row]
        cell.roomNoFloorNoLabel.text = "Room \(roomNumbers[indexPath.row]) | Floor \(floorNumbers[indexPath.row])"
        
        return cell
    }
    
}
