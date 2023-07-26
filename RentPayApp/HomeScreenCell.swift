//
//  HomeScreenCell.swift
//  RentPayApp
//
//  Created by Ritik Yadav on 01/06/23.
//

import UIKit

class HomeScreenCell: UITableViewCell {
    
    @IBAction func paymentsButton(_ sender: UIButton) {
    }
    
    @IBOutlet weak var circularProgressView: UIView!
    
    @IBOutlet weak var percentageLabel: UILabel!
    
    @IBOutlet weak var propertyButtonOutlet: UIButton!
    
    @IBOutlet weak var paymetsButtonOutlet: UIButton!
    
    var propertyButtonAction: (() -> Void)?
    
    let circularProgress = KYCircularProgress(frame: CGRect(x: 0, y: 0, width: 90, height: 90))
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // Create a new KYCircularProgress view and add it as a subview of the cell
        
        circularProgress.colors = [.green]
        circularProgress.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2) // Rotate by -90 degrees
        
        //circularProgress.lineWidth = 2.0
        
        // Check if the percentageLabel text is not empty and contains a valid number
        //        if let percentage = Int(percentageLabel.text!.dropLast()), percentage >= 0, percentage <= 100 {
        //            print(percentage)
        //            print(Double(percentage))
        //            circularProgress.progress = Double(percentage) / 100.0
        //        } else {
        //            circularProgress.progress = 0.0
        //        }
        circularProgress.center = CGPoint(x: bounds.midX, y: bounds.midY)
        addSubview(circularProgress)
        //circularProgressView.addSubview(circularProgress)
        
        propertyButtonOutlet.addTarget(self, action: #selector(propertyButtonTapped), for: .touchUpInside)
    }
    
    @objc func propertyButtonTapped() {
        propertyButtonAction?()
    }
    
}

