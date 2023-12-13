//
//  Admin.swift
//  LabCaught
//
//  Created by mobileProg on 10/12/2023.
//

import Foundation

class Admin: User {
    //add the properties
    var department: String //example
    
    init(department: String) {
        self.department = department
        
        super.init(firstName: firstName, lastName: lastName, PhoneNumber: PhoneNumber, username: username, password: password, confirmPassword: confirmPassword, userType: .Admin)
    }
}
