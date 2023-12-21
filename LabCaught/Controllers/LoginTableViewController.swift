//
//  LoginTableViewController.swift
//  LabCaught
//
//  Created by mobileProg on 10/12/2023.
//

import UIKit

class LoginTableViewController: UITableViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard let username = usernameTextField.text, !username.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            // Handle empty fields
            return
        }
        
        let isPatient = AppData.Patients.contains { $0.username == username && $0.password == password }
        let isFacility = AppData.facilites.contains { $0.username == username && $0.password == password }
        let isAdmin = AppData.admins.contains { $0.username == username && $0.password == password }
        
        if isPatient {
                Utility.switchToStoryboard(named: "Patient")
            } else if isFacility {
                Utility.switchToStoryboard(named: "Lab")
            } else if isAdmin {
                Utility.switchToStoryboard(named: "Admin")
        } else {
            // Handle failed login
            Alerts.showAlertWithRetry(on: self, title: "Login Error", message: "The provided credentials are incorrect.", retryHandler: {
                // Clear fields or focus as needed
                self.passwordTextField.text = ""
                self.usernameTextField.becomeFirstResponder()
            })
        }
    }
}
