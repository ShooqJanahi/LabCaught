////
////  Persistence.swift
////  LabCaught
////
////  Created by Nada Naser Ahmed Abdulla Abdulkarim Alawadhi on 04/01/2024.
////
//
//import Foundation
//
//

import Foundation
extension AppData {
    
    // Save patient data to UserDefaults.
    //    static func saveToFile() {
    //        if let encoded = try? JSONEncoder().encode(patient) {
    //            UserDefaults.standard.set(encoded, forKey: "SavedPatients")
    //        }
    //    }
    
    
    
    //        static var users = [User]()
    //        static var bookings = [Booking]()
    //        static var services = [Service]()
    
    
    
     enum FileName: String {
        case patients, facilities, bookings, tests, package
    }
    
    
    fileprivate static func archiveURL(fileName: FileName) -> URL {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsURL.appendingPathComponent(fileName.rawValue).appendingPathExtension("plist")
    }
    
    static func load(){
        print("working1")
        loadUsers(fileName: .facilities)
        print("working12")
        loadUsers(fileName: .patients)
        print("working13")
        loadServices(fileName: .tests)
        print("working14")
        loadServices(fileName: .package)
        print("working15")
        loadBookings()
        
        if bookings.isEmpty {
            bookings = sampleBookings
            print("working2")
        }
        if facilites.isEmpty {
            facilites = sampleFacilities
            print("working3")
        }
        if services.isEmpty {
            services = allTestsPackages
            print("working4")
        }
        if patient.isEmpty{
            patient = samplePatients
            print("working5")
        }
    }
    
    static func saveToFile(){
        print("Saving")
        saveUsers(fileName: .facilities)
        saveUsers(fileName: .patients)
        saveServices(fileName: .tests)
        saveServices(fileName: .package)
        saveBookings()
    }
    
      static func saveUsers(fileName: FileName) {
        let encoder = PropertyListEncoder()
        do {
            if fileName == .patients {
                let patients : [Patient] = patient
                if !patients.isEmpty {
                    print("not empty")
                    let encodedPatients = try encoder.encode(patients)
                    try encodedPatients.write(to: archiveURL(fileName: .patients))
                    print("patient save")
                }
            } else {
                let facilites: [Facility] = facilites
                if !facilites.isEmpty {
                    print("facility not empty")
                    let encodedFacilites = try encoder.encode(facilites)
                    try encodedFacilites.write(to: archiveURL(fileName: .facilities))
                }
            }
        } catch {
            print("Error encoding data: \(error)")
        }
    }
    
      static func loadUsers(fileName: FileName) {
        let url = archiveURL(fileName: fileName)
        guard let data = try? Data(contentsOf: url) else { return }
        do {
            let decoder = PropertyListDecoder()
            var decodedPatient : [Patient] = []
            var decodedFacility : [Facility] = []
            if fileName == .patients {
                decodedPatient = try decoder.decode([Patient].self, from: data)
                patient.append(contentsOf: decodedPatient)
                print("patient load")
                print(patient.count)
            } else {
                decodedFacility = try decoder.decode([Facility].self, from: data)
                facilites.append(contentsOf: decodedFacility)
            }
        } catch {
            print("Error decoding data: \(error)")
        }
    }
    
      static func saveServices(fileName: FileName) {
        let encoder = PropertyListEncoder()
        do {
            if fileName == .tests {
                let tests : [Test] = services.compactMap{ $0 as? Test }
                if !tests.isEmpty {
                    let encodedTests = try encoder.encode(tests)
                    try encodedTests.write(to: archiveURL(fileName: .tests))
                }
            } else {
                let packages: [Packages] = services.compactMap { $0 as? Packages }
                if !packages.isEmpty {
                    let encodedPackages = try encoder.encode(packages)
                    try encodedPackages.write(to: archiveURL(fileName: .package))
                }
            }
        } catch {
            print("Error encoding data: \(error)")
        }
    }
    
      static func loadServices(fileName: FileName) {
        let url = archiveURL(fileName: fileName)
        guard let data = try? Data(contentsOf: url) else { return }
        do {
            let decoder = PropertyListDecoder()
            var decodedServices : [Service] = []
            if fileName == .tests {
                decodedServices = try decoder.decode([Test].self, from: data)
            } else {
                decodedServices = try decoder.decode([Packages].self, from: data)
            }
            services.append(contentsOf: decodedServices)
        } catch {
            print("Error decoding data: \(error)")
        }
        
    }
    
    static func saveBookings() {
        guard bookings.count > 0 else { return}
        let encoder = PropertyListEncoder()
        do {
            let encodedBookings = try encoder.encode(bookings)
            try encodedBookings.write(to: archiveURL(fileName: .bookings))
        }
        catch {
            print("Error encoding data: \(error)")
        }
        print("saving booking is working")
    }
    
    static func loadBookings() {
     let url = archiveURL(fileName: .bookings)
     guard let data = try? Data(contentsOf: url) else { return }
     do {
     let decoder = PropertyListDecoder()
     var decodedBookings : [booking] = []
     decodedBookings = try decoder.decode([booking].self, from: data)
     bookings.append(contentsOf: decodedBookings)
     }catch {
     print("Error decoding data: \(error)")
     }
     }
     
     
    //   fileprivate static func loadBookings() {
    // FileName

}
    
    
    //    static func loadBookings() {
    //        let url = archiveURL(fileName: .bookings)
    //        guard let data = try? Data(contentsOf: url) else {
    //            print("Could not find bookings data.")
    //            return
    //        }
    //        do {
    //            let decoder = PropertyListDecoder()
    //            let decodedBookings = try decoder.decode([booking].self, from: data)
    //            bookings.append(contentsOf: decodedBookings)
    //        } catch {
    //            print("Error decoding bookings data: \(error)")
    //        }
    //    }
    
    
    
    

