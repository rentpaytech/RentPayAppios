//
//  TenantCell.swift
//  RentPayApp
//
//  Created by Ritik Yadav on 16/06/23.
//

import UIKit

class TenantCell: UITableViewCell {

    @IBOutlet weak var tenantNameLabel: UILabel!
    
    @IBOutlet weak var roomNoFloorNoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
