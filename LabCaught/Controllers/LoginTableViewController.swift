//
//  LoginTableViewController.swift
//  LabCaught
//
//  Created by mobileProg on 10/12/2023.
//

import UIKit

class LoginTableViewController: UITableViewController {
    
    // Outlets that connect to the username and password text fields in your storyboard.
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Any additional setup after loading the view, typically from a nib.
    }
    
    // This function is called when the login button is tapped.
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        // Check if the username and password fields are not empty.
        guard let username = usernameTextField.text, !username.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            // If either field is empty, exit the function and do not proceed with login.
            return
        }
        
        // Check if the entered username and password match a patient's credentials.
        let isPatient = AppData.Patients.contains { $0.username == username && $0.password == password }
        // Check if the entered username and password match a facility's credentials.
        let isFacility = AppData.facilites.contains { $0.username == username && $0.password == password }
        // Check if the entered username and password match an admin's credentials.
        let isAdmin = AppData.admins.contains { $0.username == username && $0.password == password }
        
        // If the user is a patient, switch to the Patient storyboard.
        if isPatient {
            Utility.switchToStoryboard(named: "PatientHome")
        }
        // If the user is a facility, switch to the Lab storyboard.
        else if isFacility {
            Utility.switchToStoryboard(named: "Lab")
        }
        // If the user is an admin, switch to the Admin storyboard.
        else if isAdmin {
            Utility.switchToStoryboard(named: "Admin")
        } else {
            // If the credentials do not match any user type, display an error message.
            Alerts.showAlertWithRetry(on: self, title: "Login Error", message: "The provided credentials are incorrect.", retryHandler: {
                // Clear the password field and put focus back on the username field for the user to try again.
                self.passwordTextField.text = ""
                self.usernameTextField.becomeFirstResponder()
            })
        }
    }
}
