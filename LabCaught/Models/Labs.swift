//
//  Labs.swift
//  LabCaught
//
//  Created by mobileProg on 10/12/2023.
//

import Foundation

class Labs {
    //add the property here
    var Username: String
    var Password: String
    var labName :String
    var Specialization :String
    var Location: String
    var ContactInfo :Int
    var alwaysOpen: Bool
    //var openingTime: DateComponents
    //var closingTime: DateComponents
    
    init(Username: String, Password: String, labName: String, Specialization: String, Location: String, ContactInfo: Int, alwaysOpen: Bool) {
        self.Username = Username
        self.Password = Password
        self.labName = labName
        self.Specialization = Specialization
        self.Location = Location
        self.ContactInfo = ContactInfo
        self.alwaysOpen = alwaysOpen
        //self.openingTime = openingTime
        //self.closingTime = closingTime
    }
}
