//
//  Labs.swift
//  LabCaught
//
//  Created by mobileProg on 10/12/2023.
//

import Foundation

class Labs: User {
    //add the property here
    var Location: String //Example
    var labName :String
    
    var alwaysOpen: Bool
    var openingTime: DateComponents
    var closingTime: DateComponents
    
    init(PhoneNumber: Int, username: String, password: String, confirmPassword: String, userType: UserType, Location: String, labName: String, alwaysOpen: Bool, openingTime: DateComponents, closingTime: DateComponents) {
        self.Location = Location
        self.labName = labName
        self.alwaysOpen = alwaysOpen
        self.openingTime = openingTime
        self.closingTime = closingTime
        
        super.init(PhoneNumber: PhoneNumber, username: username, password: password, confirmPassword: confirmPassword, userType: .lab)
    }
        
}
