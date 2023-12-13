//
//  Users.swift
//  LabCaught
//
//  Created by mobileProg on 10/12/2023.
//

import Foundation

enum UserType {
    case Admin
    case patient
    case lab
}


class User {  //defining a structure named User
    var firstName:String
    var lastName: String
    var PhoneNumber: Int
    var username: String //declaring a property named username
    var password: String //passwordHash is used to store hashed version of the users password for security
    var confirmPassword: String
    var userType: UserType
    
    
    init(firstName: String, lastName: String, PhoneNumber: Int, username: String, password: String, confirmPassword: String, userType: UserType) {
        self.firstName = firstName
        self.lastName = lastName
        self.PhoneNumber = PhoneNumber
        self.username = username
        self.password = password
        self.confirmPassword = confirmPassword
        self.userType = userType
        
    }
    }

