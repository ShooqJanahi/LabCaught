//
//  bookings.swift
//  LabCaught
//
//  Created by Maryam Salah Hashem Adnan Saleh on 13/12/2023.
//

import Foundation

class AppData{
    static var bookings : [booking] = []
    
    
    static func load(){
        if bookings.isEmpty {
             bookings = sampleBookings
        }
    }
    
    static var sampleBookings = [
        booking(booking_date: DateComponents(calendar: Calendar.current, year: 2023, month: 12, day:22), patient: Patient(PhoneNumber: 39993999, username: "maryams", password: "1234", confirmPassword: "1234", userType: .patient, firstName: "Maryam", lastName: "Salah", DOB:  DateComponents(calendar: Calendar.current, year: 2003, month: 11, day:22), CPR: 0311001100), test: test(TestName: "Vitamin B12", cost: "3 BHD", describtion: "Blood test for Vitamin B12", insrtuctions: "fasting for 8 to 10 hours is required")),
                                 
        booking(booking_date: DateComponents(calendar: Calendar.current, year: 2023, month: 11, day:19), patient: Patient(PhoneNumber: 388838888, username: "Fatiman", password: "1234", confirmPassword: "1234", userType: .patient, firstName: "Fatima", lastName: "Ali", DOB:  DateComponents(calendar: Calendar.current, year: 2002, month: 09, day:02), CPR: 0209001100), test: test(TestName: "Vitamin D", cost: "3 BHD", describtion: "Blood test for Vitamin D", insrtuctions: "fasting for 8 to 10 hours is required"))
        ]

    
    
}
