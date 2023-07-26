//
//  AddTenantScreen.swift
//  RentPayApp
//
//  Created by Ritik Yadav on 10/06/23.
//

import UIKit

class AddTenantScreen: UIViewController {
    
    @IBAction func addButton(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Enter 4 digit pin", message: nil, preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Pin"
            textField.keyboardType = .numberPad
        }
        let submitAction = UIAlertAction(title: "Submit", style: .default) { (_) in
            // Handle submit action here
            alertController.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(submitAction)
        present(alertController, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
}
