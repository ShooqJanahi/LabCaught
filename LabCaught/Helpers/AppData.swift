//
//  AppData.swift
//  LabCaught
//
//  Created by Nada Naser Ahmed Abdulla Abdulkarim Alawadhi on 19/12/2023.
//



import Foundation

struct AppData {
    
    //to save registered user information
    static func loadFromFile() {
           if let usersData = UserDefaults.standard.data(forKey: "usersData"),
              let decodedUsers = try? JSONDecoder().decode([User].self, from: usersData) {
               users = decodedUsers
           }
       }
       
       // Save users to file
       static func saveToFile() {
           if let encodedData = try? JSONEncoder().encode(users) {
               UserDefaults.standard.set(encodedData, forKey: "usersData")
           }
           
           
    //Users
           var users: [User] = []
    
    //Admin user
           var admins: [Admin] = [
        Admin(username: "admin", password: "admin123", department: "IT", firstName: "Alice", lastName: "Russo", phoneNumber: 12345678)
    ]
    
    
    //Labs
           var facilites = [Facility]()

    
    // Method to check if a username is already in use within the users array
           func isUsernameInUse(username: String) -> Bool {
        return users.contains { $0.username.lowercased() == username.lowercased() } || admins.contains { $0.username.lowercased() == username.lowercased() }
    }
    
    
    //for the users
    extension AppData {
        // Add a new user
        static func addUser(username: String, password: String, phoneNumber: Int, firstName: String, lastName: String, dob: DateComponents, cpr: Int) {
            let newUser = Patient(username: username, password: password, phoneNumber: phoneNumber, firstName: firstName, lastName: lastName, DOB: dob, CPR: cpr)
            users.append(newUser)
            saveToFile()
        }

        // Edit an existing user
        static func editUser(user: User) {
            if let index = users.firstIndex(where: { $0.username == user.username }) {
                users.remove(at: index)
                users.insert(user, at: index)
                saveToFile()
            }
        }

        // Delete a user
        static func deleteUser(user: User) -> Bool {
            if let index = users.firstIndex(where: { $0.username == user.username }) {
                users.remove(at: index)
                saveToFile()
                return true
            }
            return false
        }
        
        // Call loadFromFile at app launch
        static func initializeAppData() {
            loadFromFile()
        }
    }

    
    
    
    
    // ... other static methods or properties ...
    
  //bookings
    static var bookings : [booking] = []
    static var services = [Service]()
    
    static var sampleBookings = [booking(booking_date: DateComponents(calendar: Calendar.current, year: 2023, month: 12, day:22), patient: Patient(username: "maryams", password: "1234", phoneNumber: 39993999, firstName: "Maryam", lastName: "Salah", DOB: DateComponents(calendar: Calendar.current, year: 2003, month: 11, day:22), CPR: 031100000), test: Test(name: "Vitamin B", cost: "3 BHD", describtion: "Blood test is done to check the patiend red and white cells and if they are healthy with no any side affeccts", insrtuctions: "No instruction")),
    
        booking(booking_date: DateComponents(calendar: Calendar.current, year: 2024, month: 01, day:06), patient: Patient(username: "fatiman", password: "4312", phoneNumber: 38883888, firstName: "Fatima", lastName: "Naser", DOB: DateComponents(calendar: Calendar.current, year: 2003, month: 05, day:09), CPR: 030500000), test: Test(name: "Vitamin D", cost: "3 BHD", describtion: "Blood test is done to check the patient's Vitamin D level and if they are healthy with no any side affeccts", insrtuctions: "Fasting for 8 - 10 hours is required"))
    ]
    
    static func load(){
        if bookings.isEmpty {
             bookings = sampleBookings
        }
    

    }
}


extension AppData {
    static func load(){
        //load all data from file
        if facilites.isEmpty {
            facilites = sampleFacilities
        }
    }
    
    static var sampleFacilities = [
        Facility(username: "Royalmedical", password: "123RM", phoneNumber: 17766666, name: "Royal Medical Servises", location: "Riffa, Bhariain", isOpen24Hours: true, openingTime: DateComponents(hour: 8, minute: 0), closingTime: DateComponents(hour: 8, minute: 0), facilityType: .hospital),
        Facility(username: "Royalmedical", password: "123RM", phoneNumber: 17766666, name: "Royal Medical Servises", location: "Riffa, Bhariain", isOpen24Hours: true, openingTime: DateComponents(hour: 8, minute: 0), closingTime: DateComponents(hour: 8, minute: 0), facilityType: .hospital),
        Facility(username: "Royalmedical", password: "123RM", phoneNumber: 17766666, name: "Royal Medical Servises", location: "Riffa, Bhariain", isOpen24Hours: true, openingTime: DateComponents(hour: 8, minute: 0), closingTime: DateComponents(hour: 8, minute: 0), facilityType: .hospital)
    ]
}
