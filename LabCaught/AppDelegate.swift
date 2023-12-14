//
//  AppDelegate.swift
//  LabCaught
//
//  Created by mobileProg on 05/12/2023.
//

// AppDelegate.swift
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let usersData = UsersData()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Other setup code
        
        
        //Lab user
        usersData.addLabUser(PhoneNumber: 1234567890, username: "labUser1", password: "password123", confirmPassword: "password123", Location: "123 Lab Street", labName: "Central Lab", alwaysOpen: false, openingTime: DateComponents(hour: 9, minute: 0), closingTime: DateComponents(hour: 17, minute: 0))
        
        
        //admin user
        usersData.addAdminUser(PhoneNumber: 1234567890, username: "adminUser", password: "securePass123", confirmPassword: "securePass123", department: "IT", firstName: "John", lastName: "Doe")
        
        
        return true
    }
}


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        AppData.load()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }




