//
//  Alerts.swift
//  LabCaught
//
//  Created by mobileProg on 10/12/2023.
//

import UIKit

class Alerts {
    static func showAlertWithRetry(on viewController: UIViewController, title: String, message: String, retryHandler: @escaping () -> Void){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let retryAction = UIAlertAction(title: "Try Again", style: .default) { _ in retryHandler()
            
        }
        
        alert.addAction(retryAction)
        DispatchQueue.main.async {
            viewController.present(alert, animated: true, completion: nil)
        }
    }
    
    // Helper method to check if the phone number is an 8-digit integer
    func isPhoneNumberCorrect(phoneNumber: String) -> Bool {
        let trimmedPhoneNumber = phoneNumber.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmedPhoneNumber.count == 8 && trimmedPhoneNumber.allSatisfy { $0.isNumber }
    }
    
    func isCPRCorrect(_ cpr: String) -> Bool {
        let trimmedCpr = cpr.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmedCpr.count == 9 && trimmedCpr.allSatisfy { $0.isNumber }
    }
    
    // Assuming AppData.swift has a structure similar to this
    struct AppData {
        static func isUsernameInUse(username: String) -> Bool {
            // Here you would check against your data source to see if the username is already taken.
            // For demonstration purposes, this is a dummy implementation.
            // Replace with actual logic, possibly involving a database or in-memory data check.
            let existingUsernames = ["user1", "user2", "user3"] // Example usernames
            return existingUsernames.contains(username)
        }
        
    }
    
    
    // check username and show alert with retry option
    static func checkUsernameAndShowAlert(username: String, tag: Int, on viewController: UIViewController, successHandler: @escaping () -> Void) {
        if AppData.isUsernameInUse(username: username) {
            showAlertWithRetry(on: viewController, title: "Username Error", message: "Username already in use", retryHandler: {
                // Use the tag to find the text field and make it the first responder.
                if let textField = viewController.view.viewWithTag(tag) as? UITextField {
                    textField.becomeFirstResponder()
                }
            })
        } else {
            successHandler()
        }
    }

    
}

extension UIAlertController {
    static func confirmAction(title: String, message: String, confirmTitle: String = "Delete", cancelTitle: String = "Cancel", onConfirm: @escaping () -> Void) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: confirmTitle, style: .destructive) { _ in
            onConfirm()
        }
        let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel)
        
        alert.addAction(confirmAction)
        alert.addAction(cancelAction)
        
        return alert
    }
}
