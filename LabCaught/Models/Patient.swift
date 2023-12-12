//
//  Patient.swift
//  LabCaught
//
//  Created by mobileProg on 10/12/2023.
//

import Foundation

struct Patient {
    var CPR: Int
    var DOB: String
    
    
    init(CPR: Int, DOB: String) {
        self.CPR = CPR
        self.DOB = DOB
    }
    
}
