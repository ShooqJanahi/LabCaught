//
//  Labs.swift
//  LabCaught
//
//  Created by mobileProg on 10/12/2023.
//

import Foundation

class Labs: User {
    var location: String
    var labName: String
    var alwaysOpen: Bool
    var openingTime: DateComponents
    var closingTime: DateComponents
    
    init(username: String, password: String, name: String, location: String, labName: String, alwaysOpen: Bool, openingTime: DateComponents, closingTime: DateComponents) {
        self.location = location
        self.labName = labName
        self.alwaysOpen = alwaysOpen
        self.openingTime = openingTime
        self.closingTime = closingTime
        super.init(username: username, password: password, createdOn: Date(), confirmPassword: confirmPassword, phoneNumber: phoneNumber)

    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        location = try container.decode(String.self, forKey: .location)
        labName = try container.decode(String.self, forKey: .labName)
        alwaysOpen = try container.decode(Bool.self, forKey: .alwaysOpen)
        openingTime = try container.decode(DateComponents.self, forKey: .openingTime)
        closingTime = try container.decode(DateComponents.self, forKey: .closingTime)
        try super.init(from: try container.superDecoder())
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(location, forKey: .location)
        try container.encode(labName, forKey: .labName)
        try container.encode(alwaysOpen, forKey: .alwaysOpen)
        try container.encode(openingTime, forKey: .openingTime)
        try container.encode(closingTime, forKey: .closingTime)
        try super.encode(to: container.superEncoder())
    }
    
    private enum CodingKeys: String, CodingKey {
        case location, labName, alwaysOpen, openingTime, closingTime
    }
}

