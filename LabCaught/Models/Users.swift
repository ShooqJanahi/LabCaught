//
//  Users.swift
//  LabCaught
//
//  Created by mobileProg on 10/12/2023.
//

import Foundation

enum UserType {
    case admin
    case patient
    case lab
}


struct User {  //defining a structure named User
    var firstName:String
    var lastName: String
    var DOB: String //Date of birth
    var CPR: Int
    var PhoneNumber: Int
    var username: String //declaring a property named username
    var passwordHash: String //passwordHash is used to store hashed version of the users password for security
    var confirmPassword: String
    var userType: UserType
    
    init(firstName:String, lastName:String, DOB:String, CPR: Int, PhoneNumber: Int, username: String, passwordHash: String, confirmPassword: String, userType:UserType) { //declaring an initializer for the User structure. inorder to call when a new instance of the structer is created
        
        self.firstName = firstName
        self.lastName = lastName
        self.DOB = DOB
        self.CPR = CPR
        self.PhoneNumber = PhoneNumber
        self.username = username //this line assigns the value passed as the username parametter to the username propertyof the structure
        
        self.passwordHash = passwordHash
        self.confirmPassword = confirmPassword
        self.userType = userType
    }
}
