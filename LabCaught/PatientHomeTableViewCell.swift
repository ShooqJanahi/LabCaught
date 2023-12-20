//
//  PatientHomeTableViewCell.swift
//  LabCaught
//
//  Created by Nada Naser Ahmed Abdulla Abdulkarim Alawadhi on 19/12/2023.
//

import UIKit

class PatientHomeTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var facilityLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    
    func configure(facility: Facility){
        nameLbl.text = facility.name
        facilityLbl.text = facility.location
        typeLbl.text = facility.facilityType.rawValue
    }

}
protocol SearchCell {
    
}

extension Facility: SearchCell {
    
}
