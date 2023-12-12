//
//  Patient.swift
//  LabCaught
//
//  Created by mobileProg on 10/12/2023.
//

import Foundation

struct Patient {
    var DOB: String //Date of birth
    var CPR: Int
    
    
    init(DOB: String, CPR: Int) {
        self.DOB = DOB
        self.CPR = CPR
    }
}
