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
        // Here, you'd typically validate the user's credentials by sending a request to your server
        // For now, let's assume the login is not successful and show the alert
        let loginSuccessful = false // Replace with actual login logic

        if !loginSuccessful {
            Alerts.showAlertWithRetry(on: self, title: "Login Error", message: "The provided credentials are incorrect. Please double-check your username and password and try again.", retryHandler: {
                // Clear the password field
                self.passwordTextField.text = ""
                // Optionally, focus the username text field
                self.usernameTextField.becomeFirstResponder()
            })
        }
    }

    // MARK: - Table view data source
    // ... rest of your code for table view data source if needed ...
}
