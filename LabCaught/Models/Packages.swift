//
//  packages.swift
//  LabCaught
//
//  Created by Maryam Salah Hashem Adnan Saleh on 13/12/2023.
//

import Foundation
class Packages : Service {
    
    var packageIncludes: [Test]
    var packageExpiry: DateComponents
    //var isLab: Bool
    //var tests: [test]
    
    
    init(name: String, cost: String, describtion: String, insrtuctions: String, packageIncludes: [Test], packageExpiry: DateComponents, facility: Facility) {
        self.packageIncludes = packageIncludes
        self.packageExpiry = packageExpiry
        
        super.init(name: name, cost: cost, describtion: describtion, insrtuctions: insrtuctions, facility: facility)
    }
    
}
