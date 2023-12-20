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
    
    
    init(name: String, cost: String, describtion: String, insrtuctions: String, packageIncludes: [Test], packageExpiry: DateComponents, lab: Labs ) {
        self.packageIncludes = packageIncludes
        self.packageExpiry = packageExpiry
        
        super.init(name: name, cost: cost, describtion: describtion, insrtuctions: insrtuctions, lab: lab)
    }
    
}
    
    
    
    
    /*init(package: String, cost: String, describtion: String, insrtuctions: String, package_includes: [test], package_expiry: DateComponents,lab:Labs) {
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
    */
 

