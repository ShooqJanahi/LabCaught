//
//  Labs.swift
//  LabCaught
//
//  Created by mobileProg on 10/12/2023.
//

import Foundation

//enum to specify the type of facility
enum FacilityType {
    case hospital
    case lab
    
    //computed property to the enum to provide a string representation fo each case
    var description: String {
            switch self {
            case .hospital:
                return "Hospital"
            case .lab:
                return "Lab"
            }
        }
}

class Labs: User {
    //add the property here
    var Location: String
    var labName :String
    var facilityType :FacilityType
    
    var alwaysOpen: Bool
    var openingTime: DateComponents
    var closingTime: DateComponents
    
    
    init(PhoneNumber: Int, username: String, password: String, confirmPassword: String, userType: UserType, Location: String, labName: String,facilityType :FacilityType,  alwaysOpen: Bool, openingTime: DateComponents, closingTime: DateComponents) {
        self.Location = Location
        self.labName = labName
        self.facilityType = facilityType
        self.alwaysOpen = alwaysOpen
        self.openingTime = openingTime
        self.closingTime = closingTime
        
        super.init(PhoneNumber: PhoneNumber, username: username, password: password, confirmPassword: confirmPassword, userType: .lab)
    }
        
}
