//
//  BookingDetailsTableViewController.swift
//  LabCaught
//
//  Created by Nada Naser Ahmed Abdulla Abdulkarim Alawadhi on 27/12/2023.
//

import UIKit

class BookingDetailsTableViewController: UITableViewController {
    
    @IBOutlet weak var patientNameLbl: UILabel!
    @IBOutlet weak var cprLbl: UILabel!
    @IBOutlet weak var phoneLbl: UILabel!
    
    @IBOutlet weak var bookingDateLbl: UILabel!
    @IBOutlet weak var testPackageNameLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var instructionsLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    
    var booking: booking?
    
    required init?(coder: NSCoder, booking: booking) {
        self.booking = booking
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        self.booking = nil
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func filling(){
//        patientNameLbl.text = patientNameLbl.text +
//        "\(booking?.patient.firstName ?? "") \(booking?.patient.lastName ?? "")"
//        cprLbl.text = "\(booking?.patient.CPR ?? 0)"
//        phoneLbl.text = String(booking?.patient.phoneNumber)
//
//        bookingDateLbl.text = booking?.booking_date
//        testPackageNameLbl.text = booking?.medicalService.name
//        priceLbl.text = booking?.medicalService.cost
//        instructionsLbl.text = booking?.medicalService.insrtuctions
//        descriptionLbl.text = booking?.medicalService.describtion
    }
    
    



}
