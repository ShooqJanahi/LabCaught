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
       Labs(Username: "RoyalMedical", Password: "RM123", labName: "Royal Medical Services", Specialization: "Hospital", Location: "Riffa, Bahrain", ContactInfo: 17766666, alwaysOpen: true)
  ]
}
