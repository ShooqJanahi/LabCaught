//
//  HospitalLabTableViewCell.swift
//  LabCaught
//
//  Created by Shaikha Hasan Ali Hasan Ali Mohamed on 19/12/2023.
//

import UIKit

class HospitalLabTableViewCell: UITableViewCell {
    
    @IBOutlet weak var LabNameLbl: UILabel!
    @IBOutlet weak var LocationLbl: UILabel!
    @IBOutlet weak var FacilityTypeLbl: UILabel!
    @IBOutlet weak var facilityImageView: UIImageView!
    
    func configure(with facility: Labs) {
        LabNameLbl.text = facility.labName
        LocationLbl.text = facility.Location
        FacilityTypeLbl.text = facility.facilityType.description
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
