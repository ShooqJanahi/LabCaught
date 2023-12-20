//
//  AppData.swift
//  LabCaught
//
//  Created by Nada Naser Ahmed Abdulla Abdulkarim Alawadhi on 19/12/2023.
//



import Foundation

struct AppData {
    static var users: [User] = []
    static var admins: [Admin] = [Admin(username: "admin", password: "admin123", department: "IT", firstName: "Alice", lastName: "Russo", phoneNumber: 12345678)]
    static var facilites: [Facility] = []
    static var bookings: [booking] = []
    static var services: [Service] = []
    
   /* static var labs: [Facility] = [
           Facility(username: "Alhilal",
                    password: "12345",
                    phoneNumber: 17001700,
                    name: "Alhilal Hospital",
                    location: "Riffa",
                    isOpen24Hours: true,
                    openingTime: DateComponents(calendar: Calendar.current, hour: 0, minute: 0),
                    closingTime: DateComponents(calendar: Calendar.current, hour: 0, minute: 0),
                    facilityType: .hospital),
           Facility(username: "Alsalam",
                    password: "12345",
                    phoneNumber: 17001700,
                    name: "Alsalam Hospital",
                    location: "Muharraq",
                    isOpen24Hours: true,
                    openingTime: DateComponents(calendar: Calendar.current, hour: 0, minute: 0),
                    closingTime: DateComponents(calendar: Calendar.current, hour: 0, minute: 0),
                    facilityType: .hospital
                   )
       ]*/
    //bookings
      //static var l1 = [facilites]()
      
      
      static var sampleBookings = [
        booking(booking_date: DateComponents(calendar: Calendar.current, year: 2023, month: 12, day:22), patient: Patient(username: "maryams", password: "1234", phoneNumber: 39993999, firstName: "Maryam", lastName: "Salah", DOB: DateComponents(calendar: Calendar.current, year: 2003, month: 11, day:22), CPR: 031100000), medicalService: Test(name: "Vitamin D", cost: "3 BHD", describtion: "Blood test is done to check the patient's Vitamin D level and if they are healthy with no any side affeccts", insrtuctions: "Fasting for 8 - 10 hours is required", facility: sampleFacilities[0])),
        
        booking(booking_date: DateComponents(calendar: Calendar.current, year: 2023, month: 12, day:22), patient: Patient(username: "fatimaa", password: "3143", phoneNumber: 38883888, firstName: "Fatima", lastName: "Ali", DOB: DateComponents(calendar: Calendar.current, year: 2003, month: 05, day:09), CPR: 030500000), medicalService: Test(name: "Vitamin B12", cost: "3 BHD", describtion: "Blood test is done to check the patient's Vitamin B12 level and if they are healthy with no any side affeccts", insrtuctions: "Fasting for 8 - 10 hours is required", facility: sampleFacilities[1]))
]
    
    static func isUsernameInUse(username: String) -> Bool {
        return users.contains { $0.username.lowercased() == username.lowercased() } ||
               admins.contains { $0.username.lowercased() == username.lowercased() }
    }
    
    // ... other static methods or properties ...

    static func load() {
        // Load all data from file or initial settings
        if bookings.isEmpty {
            bookings = sampleBookings
        }
        if facilites.isEmpty {
            facilites = sampleFacilities
        }
        // Load other user data if necessary
        loadFromFile()
    }

    static func addUser(username: String, password: String, phoneNumber: Int, firstName: String, lastName: String, dob: DateComponents, cpr: Int) {
        let newUser = Patient(username: username, password: password, phoneNumber: phoneNumber, firstName: firstName, lastName: lastName, DOB: dob, CPR: cpr)
        users.append(newUser)
        saveToFile()
    }

    static func editUser(user: User) {
        if let index = users.firstIndex(where: { $0.username == user.username }) {
            users.remove(at: index)
            users.insert(user, at: index)
            saveToFile()
        }
    }

    static func deleteUser(user: User) -> Bool {
        if let index = users.firstIndex(where: { $0.username == user.username }) {
            users.remove(at: index)
            saveToFile()
            return true
        }
        return false
    }

    // Placeholder for the loadFromFile method
    static func loadFromFile() {
        // Implement your loading logic here, e.g. using UserDefaults or reading from a file
    }

    // Placeholder for the saveToFile method
    static func saveToFile() {
        // Implement your saving logic here, e.g. using UserDefaults or writing to a file
    }
    
    // Call the initialize method from your AppDelegate or SceneDelegate
    static func initializeAppData() {
        load()
    }
}




extension AppData {
    
    static var sampleFacilities = [
        Facility(username: "Royalmedical", password: "123RM", phoneNumber: 17766666, name: "Royal Medical Servises", location: "Riffa, Bahrain", isOpen24Hours: true, openingTime: DateComponents(hour: 8, minute: 0), closingTime: DateComponents(hour: 8, minute: 0), facilityType: .hospital),
        Facility(username: "Royalmedical", password: "123RM", phoneNumber: 17766666, name: "Royal Medical Servises", location: "Riffa, Bahrain", isOpen24Hours: true, openingTime: DateComponents(hour: 8, minute: 0), closingTime: DateComponents(hour: 8, minute: 0), facilityType: .hospital),
        Facility(username: "Royalmedical", password: "123RM", phoneNumber: 17766666, name: "Royal Medical Servises", location: "Riffa, Bahrain", isOpen24Hours: true, openingTime: DateComponents(hour: 8, minute: 0), closingTime: DateComponents(hour: 8, minute: 0), facilityType: .hospital)
    ]
}

