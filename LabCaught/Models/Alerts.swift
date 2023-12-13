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
}
