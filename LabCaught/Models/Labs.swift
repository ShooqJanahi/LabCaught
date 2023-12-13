//
//  Labs.swift
//  LabCaught
//
//  Created by mobileProg on 10/12/2023.
//

import Foundation

class Lab {
    //add the property here
    var Location: String //Example
    var labName :String
    var phone: Int
    var alwaysOpen: Bool
    var openingTime: DateComponents
    var closingTime: DateComponents
    
    
    init(Location: String, labName: String, phone: Int, alwaysOpen: Bool, openingTime: DateComponents, closingTime: DateComponents){
        self.Location = Location
        self.labName = labName
        self.phone = phone
        self.alwaysOpen = alwaysOpen
        self.closingTime = closingTime
        self.openingTime = openingTime
    }
}
