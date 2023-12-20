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
    var medicalService: Service
    init(booking_date: DateComponents, patient: Patient, medicalService: Service) {
        self.booking_date = booking_date
        self.patient = patient
        self.medicalService = medicalService
    }

    
    }
