//
//  packages.swift
//  LabCaught
//
//  Created by Maryam Salah Hashem Adnan Saleh on 13/12/2023.
//

import Foundation
class packages{
    var package:String
    var cost:String
    var describtion:String
    var insrtuctions:String
    var package_includes:[test]
    var package_expiry:DateComponents
    //var isLab: Bool
    var lab: Lab!
    //var tests: [test]
    
    
    init(package: String, cost: String, describtion: String, insrtuctions: String, package_includes: [test], package_expiry: DateComponents,lab:Lab) {
        self.package = package
        self.cost = cost
        self.describtion = describtion
        self.insrtuctions = insrtuctions
        self.package_includes = package_includes
        self.package_expiry = package_expiry
        self.lab = lab
    }
    
    init(package: String, cost: String, describtion: String, insrtuctions: String, package_includes: [test], package_expiry: DateComponents) {
        self.package = package
        self.cost = cost
        self.describtion = describtion
        self.insrtuctions = insrtuctions
        self.package_includes = package_includes
        self.package_expiry = package_expiry
        
    }
    
}
