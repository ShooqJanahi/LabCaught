//
//  Booking.swift
//  LabCaught
//
//  Created by Maryam Salah Hashem Adnan Saleh on 12/12/2023.
//

import Foundation
class booking{
    var booking_date:DateComponents
    var patient:Patient
    //var isPackage:Bool
    var package:packages!
    var test:test!
        
    init(booking_date: DateComponents, patient: Patient, package: packages!) {
        self.booking_date = booking_date
        self.patient = patient
        self.package = package
    }
    init(booking_date: DateComponents, patient: Patient, test: test!) {
        self.booking_date = booking_date
        self.patient = patient
        self.test = test
    }
    
    }

