//
//  PropertyScreen.swift
//  RentPayApp
//
//  Created by Ritik Yadav on 08/06/23.
//

import UIKit

class PropertyScreen: UIViewController {
    
    @IBOutlet weak var propertyNameLabel: UILabel!
    
    @IBAction func tenantsButton(_ sender: UIButton) {
        performSegue(withIdentifier: "propertyToTenantsList", sender: self)
    }
    
    @IBAction func trackPayments(_ sender: UIButton) {
    }
    
    var propertyName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if let propertyName = propertyName {
            propertyNameLabel.text = propertyName
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "propertyToTenantsList" {
            let destinationVC = segue.destination as! TenantsListScreen
            destinationVC.propertyTitle = propertyName
        }
    }
    
    
}

