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
                                    logoImageName: "AlHilal.png")
    
    static var Facility2 = Facility(username: "Alsalam",
                                    password: "12345",
                                    phoneNumber: 17001700,
                                    name: "Al Salam Hospital",
                                    location: "Muharraq, Bahrain",
                                    isOpen24Hours: true,
                                    openingTime: DateComponents(hour: 8, minute: 0),
                                    closingTime: DateComponents(hour: 8, minute: 0),
                                    facilityType: .hospital,
                                    logoImageName: "AlSalam.png")
    
    static var Facility3 = Facility(username: "shifa",
                                    password: "123Sh", phoneNumber: 17288000,
                                    name: "Shifa Al Jazeera Hospital",
                                    location: "Manama, Bahrain",
                                    isOpen24Hours: true,
                                    openingTime: DateComponents(hour: 8, minute: 0),
                                    closingTime: DateComponents(hour: 8, minute: 0),
                                    facilityType: .hospital,
                                    logoImageName: "ShifaAlJazeera.png")
    
    static var Facility4 = Facility(username: "KHamadUni",
                                    password: "123RM",
                                    phoneNumber: 17444444,
                                    name: "King Hamad University",
                                    location: "Busaiteen, Bahrain",
                                    isOpen24Hours: true,
                                    openingTime: DateComponents(hour: 8, minute: 0),
                                    closingTime: DateComponents(hour: 20, minute: 0),
                                    facilityType: .hospital,
                                    logoImageName: "KingHamadUniversityHospital .jpeg")
    
    static var Facility5 = Facility(username: "MedicalLabortary",
                                    password: "123RM",
                                    phoneNumber: 17255522,
                                    name: "Bahrain medical labortary",
                                    location: "Salmaniya, Bahrain",
                                    isOpen24Hours: true,
                                    openingTime: DateComponents(hour: 7, minute: 0),
                                    closingTime: DateComponents(hour: 17, minute: 0),
                                    facilityType: .lab,
                                    logoImageName: "BahrainMedicalLaboratory.jpeg")
    
    static var Facility6 = Facility(username: "ThyrocareGulf",
                                    password: "123RM",
                                    phoneNumber: 66004000,
                                    name: "Thyrocare Gulf Laboratories",
                                    location: "Sanabis, Bahrain",
                                    isOpen24Hours: false,
                                    openingTime: DateComponents(hour: 9, minute: 0),
                                    closingTime: DateComponents(hour: 17, minute: 0),
                                    facilityType: .lab,
                                    logoImageName: "ThyrocareGulfLaboratories.jpeg")
    
    static var Facility7 = Facility(username: "AlKindi",
                                        password: "123Ak",
                                        phoneNumber: 17240444,
                                        name: "Al Kindi Hospital",
                                        location: "Manama, Bahrain",
                                        isOpen24Hours: true,
                                        openingTime: DateComponents(hour: 8, minute: 0),
                                        closingTime: DateComponents(hour: 20, minute: 0),
                                        facilityType: .hospital,
                                        logoImageName: "AlKindiHospital.png")
        
        static var Facility8 = Facility(username: "AlNafees",
                                        password: "123An",
                                        phoneNumber: 17828282,
                                        name: "Ibn Al-Nafees Hospital",
                                        location: "Manama, Bahrain",
                                        isOpen24Hours: true,
                                        openingTime: DateComponents(hour: 8, minute: 0),
                                        closingTime: DateComponents(hour: 20, minute: 0),
                                        facilityType: .hospital,
                                        logoImageName: "IbnAlNafeesHospital.png")
        
        static var Facility9 = Facility(username: "BlossomMedical",
                                        password: "123RM",
                                        phoneNumber: 17179316,
                                        name: "Blossom Medical",
                                        location: "Isa Town, Bahrain",
                                        isOpen24Hours: false,
                                        openingTime: DateComponents(hour: 7, minute: 0),
                                        closingTime: DateComponents(hour: 22, minute: 0),
                                        facilityType: .lab,
                                        logoImageName: "BlossomMedical.png")
        
        static var Facility10 = Facility(username: "AsterClinic",
                                        password: "123Ac",
                                        phoneNumber: 17711811,
                                        name: "Aster Clinic",
                                        location: "Sanad, Bahrain",
                                        isOpen24Hours: false,
                                        openingTime: DateComponents(hour: 7, minute: 0),
                                        closingTime: DateComponents(hour: 23, minute: 0),
                                        facilityType: .lab,
                                        logoImageName: "AsterClinic.jpeg")
        
        static var Facility11 = Facility(username: "AlResalah",
                                        password: "123Ar",
                                        phoneNumber: 17680088,
                                        name: "Al Resalah Medical Center",
                                        location: "Isa Town, Bahrain",
                                        isOpen24Hours: true,
                                        openingTime: DateComponents(hour: 8, minute: 0),
                                        closingTime: DateComponents(hour: 20, minute: 0),
                                        facilityType: .lab,
                                        logoImageName: "AlResalahMedicalCenter.jpeg")
        
        static var Facility12 = Facility(username: "AlRayan",
                                        password: "123Ar",
                                        phoneNumber: 17495500,
                                        name: "Al Rayan Medical Complex",
                                        location: "Riffa, Bahrain",
                                        isOpen24Hours: true,
                                        openingTime: DateComponents(hour: 8, minute: 0),
                                        closingTime: DateComponents(hour: 20, minute: 0),
                                        facilityType: .lab,
                                        logoImageName: "AlRayanMedicalComplex.jpeg")
    
    static var Facility13 = Facility(username: "SpecialistHospital",
                                    password: "123Sh123",
                                    phoneNumber: 17812222,
                                    name: "Bahrain Specialist Hospital Laboratory",
                                    location: "Juffair, Bahrain",
                                    isOpen24Hours: false,
                                    openingTime: DateComponents(hour: 8, minute: 0),
                                    closingTime: DateComponents(hour: 16, minute: 0),
                                    facilityType: .lab,
                                    logoImageName: "BahrainSpecialistLaboratory.jpeg")
    
    static var Facility14 = Facility(username: "ExpressMed",
                                    password: "123Em",
                                    phoneNumber: 77298888,
                                    name: "ExpressMed Laboratories",
                                    location: "Zinj, Bahrain",
                                    isOpen24Hours: false,
                                    openingTime: DateComponents(hour: 8, minute: 0),
                                    closingTime: DateComponents(hour: 20, minute: 0),
                                    facilityType: .lab,
                                    logoImageName: "ExpressMedLaboratories.jpeg")
    
    static var Facility15 = Facility(username: "AlAmal",
                                    password: "123An",
                                    phoneNumber: 17602602,
                                    name: "Al Amal Hospital",
                                    location: "Buri, Bahrain",
                                    isOpen24Hours: true,
                                    openingTime: DateComponents(hour: 8, minute: 0),
                                    closingTime: DateComponents(hour: 20, minute: 0),
                                    facilityType: .hospital,
                                    logoImageName: "AlAmalHospital.png")
        
        // Array of sample facilities.
        static var sampleFacilities: [Facility] = [Facility1, Facility2, Facility3, Facility4, Facility5, Facility6, Facility7, Facility8, Facility9, Facility10, Facility11, Facility12, Facility13, Facility14, Facility15] {
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
    
    
    // Test data for Alhilal Hospital.
    static var test1H = Test(name: "Hemoglobin A1C ",cost: "3 BHD",describtion: "Measures average blood glucose levels over the past 3 months, used to monitor diabetes.",insrtuctions: "Blood sample required. No special preparation needed.",facility: sampleFacilities[0])
    static var test2H = Test(name: "Renal Function Panel",cost: "5 BHD",describtion: "Assesses kidney function by testing substances like creatinine and urea.",insrtuctions: "Blood sample required. Stay hydrated and follow any specific pre-test instructions.",facility: sampleFacilities[0])
    static var test3H = Test(name: "Stress ECG",cost: "2 BHD",describtion: "Evaluates heart function under stress conditions, often involving physical exercise.",insrtuctions: "Wear comfortable clothing and shoes suitable for exercise. Avoid eating a heavy meal before the test.",facility: sampleFacilities[0])
    static var test4H = Test(name: "Cholesterol Panel",cost: "7 BHD",describtion: "Measures different types of cholesterol and triglycerides to assess heart disease risk.",insrtuctions: "Fasting for 9-12 hours prior to the test is typically required.",facility: sampleFacilities[0])
    static var test5H = Test(name: "Cholesterol Panel",cost: "7 BHD",describtion: "Measures different types of cholesterol and triglycerides to assess heart disease risk.",insrtuctions: "Fasting for 9-12 hours prior to the test is typically required.",facility: sampleFacilities[0])
    static var test6H = Test(name: "Liver Enzyme", cost: "8 BHD", describtion: "Measures enzymes and proteins to evaluate liver health.", insrtuctions: "Blood sample required. Fasting may be necessary.", facility: sampleFacilities[0])
    static var test7H = Test(name: "Electrolyte Panel", cost: "5 BHD", describtion: "Assesses the balance of key electrolytes like sodium, potassium, and chloride.", insrtuctions: "Blood sample needed. Stay hydrated; no other preparation needed.", facility: sampleFacilities[0])
    static var test8H = Test(name: "Uric Acid", cost: "8 BHD", describtion: "Measures uric acid in the blood, helping diagnose gout and kidney health.", insrtuctions: "Blood sample required. Avoid foods high in purines before the test.", facility: sampleFacilities[0])
    
    // Test data for AlSalam Hospital.
    static var test1S = Test(name: "Lipid Profile",cost: "6 BHD",describtion:"Assesses levels of cholesterol and triglycerides.",insrtuctions: "Fasting for 9-12 hours before the test.",facility: sampleFacilities[1])
        static var test2S = Test(name: "Blood Glucose Level",cost: "9 BHD",describtion: "Measures the concentration of glucose in the blood.",insrtuctions: "Fasting for 8 hours before the test is usually required.",facility: sampleFacilities[1])
        static var test3S = Test(name: "Blood Pressure Check",cost: "12 BHD",describtion: "Measures the pressure of blood in the arteries.",insrtuctions: "Relax for a few minutes before the test; avoid caffeine or exercise beforehand.",facility: sampleFacilities[1])
        static var test4S = Test(name: "Complete Blood Count",cost: "4 BHD",describtion: "Evaluates overall blood health, analyzing various types of blood cells.",insrtuctions: "No special preparation needed.",facility: sampleFacilities[1])
        static var test5S = Test(name: "Thyroid Function",cost: "3 BHD",describtion: "Assesses thyroid hormone levels to check thyroid gland function.",insrtuctions: "Typically no fasting required; best taken in the morning.",facility: sampleFacilities[1])
    static var test6S = Test(name: "Vitamin D Level",cost: "7 BHD",describtion: "Measures the level of Vitamin D, crucial for bone health.",insrtuctions: "No special preparation needed.",facility: sampleFacilities[1])
    
    // Test data for Shifaa Aljazeera Hospital.
    static var test1Shifa = Test(name: "Aerobic Capacity Test", cost: "5 BHD", describtion: "Measures cardiovascular fitness through exercises.", insrtuctions: "Wear comfortable clothing and shoes. Avoid heavy meals before the test.", facility: sampleFacilities[2])
        static var test2Shifa = Test(name: "Body Composition Analysis", cost: "7 BHD", describtion: "Assesses body fat percentage and muscle distribution.", insrtuctions: "May require wearing minimal clothing; avoid eating or drinking a few hours before the test.", facility: sampleFacilities[2])
        static var test3Shifa = Test(name: "Bone Density Scan", cost: "9 BHD", describtion: "Evaluates bone mineral density for osteoporosis risk.", insrtuctions: "No metal objects on the body during the scan. Inform the technician if pregnant or possibly pregnant.", facility: sampleFacilities[2])
    static var test4Shifa = Test(name: "Liver Function Test", cost: "6 BHD", describtion: "Assesses the health of the liver.", insrtuctions: "Blood sample required. Fasting may be advised.", facility: sampleFacilities[2])
        static var test5Shifa = Test(name: "H. Pylori Test", cost: "12 BHD", describtion: "Detects H. pylori bacteria, associated with ulcers.", insrtuctions: "Blood, stool, or breath sample required. Specific preparation depends on the test type.", facility: sampleFacilities[2])
        static var test6Shifa = Test(name: "Gluten Sensitivity Test", cost: "14 BHD", describtion: "Tests for gluten intolerance or celiac disease.", insrtuctions: "Blood sample required. Maintain normal diet including gluten before the test.", facility: sampleFacilities[2])

    
    // Test data for Bahrain medical Lab.
    static var test1BHlab = Test(name: "ABO/Rh Blood Typing", cost: "6 BHD", describtion: "Determines blood group (A, B, AB, or O) and Rh factor (positive or negative).", insrtuctions: "Blood sample required. No special preparation needed.", facility: sampleFacilities[4])
        static var test2BHlab = Test(name: "Bacterial Culture, Aerobic, Urine", cost: "11 BHD", describtion: "Identifies bacterial infections in the urine.", insrtuctions: "Midstream urine sample needed. Follow proper collection techniques to avoid contamination.", facility: sampleFacilities[4])
        static var test3BHlab = Test(name: "Protein, Total, 24 Hour, Urine (PTU)", cost: "8 BHD", describtion: "Measures the amount of protein excreted in urine over 24 hours, assessing kidney function.", insrtuctions: "Collect all urine over a 24-hour period in a provided container. Store the container in a cool place during the collection period.", facility: sampleFacilities[4])
        static var test4BHlab = Test(name: "Liver Profile, Serum", cost: "13 BHD", describtion: "A panel of tests to evaluate liver function, including enzymes and bilirubin.", insrtuctions: "Blood sample required. Fasting for 8-12 hours may be necessary.", facility: sampleFacilities[4])
        static var test5BHlab = Test(name: "Uric Acid, Body Fluid", cost: "5 BHD", describtion: "Measures the level of uric acid in body fluids to assess gout or kidney stones.", insrtuctions: "Sample of body fluid (like joint fluid) needed. The specific preparation depends on the fluid being collected.", facility: sampleFacilities[4])
    
    //Test data for Blossom Lab
    static var test1Blos = Test(name: "C-Reactive Protein", cost: "7.5 BHD", describtion: "Measures the level of CRP in the blood to detect inflammation or infection.", insrtuctions: "Requires a blood sample. No special preparation needed. Avoid strenuous exercise before the test.", facility: sampleFacilities[8])
        static var test2Blos = Test(name: "Complete Metabolic Panel", cost: "6 BHD", describtion: "Evaluates overall health, including kidney and liver function, electrolyte levels, and blood glucose.", insrtuctions: "Blood sample required. Fasting for 8-12 hours before the test is usually necessary.", facility: sampleFacilities[8])
        static var test3Blos = Test(name: "Bone Density Scan", cost: "11 BHD", describtion: "Assesses bone mineral density to check for osteoporosis or other bone health issues.", insrtuctions: "No metal objects on the body during the scan. Inform the technician if pregnant or possibly pregnant.", facility: sampleFacilities[8])
        static var test4Blos = Test(name: "Serum Calcium", cost: "9 BHD", describtion: "Measures calcium levels in the blood to assess bone health and metabolic functions.", insrtuctions: "Blood sample required. Fasting may be advised. Avoid calcium supplements before the test.", facility: sampleFacilities[8])
        static var test5Blos = Test(name: "Spirometry Test", cost: "6 BHD", describtion: "Evaluates lung function by measuring air inhalation and exhalation.", insrtuctions: "Wear comfortable clothing. Avoid heavy meals and smoking before the test. Follow breathing instructions during the test.", facility: sampleFacilities[8])
        static var test6Blos = Test(name: "Erythrocyte Sedimentation Rate", cost: "12 BHD", describtion: "Measures how quickly red blood cells settle in a tube, indicating inflammation.", insrtuctions: "Blood sample required. No special preparation needed.", facility: sampleFacilities[8])
    
    
    static var tests: [Test] = [test1H,test2H, test3H, test4H, test5H, test6H,test7H, test8H, test1S, test2S, test3S, test4S, test5S,test6S, test1Shifa, test2Shifa, test3Shifa,test4Shifa,test5Shifa,test6Shifa, test1BHlab,test2BHlab,test3BHlab,test4BHlab,test5BHlab, test1Blos,test2Blos,test3Blos,test4Blos,test5Blos,test6Blos]
    
    
    // Packages data for Alhilal Hospital
    static var package1H = Packages(name: "Vitality Screening Package", cost: "30 BHD", describtion: " This package is designed to assess blood sugar control and kidney health.", insrtuctions: " For the Hemoglobin A1C test, no special preparation is needed. The Renal Function Panel may require fasting, so check with your healthcare provider.", packageIncludes: [test1H, test2H], packageExpiry: DateComponents(calendar: Calendar.current, year: 2024, month: 6, day:2), facility: sampleFacilities[0])
    static var package2H = Packages(name: "Cardio Care Package", cost: "58 BHD", describtion: "Focuses on heart health by evaluating cardiovascular function and cholesterol levels.", insrtuctions: "Wear comfortable clothing for the Stress ECG, which may involve physical exercise. Fasting for 9-12 hours before the Cholesterol Panel test is typically required.", packageIncludes: [test3H, test4H], packageExpiry: DateComponents(calendar: Calendar.current, year: 2024, month: 1, day:31), facility: sampleFacilities[0])
    
    // Packages for AlSalam
    static var package1S = Packages(name: "Cardio-Metabolic Health Package", cost: "25 BHD", describtion: "Targets heart and metabolic health, checking cholesterol, blood sugar, and blood pressure.", insrtuctions: "For the Lipid Profile and Blood Glucose Level, fasting for 9-12 hours is typically required. No special preparation is needed for the Blood Pressure Check.", packageIncludes: [test1S,test2H,test3S], packageExpiry: DateComponents(calendar: Calendar.current, year: 2024, month: 12, day: 31), facility: sampleFacilities[1])

        static var package2S = Packages(name: "General Wellness Package", cost: "30 BHD", describtion: "Provides a comprehensive health overview, assessing blood health, thyroid function, and Vitamin D levels.", insrtuctions: "No special preparation is needed for the Complete Blood Count (CBC) and Vitamin D Level tests. The Thyroid Function Test (TFT) is usually best conducted in the morning, but no fasting is required.", packageIncludes: [test4S,test5S,test6S], packageExpiry: DateComponents(calendar: Calendar.current, year: 2024, month: 3, day: 31), facility: sampleFacilities[1])
    
    // Packages for Shifaa Aljazeera
    static var package1Shifa = Packages(name: "Active Lifestyle Package", cost: "60 BHD", describtion: "Designed for fitness enthusiasts, this package evaluates cardiovascular health, body composition, and bone density.", insrtuctions: "Wear athletic attire for the Aerobic Capacity Test. For the Body Composition Analysis and Bone Density Scan, wear minimal clothing and avoid metal accessories. Fasting may be required for the Bone Density Scan.", packageIncludes: [test1Shifa,test2Shifa,test3Shifa], packageExpiry: DateComponents(calendar: Calendar.current, year: 2024, month: 12, day: 31), facility: sampleFacilities[2])

        static var package2Shifa = Packages(name: "Digestive Health Package", cost: "40 BHD", describtion: "Focuses on liver health, stomach bacteria, and gluten sensitivity, essential for digestive wellness.", insrtuctions: "Fasting may be necessary for the Liver Function test. Avoid certain medications for the H. Pylori test, and maintain a normal diet (including gluten) before the Gluten Sensitivity test.", packageIncludes: [test4Shifa, test5Shifa,test6Shifa], packageExpiry: DateComponents(calendar: Calendar.current, year: 2024, month: 11, day: 30), facility: sampleFacilities[2])
    
    //Packages for Bahrain Lab
    static var package1BHlab = Packages(name: "Kidney and Urinary Health Package", cost: "50 BHD", describtion: "This package is designed to assess urinary tract health and kidney function.", insrtuctions: "For the Bacterial Culture test, a midstream urine sample is required. Ensure proper collection techniques. For the PTU test, collect all urine over a 24-hour period in a provided container and store it in a cool place.", packageIncludes: [test2BHlab,test3BHlab], packageExpiry: DateComponents(calendar: Calendar.current, year: 2024, month: 5, day: 16), facility: sampleFacilities[4])

        static var package2BHlab = Packages(name: "Liver Function and Metabolic Assessment", cost: "45 BHD", describtion: "Evaluates liver health and checks for conditions like gout or kidney stones.", insrtuctions: "For the Liver Profile, a blood sample is required with fasting for 8-12 hours. For the Uric Acid test, a body fluid sample (like joint fluid) is needed, with specific preparation depending on the fluid being collected.", packageIncludes: [test4BHlab,test5BHlab], packageExpiry: DateComponents(calendar: Calendar.current, year: 2024, month: 2, day: 27), facility: sampleFacilities[4])
    
    //Packages for Blossom Lab
    static var package1Blos = Packages(name: "Comprehensive Cardiac Risk Panel", cost: "90 BHD", describtion: "Assesses heart health by measuring markers of inflammation and metabolic function.", insrtuctions: "Fast for 8-12 hours prior to the test. Avoid strenuous exercise for 24 hours before the test.", packageIncludes: [test1Blos,test2Blos], packageExpiry: DateComponents(calendar: Calendar.current, year: 2024, month: 5, day: 15), facility: sampleFacilities[8])

        static var package2Blos = Packages(name: "Bone Health Assessment", cost: "35 BHD", describtion: "Screens for bone density to assess the risk of osteoporosis and other bone-related conditions.", insrtuctions: "Wear loose clothing without metal fasteners. Avoid calcium supplements 24 hours before the test.", packageIncludes: [test3Blos,test4Blos], packageExpiry: DateComponents(calendar: Calendar.current, year: 2025, month: 3, day: 20), facility: sampleFacilities[8])
    
    static var packages: [Packages] = [package1H, package2H, package1S, package2S, package1Shifa,package2Shifa,package1BHlab,package2BHlab,package1Blos,package2Blos]

    // Combined array of all tests and packages.
    static var allTestsPackages: [Service] = [test1H,test2H, test3H,test4H,test5H, test6H,test7H, test8H,test1S, test2S, test3S, test4S, test5S,test6S,test1Shifa, test2Shifa, test3Shifa, test4Shifa,test5Shifa,test6Shifa,test1BHlab,test2BHlab,test3BHlab,test4BHlab,test5BHlab,test1Blos,test2Blos,test3Blos,test4Blos,test5Blos,test6Blos,package1H, package2H,package1S, package2S, package1Shifa,package2Shifa,package1BHlab,package2BHlab,package1Blos,package2Blos]
    
    
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
    
    static func editBookingStatus(booking: booking, status: statusType){
        if let index = bookings.firstIndex(of: booking) {
            bookings[index].status = status
        }
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
