//
//  AppData.swift
//  LabCaught
//
//  Created by Nada Naser Ahmed Abdulla Abdulkarim Alawadhi on 19/12/2023.
//

import Foundation

struct AppData {
    
    
    //users
    static func isUsernameInUse(username: String) -> Bool {
        // Check against your data source to see if the username is already taken.
        // This is a placeholder for your username checking logic.
        let existingUsernames = ["user1", "user2", "user3"] // Example usernames
        return existingUsernames.contains(username)
    }
    
    
    
    
    
}

