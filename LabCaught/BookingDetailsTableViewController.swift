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
    
    @IBOutlet weak var buttonCell: UITableViewCell!
    @IBOutlet weak var statusCell: UITableViewCell!
    @IBOutlet weak var statusLbl: UILabel!
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        filling()
    }
    
    func filling(){
        if let bookingStatus = booking?.status {
                switch bookingStatus {
                case .upcoming:
                    statusCell.isHidden = true
                    buttonCell.isHidden = false
                case .completed:
                    buttonCell.isHidden = true
                    statusCell.isHidden = false
                    statusLbl.text = "APPOINTMENT COMPLETED!"
                    
                default:
                    buttonCell.isHidden = true
                    statusCell.isHidden = false
                    statusLbl.text = "APPOINTMENT CANCELED!"
                }
            }
        
        if let firstName = booking?.patient.firstName, let lastName = booking?.patient.lastName {
            patientNameLbl.text = firstName + lastName
        }
        
        if let CPR = booking?.patient.CPR {
            cprLbl.text = String(CPR)
        }
        
        if let phone = booking?.patient.phoneNumber {
            phoneLbl.text = String(phone)
        }
        
        if let bookingDate = booking?.booking_date {
            bookingDateLbl.text = "\(bookingDate)"
        }
        
        if let testPackageName = booking?.medicalService.name {
            testPackageNameLbl.text = testPackageName
        }
        
        if let price = booking?.medicalService.cost {
            priceLbl.text = price
        }
        
        if let instructions = booking?.medicalService.insrtuctions {
            instructionsLbl.text = instructions
        }
        
        if let description = booking?.medicalService.describtion {
            descriptionLbl.text = description
        }
    }
    
    



}
