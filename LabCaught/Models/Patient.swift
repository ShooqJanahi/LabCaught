//
//  Patient.swift
//  LabCaught
//
//  Created by mobileProg on 10/12/2023.
//

import Foundation

class Patient {
    var DOB:DateComponents
    var CPR: Int
    
    
    
    init(CPR: Int, DOB: DateComponents) {
        self.CPR = CPR
        self.DOB = DOB

        
    }

    
}
