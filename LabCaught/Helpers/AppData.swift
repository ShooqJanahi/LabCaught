//
//  AppData.swift
//  LabCaught
//
//  Created by Nada Naser Ahmed Abdulla Abdulkarim Alawadhi on 19/12/2023.
//



import Foundation

struct AppData {
    
    
    
    
    //Users
    static var users: [User] = []
    
    //Admin user
    static var admins: [Admin] = [
        Admin(username: "admin", password: "admin123", department: "IT", firstName: "Alice", lastName: "Russo", phoneNumber: 12345678)
    ]
    
    
    static var labs: [Labs] = [
           Labs(
               username: "labUser",
               password: "labPassword",
               phoneNumber: 12345678,
               location: "Lab Location",
               labName: "Lab 1",
               alwaysOpen: true,
               openingTime: DateComponents(hour: 9, minute: 0),
               closingTime: DateComponents(hour: 17, minute: 0)
           )
       ]
    
    // Method to check if a username is already in use within the users array
    static func isUsernameInUse(username: String) -> Bool {
        return users.contains { $0.username.lowercased() == username.lowercased() } || admins.contains { $0.username.lowercased() == username.lowercased() }
    }
    
    // ... other static methods or properties ...
    
  //bookings
    static var bookings : [booking] = []
    static var l1 = [Labs]()
    static var services = [Service]()
    
    static var sampleBookings = [booking(booking_date: DateComponents(calendar: Calendar.current, year: 2023, month: 12, day:22), patient: Patient(username: "maryams", password: "1234", phoneNumber: 39993999, firstName: "Maryam", lastName: "Salah", DOB: DateComponents(calendar: Calendar.current, year: 2003, month: 11, day:22), CPR: 031100000), test: Test(name: "Vitamin B", cost: "3 BHD", describtion: "Blood test is done to check the patiend red and white cells and if they are healthy with no any side affeccts", insrtuctions: "No instruction")),
    
        booking(booking_date: DateComponents(calendar: Calendar.current, year: 2024, month: 01, day:06), patient: Patient(username: "fatiman", password: "4312", phoneNumber: 38883888, firstName: "Fatima", lastName: "Naser", DOB: DateComponents(calendar: Calendar.current, year: 2003, month: 05, day:09), CPR: 030500000), test: Test(name: "Vitamin D", cost: "3 BHD", describtion: "Blood test is done to check the patient's Vitamin D level and if they are healthy with no any side affeccts", insrtuctions: "Fasting for 8 - 10 hours is required"))
    ]
    
    static func load(){
        if bookings.isEmpty {
             bookings = sampleBookings
        }
    

    }
}


