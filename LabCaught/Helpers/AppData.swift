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
}


