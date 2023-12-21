//
//  RegistrationTableViewController.swift
//  LabCaught
//
//  Created by mobileProg on 13/12/2023.
//

import UIKit


//Registration table view controller to allow new patients to register in the app
class RegistrationTableViewController: UITableViewController {

    @IBOutlet weak var FirstNameTextField: UITextField!
    @IBOutlet weak var LastNameTextField: UITextField!
    @IBOutlet weak var DOBTextField: UITextField!
    @IBOutlet weak var CPRTextField: UITextField!
    @IBOutlet weak var PhoneNumberTextField: UITextField!
    @IBOutlet weak var UserNameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var ConfirmPasswordTextField: UITextField!
    
    @IBOutlet var TermsSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    //this action is called when the save button is tapped
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        
        
        // Validate that none of the text fields are empty
        guard let firstName = FirstNameTextField.text, !firstName.isEmpty,
              let lastName = LastNameTextField.text, !lastName.isEmpty,
              let dob = DOBTextField.text, !dob.isEmpty,
              let cpr = CPRTextField.text, !cpr.isEmpty,
              let phoneNumber = PhoneNumberTextField.text, !phoneNumber.isEmpty,
              let userName = UserNameTextField.text, !userName.isEmpty,
              let password = PasswordTextField.text, !password.isEmpty,
              let confirmPassword = ConfirmPasswordTextField.text, !confirmPassword.isEmpty else {
            Alerts.showAlertWithRetry(on: self, title: "Registration Error", message: "Please fill in all fields.", retryHandler: {
                // Add code here for retry logic, such as clearing fields or refocusing
            })
            return
        }
        
        // Additional validation for password match
          guard password == confirmPassword else {
              Alerts.showAlertWithRetry(on: self, title: "Password Error", message: "Passwords do not match.", retryHandler: {
                  // Add code here for retry logic, such as clearing the password fields
              })
              return
          }

        
        

        
        

          // Parse the date of birth into DateComponents
          guard let dobComponents = Utility.parseDateComponents(from: dob) else {
              // Handle error - invalid date
              return
          }
        
        
        
        // In RegistrationTableViewController
        if !Utility.isCPRCorrect(CPRTextField.text ?? "") {
            Alerts.showAlertWithRetry(on: self, title: "CPR Error", message: "The entered CPR is incorrect", retryHandler: {
                self.CPRTextField.becomeFirstResponder()
            })
            return
        }

        if AppData.isUsernameInUse(username: UserNameTextField.text ?? "") {
            Alerts.showAlertWithRetry(on: self, title: "Username Error", message: "Username already in use", retryHandler: {
                self.UserNameTextField.becomeFirstResponder()
            })
            return
        }


             

        // Check if the phone number is correct (8 digits)
        if !Utility.isPhoneNumberCorrect(phoneNumber: PhoneNumberTextField.text ?? "") {
            Alerts.showAlertWithRetry(on: self, title: "Phone Number Error", message: "The phone number is incorrect", retryHandler: {
                // Logic to handle the retry
                self.PhoneNumberTextField.text = ""
                self.PhoneNumberTextField.becomeFirstResponder()
            })
            return
        }

        if !TermsSwitch.isOn {
                  Alerts.showAlertWithRetry(on: self, title: "Terms and Conditions", message: "You must agree to the terms and conditions to continue", retryHandler: {
                      // Logic to handle the retry, such as making the terms switch the focus
                      self.TermsSwitch.setOn(false, animated: true)
                      self.TermsSwitch.becomeFirstResponder()
                  })
                  return
              }
        // Assuming all validations passed, add the user
        AppData.addUser(username: userName, password: password, phoneNumber: Int(phoneNumber) ?? 0, firstName: firstName, lastName: lastName, dob: dobComponents, cpr: Int(cpr) ?? 0)
        
      
    }
    
    }
    
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
