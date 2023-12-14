//
//  UsersData.swift
//  LabCaught
//
//  Created by mobileProg on 10/12/2023.
//

import Foundation

// Assuming this is a class to manage your users data
// UsersData.swift
import Foundation

class UsersData {
    var users: [User] = []

    func addLabUser(PhoneNumber: Int, username: String, password: String, confirmPassword: String, Location: String, labName: String, alwaysOpen: Bool, openingTime: DateComponents, closingTime: DateComponents) {
        
        let newLabUser = Labs(PhoneNumber: PhoneNumber, username: username, password: password, confirmPassword: confirmPassword, userType: .lab, Location: Location, labName: labName, alwaysOpen: alwaysOpen, openingTime: openingTime, closingTime: closingTime)
        
        users.append(newLabUser)
    }
    // Additional methods and properties for managing users
    
    
    
   

    func addAdminUser(PhoneNumber: Int, username: String, password: String, confirmPassword: String, department: String, firstName: String, lastName: String) {
        
        let newAdminUser = Admin(PhoneNumber: PhoneNumber, username: username, password: password, confirmPassword: confirmPassword, userType: .Admin, department: department, firstName: firstName, lastName: lastName)
        
        
        // Append the new Admin user to the users array
        users.append(newAdminUser)
    }

    
    // ... Other methods
}


// This part should be called from within an appropriate method elsewhere in your app, such as AppDelegate or a ViewController:
/*
let usersData = UsersData()
usersData.addLabUser(PhoneNumber: 1234567890, username: "labUser1", password: "password123", confirmPassword: "password123", Location: "123 Lab Street", labName: "Central Lab", alwaysOpen: false, openingTime: DateComponents(hour: 9, minute: 0), closingTime: DateComponents(hour: 17, minute: 0))
*/


 


