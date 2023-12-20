import Foundation

//enum to specify the type of facility
enum FacilityType: String, Codable{
    case hospital
    case lab
    
    //computed property to the enum to provide a string representation fo each
    var description: String{
        switch self{
            case.hospital:
                return "Hospital"
            case.lab:
                return "Lab"
        }
    }
}

class Facility: User{
    var name: String
    var location: String
    var isOpen24Hours: Bool
    var openingTime: DateComponents
    var closingTime: DateComponents
    var facilityType: FacilityType
    
    init(username: String, password: String, phoneNumber: Int, name: String, location: String, isOpen24Hours: Bool, openingTime: DateComponents, closingTime: DateComponents, facilityType: FacilityType) {
        self.name = name
        self.location = location
        self.isOpen24Hours = isOpen24Hours
        self.openingTime = openingTime
        self.closingTime = closingTime
        self.facilityType = facilityType

        super.init(username: username, password: password, createdOn: Date(),  phoneNumber: phoneNumber)
    }
    

    required init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
            name = try container.decode(String.self, forKey: .name)
            location = try container.decode(String.self, forKey: .location)
            isOpen24Hours = try container.decode(Bool.self, forKey: .isOpen24Hours)
            openingTime = try container.decode(DateComponents.self, forKey: .openingTime)
            closingTime = try container.decode(DateComponents.self, forKey: .closingTime)
            facilityType = try container.decode(FacilityType.self, forKey: .facilityType)
            try super.init(from: decoder)
    }
    
    override func encode(to encoder: Encoder) throws{
        var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(name, forKey: .name)
            try container.encode(location, forKey: .location)
            try container.encode(isOpen24Hours, forKey: .isOpen24Hours)
            try container.encode(openingTime, forKey: .openingTime)
            try container.encode(closingTime, forKey: .closingTime)
            try container.encode(facilityType, forKey: .facilityType)
            try super.encode(to: encoder)
    }
    
    private enum CodingKeys: String, CodingKey{
            case name, location, isOpen24Hours, openingTime, closingTime, facilityType
    }
}
