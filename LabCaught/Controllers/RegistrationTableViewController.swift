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
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        
    }

    //this action is called when the save button is tapped
    @IBAction func saveButtonTapped(_sender: UIBarButtonItem)
    {
        //validate that none of the text field are empty
        guard let FirstName = FirstNameTextField.text, !FirstName.isEmpty,
              let LastName = LastNameTextField.text, !LastName.isEmpty,
              let DOB = DOBTextField.text, !DOB.isEmpty,
              let CPR = CPRTextField.text, !CPR.isEmpty,
              let PhoneNumber = PhoneNumberTextField.text, !PhoneNumber.isEmpty,
            let UserName = UserNameTextField.text, !UserName.isEmpty,
              let Password = PasswordTextField.text, !Password.isEmpty,
              let ConfirmPassword = ConfirmPasswordTextField.text, !ConfirmPassword.isEmpty
        else {
            Alerts.showAlertWithRetry(on: self, title: "Registration Error", message: "Please fill in all fields.", retryHandler: completion)
            
        }
        
        guard password 
        
              
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

}
