//
//  LabData.swift
//  LabCaught
//
//  Created by Shaikha Hasan Ali Hasan Ali Mohamed on 13/12/2023.
//

import Foundation

class LabData {
    static var labs = [Labs]()
    
    static func load(){
        
       if labs.isEmpty {
           labs = sampleLabs
        }
  }
    
   static var sampleLabs = [
    Labs(PhoneNumber: 17766666, username: "RoayalMedical", password: "123RM", confirmPassword: "123RM", userType: .lab, Location: "Riffa, Bahrain", labName: "Royal Medical Services", facilityType: .hospital, alwaysOpen: true, openingTime: DateComponents(hour: 8, minute: 0), closingTime: DateComponents(hour: 18, minute: 0))
  ]
}
