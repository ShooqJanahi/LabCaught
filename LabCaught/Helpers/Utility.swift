//
//  Utility.swift
//  LabCaught
//
//  Created by mobileProg on 20/12/2023.
//

import Foundation
import UIKit

struct Utility {
    
    static func parseDateComponents(from dateString: String) -> DateComponents? {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy" // Change this format to whatever format your date string is in
            guard let date = dateFormatter.date(from: dateString) else {
                return nil
            }
            
            let calendar = Calendar.current
            let components = calendar.dateComponents([.year, .month, .day], from: date)
            return components
        }
    
    
    static func isPhoneNumberCorrect(phoneNumber: String) -> Bool {
        let trimmedPhoneNumber = phoneNumber.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmedPhoneNumber.count == 8 && trimmedPhoneNumber.allSatisfy { $0.isNumber }
    }
    
    static func isCPRCorrect(_ cpr: String) -> Bool {
        let trimmedCpr = cpr.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmedCpr.count == 9 && trimmedCpr.allSatisfy { $0.isNumber }
    }
    
    
    //Don't Touch (this is fo the segue)
    static func switchToStoryboard(named name: String) {
            // Ensure this function is within the scope of your class
            let storyboard = UIStoryboard(name: name, bundle: nil)
            if let initialViewController = storyboard.instantiateInitialViewController() {
                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                      let window = windowScene.windows.first(where: { $0.isKeyWindow }) else {
                    return
                }
                
                window.rootViewController = initialViewController
                window.makeKeyAndVisible()
                UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)
            }
        }

    //for the segue

    
    
    
    
    
    
    
    
    
    
}
