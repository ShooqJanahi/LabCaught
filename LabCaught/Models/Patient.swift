//
//  Patient.swift
//  LabCaught
//
//  Created by mobileProg on 10/12/2023.
//

import Foundation

struct Patient {
    var firstlName:String
    var LastName:String
    var DOB:DateComponents
    var CPR: Int
    var user: User
    
    
    init(firstName:String, lastName: String,CPR: Int, DOB: DateComponents, user: User) {
        self.CPR = CPR
        self.DOB = DOB
        self.LastName = lastName
        self.firstlName = firstName
        self.user = user
        self.user.userType = .patient
        
    }
    
    
    
}
