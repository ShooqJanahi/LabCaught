//
//  AppData.swift
//  LabCaught
//
//  Created by Nada Naser Ahmed Abdulla Abdulkarim Alawadhi on 19/12/2023.
//



import Foundation

struct AppData {
    static var users: [User] = []
    static var admins: [Admin] = [
        Admin(username: "admin", password: "admin123", department: "IT", firstName: "Alice", lastName: "Russo", phoneNumber: 12345678)
    ]
    static var facilites: [Facility] = []
    static var bookings: [Booking] = []
    static var services: [Service] = []
    
    // Example bookings
    static var sampleBookings: [Booking] = [
        // ... Your sample bookings ...
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





    
    static var sampleFacilities = [
        Facility(username: "Royalmedical", password: "123RM", phoneNumber: 17766666, name: "Royal Medical Servises", location: "Riffa, Bhariain", isOpen24Hours: true, openingTime: DateComponents(hour: 8, minute: 0), closingTime: DateComponents(hour: 8, minute: 0), facilityType: .hospital),
        Facility(username: "Royalmedical", password: "123RM", phoneNumber: 17766666, name: "Royal Medical Servises", location: "Riffa, Bhariain", isOpen24Hours: true, openingTime: DateComponents(hour: 8, minute: 0), closingTime: DateComponents(hour: 8, minute: 0), facilityType: .hospital),
        Facility(username: "Royalmedical", password: "123RM", phoneNumber: 17766666, name: "Royal Medical Servises", location: "Riffa, Bhariain", isOpen24Hours: true, openingTime: DateComponents(hour: 8, minute: 0), closingTime: DateComponents(hour: 8, minute: 0), facilityType: .hospital)
    ]

