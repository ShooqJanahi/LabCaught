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
    var PhoneNumber: Int
    var username: String //declaring a property named username
    var password: String //passwordHash is used to store hashed version of the users password for security
    var confirmPassword: String
    var userType: UserType
    }

