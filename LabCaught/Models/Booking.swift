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
//it should be there
class booking: Equatable{
    static func == (lhs: booking, rhs: booking) -> Bool {
        lhs.patient == rhs.patient && lhs.booking_date == rhs.booking_date
    }
    
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
