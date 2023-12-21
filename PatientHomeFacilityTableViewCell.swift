//
//  PatientHomeFacilityTableViewCell.swift
//  LabCaught
//
//  Created by Nada Naser Ahmed Abdulla Abdulkarim Alawadhi on 21/12/2023.
//

import UIKit

class PatientHomeFacilityTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var facilityLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!

    func configure(service: Service){
        nameLbl.text = service.name
        facilityLbl.text = service.facility.name
        priceLbl.text = service.cost
    }

}
