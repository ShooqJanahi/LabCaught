//
//  AppData.swift
//  LabCaught
//
//  Created by Nada Naser Ahmed Abdulla Abdulkarim Alawadhi on 19/12/2023.
//



import Foundation

// This class acts as a central data store for the app.
class AppData {
    // Array to store registered users.
    static var users: [User] = []
    // Array to store registered patients.
    static var patient: [Patient] = []
    
    // Pre-defined admin user with initial credentials.
    static var admins: [Admin] = [Admin(username: "admin", password: "admin123", department: "IT", firstName: "Alice", lastName: "Russo", phoneNumber: 12345678)]
    

    // Saving the logged-in username to UserDefaults.
        static func saveLoggedInUsername(username: String) {
            UserDefaults.standard.set(username, forKey: "LoggedInUsername")
        }

        // Retrieving the logged-in username from UserDefaults.
        static func getLoggedInUsername() -> String? {
            return UserDefaults.standard.string(forKey: "LoggedInUsername")
        }
    
     // Array to store facility information.
    static var facilites = [Facility]()
    // Array to store booking information.
    static var bookings: [booking] = []
    // Array to store service information.
    static var services = [Service]()
    
    // Sample patient data for testing purposes.
    static var samplePatients: [Patient] = [
        Patient(username: "sa56", password: "7655", phoneNumber: 33234455, firstName: "Saleh", lastName: "ahmed", DOB: DateComponents(calendar: Calendar.current, year: 2009, month: 1, day:2), CPR: 091000000),
        
        Patient(username: "hessa5", password: "hasoos", phoneNumber: 0909098, firstName: "Hessa", lastName: "Fadhel", DOB: DateComponents(calendar: Calendar.current, year: 2002, month: 1, day:2), CPR: 021176524),
        
        Patient(username: "Fahad22", password: "fahad5454", phoneNumber: 777532424, firstName: "Fahad", lastName: "Ali", DOB: DateComponents(calendar: Calendar.current, year: 2002, month: 1, day:2), CPR: 7720829),
        
        Patient(username: "maryams", password: "1234", phoneNumber: 39993999, firstName: "Maryam", lastName: "Salah", DOB: DateComponents(calendar: Calendar.current, year: 2003, month: 11, day:22), CPR: 031100000),
        
        Patient(username: "fatimaa", password: "3143", phoneNumber: 38883888, firstName: "Fatima", lastName: "Ali", DOB: DateComponents(calendar: Calendar.current, year: 2003, month: 05, day:09), CPR: 030500000)
    ]
    
    
    // Facility instances for dummy data.
    static var Facility1 = Facility(username: "Alhilal",
                                    password: "12345",
                                    phoneNumber: 17001700,
                                    name: "Al Hilal Hospital",
                                    location: "Riffa, Bahrain",
                                    isOpen24Hours: true,
                                    openingTime: DateComponents(hour: 8, minute: 0),
                                    closingTime: DateComponents(hour: 8, minute: 0),
                                    facilityType: .hospital,
                                    logoImageName: "")
    
    static var Facility2 = Facility(username: "Alsalam",
                                    password: "12345",
                                    phoneNumber: 17001700,
                                    name: "Al Salam Hospital",
                                    location: "Muharraq, Bahrain",
                                    isOpen24Hours: true,
                                    openingTime: DateComponents(hour: 8, minute: 0),
                                    closingTime: DateComponents(hour: 8, minute: 0),
                                    facilityType: .hospital,
                                    logoImageName: "")
    
    static var Facility3 = Facility(username: "alhilal",
                                    password: "123RM", phoneNumber: 17766666,
                                    name: "Alhilal Medical Servises",
                                    location: "Riffa, Bahrain",
                                    isOpen24Hours: true,
                                    openingTime: DateComponents(hour: 8, minute: 0),
                                    closingTime: DateComponents(hour: 8, minute: 0),
                                    facilityType: .hospital,
                                    logoImageName: "")
    
    static var Facility4 = Facility(username: "KHamadUni",
                                    password: "123RM",
                                    phoneNumber: 17444444,
                                    name: "King Hamad University Hospital ",
                                    location: "Busaiteen, Bahrain",
                                    isOpen24Hours: true,
                                    openingTime: DateComponents(hour: 8, minute: 0),
                                    closingTime: DateComponents(hour: 20, minute: 0),
                                    facilityType: .hospital,
                                    logoImageName: "")
    
    static var Facility5 = Facility(username: "MedicalLabortary",
                                    password: "123RM",
                                    phoneNumber: 17255522,
                                    name: "Bahrain medical labortary",
                                    location: "Salmaniya, Bahrain",
                                    isOpen24Hours: true,
                                    openingTime: DateComponents(hour: 7, minute: 0),
                                    closingTime: DateComponents(hour: 17, minute: 0),
                                    facilityType: .lab,
                                    logoImageName: "")
    
    static var Facility6 = Facility(username: "ThyrocareGulf",
                                    password: "123RM",
                                    phoneNumber: 66004000,
                                    name: "Thyrocare Gulf Laboratories",
                                    location: "Sanabis, Bahrain",
                                    isOpen24Hours: false,
                                    openingTime: DateComponents(hour: 9, minute: 0),
                                    closingTime: DateComponents(hour: 17, minute: 0),
                                    facilityType: .lab,
                                    logoImageName: "")
    
    static var Facility7 = Facility(username: "AlKindi",
                                        password: "123Ak",
                                        phoneNumber: 17240444,
                                        name: "Al Kindi Hospital",
                                        location: "Manama, Bahrain",
                                        isOpen24Hours: true,
                                        openingTime: DateComponents(hour: 8, minute: 0),
                                        closingTime: DateComponents(hour: 20, minute: 0),
                                        facilityType: .hospital,
                                        logoImageName: "")
        
        static var Facility8 = Facility(username: "AlNafees",
                                        password: "123An",
                                        phoneNumber: 17828282,
                                        name: "Ibn Al-Nafees Hospital",
                                        location: "Manama, Bahrain",
                                        isOpen24Hours: true,
                                        openingTime: DateComponents(hour: 8, minute: 0),
                                        closingTime: DateComponents(hour: 20, minute: 0),
                                        facilityType: .hospital,
                                        logoImageName: "")
        
        static var Facility9 = Facility(username: "BlossomMedical",
                                        password: "123RM",
                                        phoneNumber: 17179316,
                                        name: "Blossom Medical",
                                        location: "Isa Town, Bahrain",
                                        isOpen24Hours: false,
                                        openingTime: DateComponents(hour: 7, minute: 0),
                                        closingTime: DateComponents(hour: 22, minute: 0),
                                        facilityType: .lab,
                                        logoImageName: "")
        
        static var Facility10 = Facility(username: "AsterClinic",
                                        password: "123Ac",
                                        phoneNumber: 17711811,
                                        name: "Aster Clinic",
                                        location: "Sanad, Bahrain",
                                        isOpen24Hours: false,
                                        openingTime: DateComponents(hour: 7, minute: 0),
                                        closingTime: DateComponents(hour: 23, minute: 0),
                                        facilityType: .lab,
                                        logoImageName: "")
        
        static var Facility11 = Facility(username: "AlResalah",
                                        password: "123Ar",
                                        phoneNumber: 17680088,
                                        name: "Al Resalah Medical Center",
                                        location: "Isa Town, Bahrain",
                                        isOpen24Hours: true,
                                        openingTime: DateComponents(hour: 8, minute: 0),
                                        closingTime: DateComponents(hour: 20, minute: 0),
                                        facilityType: .lab,
                                        logoImageName: "")
        
        static var Facility12 = Facility(username: "AlRayan",
                                        password: "123Ar",
                                        phoneNumber: 17495500,
                                        name: "Al Rayan Medical Complex",
                                        location: "Riffa, Bahrain",
                                        isOpen24Hours: true,
                                        openingTime: DateComponents(hour: 8, minute: 0),
                                        closingTime: DateComponents(hour: 20, minute: 0),
                                        facilityType: .lab,
                                        logoImageName: "")
        
        
        // Array of sample facilities.
        static var sampleFacilities: [Facility] = [Facility1, Facility2, Facility3, Facility4, Facility5, Facility6, Facility7, Facility8, Facility9, Facility10, Facility11, Facility12] {
        didSet {
            saveFacilities() // Save facilities when the array is updated.
        }
    }

    // Function to save facility data to UserDefaults.
    static func saveFacilities() {
        if let encodedData = try? JSONEncoder().encode(sampleFacilities) {
            UserDefaults.standard.set(encodedData, forKey: "facilities")
        }
    }

    // Function to load facility data from UserDefaults.
    static func loadFacilities() {
        if let savedFacilities = UserDefaults.standard.object(forKey: "facilities") as? Data {
            if let decodedFacilities = try? JSONDecoder().decode([Facility].self, from: savedFacilities) {
                sampleFacilities = decodedFacilities
            }
        }
    }
    
    
    // Sample test data for testing purposes.
    static var test1 = Test(name: "Vitamin D",
                            cost: "3 BHD",
                            describtion: "Blood test is done to check the patient's Vitamin D level and if they are healthy with no affeccts",
                            insrtuctions: "Fasting for 8 - 10 hours is required",
                            facility: sampleFacilities[0])
    
    static var test2 = Test(name: "Vitamin B12",
                            cost: "3 BHD",
                            describtion: "Blood test is done to check the patient's Vitamin B12 level and if they are healthy with no any side affeccts",
                            insrtuctions: "Fasting for 8 - 10 hours is required",
                            facility: sampleFacilities[1])
    
    static var test3 = Test(name: "Vitamin A",
                            cost: "2 BHD",
                            describtion: "Blood test is done to check the patient's Vitamin B12 level and if they are healthy with no any side affeccts",
                            insrtuctions: "Fasting for 5 hours is required",
                            facility: sampleFacilities[1])
    
    static var test4 = Test(name: "Vitamin B12",
                            cost: "3 BHD",
                            describtion: "Blood test is done to check the patient's Vitamin B12 level and if they are healthy with no any side affeccts",
                            insrtuctions: "Fasting for 8 - 10 hours is required",
                            facility: sampleFacilities[0])

    
    static var tests: [Test] = [test1,test2, test3, test4]
    
    
    // Packages data for testing purposes.
    static var package1 = Packages(name: "Basic Wellness Package", cost: "15 BHD", describtion: "This package includes essential health screenings, such as blood pressure, cholesterol, and blood sugar tests.", insrtuctions: "No fasting required. Please stay hydrated.", packageIncludes: [test1, test4], packageExpiry: DateComponents(calendar: Calendar.current, year: 2023, month: 6, day:2), facility: sampleFacilities[0])
    
    static var package2 = Packages(name: "Healthy life Package", cost: "10 BHD", describtion: "A package that containes 2 test which are vitamans A and C", insrtuctions: "fasting for 5 hours are required", packageIncludes: [test2, test3], packageExpiry: DateComponents(calendar: Calendar.current, year: 2002, month: 1, day:2), facility: sampleFacilities[1])
    
    static var packages: [Packages] = [package1, package2]

    // Combined array of all tests and packages.
    static var allTestsPackages: [Service] = [test1,test2, test3,test4, package1, package2]
    /*    moved them up with other facility data
     static var sampleFacilities = [
     Facility(username: "Royalmedical", password: "123RM", phoneNumber: 17766666, name: "Alhilal Medical Servises", location: "Riffa, Bahrain", isOpen24Hours: true, openingTime: DateComponents(hour: 8, minute: 0), closingTime: DateComponents(hour: 8, minute: 0), facilityType: .hospital),
     Facility(username: "Royalmedical", password: "123RM", phoneNumber: 17766666, name: "Royal Medical Servises", location: "Muharraq, Bahrain", isOpen24Hours: true, openingTime: DateComponents(hour: 8, minute: 0), closingTime: DateComponents(hour: 8, minute: 0), facilityType: .hospital),
     Facility(username: "Royalmedical", password: "123RM", phoneNumber: 17766666, name: "Royal Medical Servises", location: "Riffa, Bahrain", isOpen24Hours: true, openingTime: DateComponents(hour: 8, minute: 0), closingTime: DateComponents(hour: 8, minute: 0), facilityType: .lab)
     ]
     
     */
    
    //bookings Dummy Data
    static var sampleBookings = [
        booking(booking_date: DateComponents(calendar: Calendar.current, year: 2023, month: 12, day:22), patient: samplePatients[3], medicalService: tests[1]),
        
        booking(booking_date: DateComponents(calendar: Calendar.current, year: 2023, month: 12, day:22), patient: samplePatients[4], medicalService: tests[0])
    ]
    
    // Method to check if a username is already in use.
    static func isUsernameInUse(username: String) -> Bool {
        return users.contains { $0.username.lowercased() == username.lowercased() } ||
        admins.contains { $0.username.lowercased() == username.lowercased() }
    }
    
    // ... other static methods or properties ...
    
    
    // Load initial data or settings.
    static func load() {
        // Load all data from file or initial settings
        if bookings.isEmpty {
            bookings = sampleBookings
        }
        if facilites.isEmpty {
            facilites = sampleFacilities
        }
        if services.isEmpty {
            services = allTestsPackages
        }
        if patient.isEmpty{
            patient = samplePatients
        }
        // Load other user data if necessary
        loadFromFile()
    }
    
    //don't touch this (this is for saving registerd user information
     // Function to add a new user to the patient array and save it.
    static func addUser(username: String, password: String, phoneNumber: Int, firstName: String, lastName: String, dob: DateComponents, cpr: Int) {
        let newUser = Patient(username: username, password: password, phoneNumber: phoneNumber, firstName: firstName, lastName: lastName, DOB: dob, CPR: cpr)
        patient.append(newUser)
        saveToFile()
    }

    
    // Edit an existing user's information.
    static func editUser(user: User) {
        if let index = users.firstIndex(where: { $0.username == user.username }) {
            users.remove(at: index)
            users.insert(user, at: index)
            saveToFile()
        }
    }

    // Delete a user from the array.
    static func deleteUser(user: User) -> Bool {
        if let index = users.firstIndex(where: { $0.username == user.username }) {
            users.remove(at: index)
            saveToFile()
            return true
        }
        return false
    }
    
    //this for the registered patient
    // Load data from UserDefaults
    static func loadFromFile() {
        if let savedPatients = UserDefaults.standard.object(forKey: "SavedPatients") as? Data {
            if let decodedPatients = try? JSONDecoder().decode([Patient].self, from: savedPatients) {
                patient = decodedPatients
            }
        }
        
    }
    
    // Save patient data to UserDefaults.
    static func saveToFile() {
        if let encoded = try? JSONEncoder().encode(patient) {
            UserDefaults.standard.set(encoded, forKey: "SavedPatients")
        }
    }
    //don't touch this (this is to save registerd user information)
    
    
    
    // Call this method when you want to initialize your app data.
    // Initialize app data, primarily by loading from UserDefaults.
    static func initializeAppData() {
        // Load user data from UserDefaults.
        loadFromFile()
        // Load other initial settings as needed.
    }
    
    //nada's methods
    // maybe i should take this function to the appData page
    static func getServices(facility: Facility) -> [Service]{
        return services.filter { $0.facility.username == facility.username}
    }
    
    
    
}

// Extension to manage facility-related functionalities.
extension AppData {
    // Retrieve a facility by username.
    static func getFacility(username: String) -> Facility? {
        facilites.first(where: { $0.username == username })
    }

    // Add a new facility to the array.
    static func addFacility(facility: Facility) {
        facilites.append(facility)
        saveToFile()
    }
    // Edit an existing facility's information.
    static func editFacility(facility: Facility) {
        if let index = facilites.firstIndex(of: facility) {
            facilites.remove(at: index)
            facilites.insert(facility, at: index)
            saveToFile()
        }
    }

    // Delete a facility from the array.
    static func deleteFacility(facility: Facility) {
        let index = AppData.facilites.firstIndex(of: facility) ?? 0
        if let _ = AppData.facilites.first(where: { $0.facilityType == .hospital }){
            
        }
        if let _ = AppData.facilites.first(where: { $0.facilityType == .lab }){
            
        }
        AppData.facilites.remove(at: index)
        saveToFile()
        
    }
}
