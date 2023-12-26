//
//  LabBookingsTableViewCell.swift
//  LabCaught
//
//  Created by Nada Naser Ahmed Abdulla Abdulkarim Alawadhi on 26/12/2023.
//

import UIKit

class LabBookingsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var CPRLbl: UILabel!
    @IBOutlet weak var testNameLbl: UILabel!
    @IBOutlet weak var bookingDateLbl: UILabel!
    
    func configure(booking: booking){
        CPRLbl.text = "\(booking.patient.CPR)"
        testNameLbl.text = booking.medicalService.name
        bookingDateLbl.text = "\(booking.booking_date)"
    }
}
