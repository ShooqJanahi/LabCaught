//
//  booking.swift
//  LabCaught
//
//  Created by Maryam Salah Hashem Adnan Saleh on 13/12/2023.
//

import Foundation
class booking{
    var booking_date:DateComponents
    var patient:Patient
    //var isPackage:Bool
    var package:Packages!
    var test:Test!
        
    init(booking_date: DateComponents, patient: Patient, package: Packages!) {
        self.booking_date = booking_date
        self.patient = patient
        self.package = package
    }
    init(booking_date: DateComponents, patient: Patient, test: Test!) {
        self.booking_date = booking_date
        self.patient = patient
        self.test = test
    }
    
    }
