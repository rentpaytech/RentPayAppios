//
//  HomeScreen.swift
//  RentPayApp
//
//  Created by yadav, Ritik on 12/05/23.
//

import UIKit

class HomeScreen: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var addProperty: UIImageView!
    
    @IBOutlet weak var userIcon: UIImageView!
    
    @IBOutlet weak var bellIcon: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    let cellData = [
        ["propertyText": "Property 1", "paymentsText": "Payments 1", "progress": 0.2],
        ["propertyText": "Property 2", "paymentsText": "Payments 2", "progress": 0.4],
        ["propertyText": "Property 3", "paymentsText": "Payments 3", "progress": 0.6],
        ["propertyText": "Property 4", "paymentsText": "Payments 4", "progress": 0.8],
        ["propertyText": "Property 5", "paymentsText": "Payments 5", "progress": 1.0]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(addPropertyTapped))
        addProperty.addGestureRecognizer(tapGesture)
        
        let userIconTapGesture = UITapGestureRecognizer(target: self, action: #selector(userIconTapped))
        userIcon.addGestureRecognizer(userIconTapGesture)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // Set row height to automatic dimension
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    @objc func addPropertyTapped() {
        print("add property tapped")
        performSegue(withIdentifier: "homeToAddProperty", sender: self)
    }
    
    @objc func userIconTapped() {
        print("user icon tapped")
        performSegue(withIdentifier: "homeToProfile", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "homeToAddProperty" {
            // Perform any setup needed for the "Add Property" screen here
        } else if segue.identifier == "homeToProfile" {
            // Perform any setup needed for the "Profile" screen here
        } else if segue.identifier == "homeToProperty" {
            if let destinationVC = segue.destination as? PropertyScreen,
               let propertyButtonTitle = sender as? String {
                destinationVC.propertyName = propertyButtonTitle
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeScreenCell", for: indexPath) as! HomeScreenCell
        let data = cellData[indexPath.row]
        cell.propertyButtonOutlet.setTitle(data["propertyText"] as! String, for: .normal)
        cell.paymetsButtonOutlet.setTitle(data["paymentsText"] as! String, for: .normal)
        
        let progress = data["progress"] as! Double
        cell.percentageLabel.text = "\(Int(progress * 100))%"
        
        cell.circularProgress.progress = progress
        
        cell.propertyButtonAction = { [weak self] in
            self?.performSegue(withIdentifier: "homeToProperty", sender: data["propertyText"])
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}
