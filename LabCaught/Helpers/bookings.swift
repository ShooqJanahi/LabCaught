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
            // bookings = sampleBookings
        }
    }
    
    /*static var sampleBookings = [booking(booking_date:
     DateComponents(calendar: Calendar.current, year: 2023, month: 12, day:22), patient: Patient(firstName: "Maryam", lastName: "Salah", CPR: 123456789, DOB: DateComponents(calendar: Calendar.current, year: 2003, month: 11, day:22), user: User(firstName: "Maryam", lastName: "Salah", PhoneNumber: 12345678, username: "marym", password: "1234", confirmPassword: "1234", userType: .patient)), test: test(TestName: "Vitamin B12 Test", cost: "3 BHD", describtion: "Blood test for Vitamin B12", insrtuctions: "fasting for 8 to 10 hours is required")),
     booking  (booking_date:
     DateComponents(calendar: Calendar.current, year: 2024, month: 11, day:22), patient: Patient(firstName: "Fatima", lastName: "Salah", CPR: 123456785, DOB: DateComponents(calendar: Calendar.current, year: 2003, month: 11, day:22), user: User(firstName: "Fatima", lastName: "Salah", PhoneNumber: 12345678, username: "fatima", password: "1234", confirmPassword: "1234", userType: .patient)), test: test(TestName: "Vitamin B12 Test", cost: "3 BHD", describtion: "Blood test for Vitamin B12", insrtuctions: "fasting for 8 to 10 hours is required"))
     
     ]
     }
     
     
     
     var book = booking(booking_date:
     DateComponents(calendar: Calendar.current, year: 2023, month: 12, day:22), patient: Patient(firstName: "Maryam", lastName: "Salah", CPR: 123456789, DOB: DateComponents(calendar: Calendar.current, year: 2003, month: 11, day:22), user: User(firstName: "Maryam", lastName: "Salah", PhoneNumber: 12345678, username: "marym", password: "1234", confirmPassword: "1234", userType: .patient)), test: test(TestName: "Vitamin B12 Test", cost: "3 BHD", describtion: "Blood test for Vitamin B12", insrtuctions: "fasting for 8 to 10 hours is required"))
     
     var book1 = booking(booking_date:
     DateComponents(calendar: Calendar.current, year: 2024, month: 11, day:22), patient: Patient(firstName: "Fatima", lastName: "Salah", CPR: 123456785, DOB: DateComponents(calendar: Calendar.current, year: 2003, month: 11, day:22), user: User(firstName: "Fatima", lastName: "Salah", PhoneNumber: 12345678, username: "fatima", password: "1234", confirmPassword: "1234", userType: .patient)), test: test(TestName: "Vitamin B12 Test", cost: "3 BHD", describtion: "Blood test for Vitamin B12", insrtuctions: "fasting for 8 to 10 hours is required"))
     */
    
}
