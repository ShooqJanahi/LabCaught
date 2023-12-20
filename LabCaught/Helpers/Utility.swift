//
//  Utility.swift
//  LabCaught
//
//  Created by mobileProg on 20/12/2023.
//

import Foundation
import UIKit

struct Utility {
    static func isPhoneNumberCorrect(phoneNumber: String) -> Bool {
        let trimmedPhoneNumber = phoneNumber.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmedPhoneNumber.count == 8 && trimmedPhoneNumber.allSatisfy { $0.isNumber }
    }
    
    static func isCPRCorrect(_ cpr: String) -> Bool {
        let trimmedCpr = cpr.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmedCpr.count == 9 && trimmedCpr.allSatisfy { $0.isNumber }
    }
    
    
    //Don't Touch (this is fo the segue)
    struct CommonMethods {
        static func changeStoryboard(storyboardName: String, identifier: String) {
            let root = UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: identifier)

            // Get the SceneDelegate from the connected scenes
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let sceneDelegate = windowScene.delegate as? SceneDelegate {
                
                // Set the root view controller and make the window key and visible
                sceneDelegate.window?.rootViewController = root
                sceneDelegate.window?.makeKeyAndVisible()
            }
        }
    }
    //for the segue

    
    
    
    
    
    
    
    
    
    
}
