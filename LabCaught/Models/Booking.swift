//
//  booking.swift
//  LabCaught
//
//  Created by Maryam Salah Hashem Adnan Saleh on 13/12/2023.
//
enum statusType : String,Codable{
    case
    upcoming = "Upcoming",
    completed = "Completed",
    cancelled = "Cancelled"
}
import Foundation
class booking{
    var booking_date:DateComponents
    var patient:Patient
    var status: statusType
    //var isPackage:Bool
    var medicalService: Service
    init(booking_date: DateComponents, patient: Patient, medicalService: Service) {
        self.booking_date = booking_date
        self.patient = patient
        self.medicalService = medicalService
        status = .upcoming
    }

    
    }
