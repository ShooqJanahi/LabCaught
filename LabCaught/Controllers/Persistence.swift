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
//extension AppData {
//
//
//    static var bookingIDInt: Int = 1
//
//
//        enum FileName: String {
//            case patients, facilities, bookings, tests, package
//        }
//
//        static func archiveURL(fileName: FileName) -> URL {
//            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//            return documentsURL.appendingPathComponent(fileName.rawValue).appendingPathExtension("plist")
//        }
//
//        static func saveUsers(fileName: FileName) {
//            let encoder = PropertyListEncoder()
//            do {
//                if fileName == .patients {
//                    let patients : [Patient] = users.compactMap{ $0 as? Patient }
//                    if !patients.isEmpty {
//                        let encodedPatients = try encoder.encode(patients)
//                        try encodedPatients.write(to: archiveURL(fileName: .patients))
//                    }
//                } else {
//                    let facilites: [Facility] = users.compactMap { $0 as? Facility }
//                    if !facilites.isEmpty {
//                        let encodedFacilites = try encoder.encode(facilites)
//                        try encodedFacilites.write(to: archiveURL(fileName: .facilities))
//                    }
//                }
//
//            } catch {
//                print("Error encoding data: \(error)")
//            }
//        }
//
//        static func loadUsers(fileName: FileName) {
//            let url = archiveURL(fileName: fileName)
//            guard let data = try? Data(contentsOf: url) else { return }
//            do {
//                let decoder = PropertyListDecoder()
//                var decodedUsers : [User] = []
//                if fileName == .patients {
//                    decodedUsers = try decoder.decode([Patient].self, from: data)
//                } else {
//                    decodedUsers = try decoder.decode([Facility].self, from: data)
//                }
//                users.append(contentsOf: decodedUsers)
//            } catch {
//                print("Error decoding data: \(error)")
//            }
//        }
//
//        static func saveServices(fileName: FileName) {
//            let encoder = PropertyListEncoder()
//            do {
//                if fileName == .tests {
//                    let tests : [Test] = services.compactMap{ $0 as? Test }
//                    if !tests.isEmpty {
//                        let encodedTests = try encoder.encode(tests)
//                        try encodedTests.write(to: archiveURL(fileName: .tests))
//                    }
//                } else {
//                    let packages: [Packages] = services.compactMap { $0 as? Packages }
//                    if !packages.isEmpty {
//                        let encodedPackages = try encoder.encode(packages)
//                        try encodedPackages.write(to: archiveURL(fileName: .package))
//                    }
//                }
//
//            } catch {
//                print("Error encoding data: \(error)")
//            }
//        }
//
////        static func loadServices(fileName: FileName) {
////            let url = archiveURL(fileName: fileName)
////            guard let data = try? Data(contentsOf: url) else { return }
////            do {
////                let decoder = PropertyListDecoder()
////                var decodedServices : [Service] = []
////                if fileName == .tests {
////                    decodedServices = try decoder.decode([Test].self, from: data)
////                } else {
////                    decodedServices = try decoder.decode([Packages].self, from: data)
////                }
////                services.append(contentsOf: decodedServices)
////            } catch {
////                print("Error decoding data: \(error)")
////            }
////        }
//
//        static func loadServices(fileName: FileName) {
//           let url = archiveURL(fileName: fileName)
//           guard let data = try? Data(contentsOf: url) else { return }
//           do {
//               let decoder = PropertyListDecoder()
//               var decodedServices : [Service] = []
//               if fileName == .tests {
//                   decodedServices = try decoder.decode([Test].self, from: data)
//               } else {
//                   //decodedServices = try decoder.decode([packages].self, from: data)
//               }
//               services.append(contentsOf: decodedServices)
//           } catch {
//               print("Error decoding data: \(error)")
//           }
//        }
//        static func saveBookings() {
//            guard bookings.count > 0 else { return}
//
//            let encoder = PropertyListEncoder()
//            do {
//                let encodedBookings = try encoder.encode(bookings)
//                try encodedBookings.write(to: archiveURL(fileName: .bookings))
//                    }
//            catch {
//                print("Error encoding data: \(error)")
//            }
//        }
//    //    static func saveBookings() {
//    //       guard bookings.count > 0 else { return}
//    //
//    //       let encoder = PropertyListEncoder()
//    //       do {
//    //           for booking in bookings {
//    //               let encodedBooking = try encoder.encode(booking)
//    //               try encodedBooking.write(to: archiveURL(fileName: .bookings))
//    //           }
//    //       } catch {
//    //           print("Error encoding data: \(error)")
//    //       }
//    //    }
//    //     static func loadBookings() {
//    //        let url = archiveURL(fileName: .bookings)
//    //        guard let data = try? Data(contentsOf: url) else { return }
//    //        do {
//    //            let decoder = PropertyListDecoder()
//    //            var decodedBookings : [Booking] = []
//    //            var offset = 0
//    //            while offset < data.count {
//    //                let lengthSize = MemoryLayout<Int>.size
//    //                let range = NSRange(location: offset, length: lengthSize)
//    //                let sizeData = (data as NSData).subdata(with: range)
//    //                let size = sizeData.withUnsafeBytes { $0.load(as: Int.self) }
//    //                if offset + lengthSize + size > data.count {
//    //                    break
//    //                }
//    //                let bookingRange = NSRange(location: offset + lengthSize, length: size)
//    //                let bookingData = (data as NSData).subdata(with: bookingRange)
//    //                let booking = try decoder.decode(Booking.self, from: bookingData)
//    //                decodedBookings.append(booking)
//    //                offset += lengthSize + size
//    //            }
//    //            bookings.append(contentsOf: decodedBookings)
//    //            print("decoded bookings \(decodedBookings.count)")
//    //        } catch {
//    //            print("Error decoding data: \(error)")
//    //        }    }
//        static func loadBookings() {
//            let url = archiveURL(fileName: .bookings)
//            guard let data = try? Data(contentsOf: url) else { return }
//            do {
//                let decoder = PropertyListDecoder()
//                var decodedBookings : [booking] = []
//                decodedBookings = try decoder.decode([booking].self, from: data)
//                bookings.append(contentsOf: decodedBookings)
//            }catch {
//                print("Error decoding data: \(error)")
//            }
//        }
//
//    //    static let bookingIdDictionary = ["BookingID":bookingIDInt]
//    //    static func saveBookingIDValue() {
//    //        let encoder = PropertyListEncoder()
//    //        do {
//    //            let encodedBookingID = try encoder.encode(bookingIdDictionary)
//    //            try encodedBookingID.write(to: archiveURL(fileName: .bookingID))
//    //        }
//    //        catch {
//    //            print("Error encoding data: \(error)")
//    //        }
//    //    }
//    //    static func loadBookingIDValue(){
//    //        let url = archiveURL(fileName: .bookingID)
//    //        guard let data = try? Data(contentsOf: url) else {return}
//    //        do {
//    //            let decoder = PropertyListDecoder()
//    //            let decodedBookingID = try decoder.decode([String:Int].self,from: data)
//    //            if let bookingIDInt = decodedBookingID["BookingID"] {
//    //                print(bookingIDInt)
//    //            }
//    //        } catch {
//    //            print("Error decoding data: \(error)")
//    //        }
//    //    }
//
//        static func load(){
//            loadUsers(fileName: .facilities)
//            loadUsers(fileName: .patients)
//            loadServices(fileName: .tests)
//            loadServices(fileName: .package)
//            loadBookings()
//    //        loadBookingIDValue()
//
//            // Load all data from file or initial settings
//            if bookings.isEmpty {
//                bookings = sampleBookings
//            }
//            if facilites.isEmpty {
//                facilites = sampleFacilities
//            }
//            if services.isEmpty {
//                services = allTestsPackages
//            }
//            if patient.isEmpty{
//                patient = samplePatients
//            }
////            loadFromFile()
//        }
//
//
//
//        static func saveToFile(){
//            saveUsers(fileName: .facilities)
//            saveUsers(fileName: .patients)
//            saveServices(fileName: .tests)
//            saveServices(fileName: .package)
//    //        saveBookingIDValue()
//            saveBookings()
//
//        }
//
//
////        static func testDecoding() {
////            for booking in bookings {
////                print("Booking ID\(booking.bookingIDInt)")
////            }
////            for user in users {
////                print(user.userType)
////                print("user email \(user.email)")
////                if user.userType == .patient {
////                    let p = user as! Patient
////                        print(p.CPR)
////
////                }
////            }
////            for service in services {
////                print(service.title)
////    //            let test = service as! Test
////    //            print(test.testCategory.rawValue)
////            }
////            print("Static ID Counter \(bookingIDInt)")
////            print("users count \(users.count)")
////            print("bookings count \(bookings.count)")
////            print("services count \(services.count)")
////
////    //        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
////    //        let path = urls[0]
////    //        print(path)
////
////            let service = services[0]
////            let castedTest = service as! Test
////            print(castedTest.testCategory.rawValue)
////
////
////        }
//
//
//
//
//
//
//
//
//
//
//
//}
