//
//  Users.swift
//  LabCaught
//
//  Created by mobileProg on 10/12/2023.
//

import Foundation


class User: Equatable, Codable {
    
    var username: String
    var password: String
    
    var createdOn: Date
    var phoneNumber: Int
    var confirmPassword: String
    
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.username == rhs.username
    }
    
    init(username: String, password: String, createdOn: Date = Date(), confirmPassword: String, phoneNumber: Int) {
        self.username = username
        self.password = password
        self.createdOn = createdOn
        self.confirmPassword = confirmPassword
        self.phoneNumber = phoneNumber
    }
}


