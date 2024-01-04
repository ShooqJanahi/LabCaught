//
//  Test.swift
//  LabCaught
//
//  Created by Maryam Salah Hashem Adnan Saleh on 13/12/2023.
//

import Foundation
class Test: Service, Equatable {
    static func == (lhs: Test, rhs: Test) -> Bool {
        lhs.name == rhs.name
    }
    
   
    override init(name: String, cost: String, describtion: String, insrtuctions: String, facility: Facility) {
        super.init(name: name, cost: cost, describtion: describtion, insrtuctions: insrtuctions, facility: facility)
    }
    
}
