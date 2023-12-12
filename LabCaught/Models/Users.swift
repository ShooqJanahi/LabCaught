//
//  Users.swift
//  LabCaught
//
//  Created by mobileProg on 10/12/2023.
//

import Foundation
struct User {
    var username: String
    var passwordHash: String
    
    init(username: String, passwordHash: String) {
        self.username = username
        self.passwordHash = passwordHash
    }
}
