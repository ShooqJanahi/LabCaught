//
//  Service.swift
//  LabCaught
//
//  Created by Sara Khalifa Ebrahim Khalifa Hamdan on 19/12/2023.
//

import Foundation
class Service {
    var name: String
    var cost: String
    var describtion: String
    var insrtuctions: String
    
    init(name: String, cost: String, describtion: String, insrtuctions: String) {
        self.name = name
        self.cost = cost
        self.describtion = describtion
        self.insrtuctions = insrtuctions
    }
}