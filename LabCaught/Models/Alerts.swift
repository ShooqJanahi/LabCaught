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
    
    
    static func showUsernameInUseAlertIfNecessary(for username: String, on viewController: UIViewController, isUsernameInUse: () -> Bool, retryHandler: @escaping () -> Void) {
        if isUsernameInUse() {
            showAlertWithRetry(on: viewController, title: "Username Error", message: "Username already in use", retryHandler: retryHandler)
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
