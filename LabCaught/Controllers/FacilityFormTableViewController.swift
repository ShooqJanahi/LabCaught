//
//  FacilityFormTableViewController.swift
//  LabCaught
//
//  Created by Shaikha Hasan Ali Hasan Ali Mohamed on 24/12/2023.
//

import UIKit

class FacilityFormTableViewController: UITableViewController {

    @IBOutlet weak var facilityTypeSC: UISegmentedControl!
        @IBOutlet weak var facilityLogo: UIImageView!
        @IBOutlet weak var facilityUsernameTextField: UITextField!
        @IBOutlet weak var facilityPasswordTextField: UITextField!
        @IBOutlet weak var facilityNameTextField: UITextField!
        @IBOutlet weak var facilityPhoneNumberTextField: UITextField!
        @IBOutlet weak var facilityLocationTextField: UITextField!
        @IBOutlet weak var isAlwaysOpenSwitch: UISwitch!
        @IBOutlet weak var openingTimeDP: UIDatePicker!
        @IBOutlet weak var closingTimeDP: UIDatePicker!

        @IBOutlet weak var btnSave: UIBarButtonItem!
        
        
        var facility: Facility?
        
        var username: String = ""
        var password: String = ""
        var name: String = ""
        var phoneNumber: String = ""
        var location: String = ""
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //AppData.loadFacilities()
        updateViews()
    }


    func updateViews() {
             // Check if there's an existing facility to edit
                 if let facility = facility {
                     // Editing an existing facility, populate the fields with its data
                     facilityUsernameTextField.text = facility.username
                     facilityPasswordTextField.text = facility.password
                     facilityNameTextField.text = facility.name
                     facilityPhoneNumberTextField.text = String(facility.phoneNumber)
                     facilityLocationTextField.text = facility.location
                     isAlwaysOpenSwitch.isOn = facility.isOpen24Hours
                     facilityTypeSC.selectedSegmentIndex = facility.facilityType == .hospital ? 0 : 1

                     // Configure date pickers
                     openingTimeDP.date = createDate(from: facility.openingTime) ?? Date()
                     closingTimeDP.date = createDate(from: facility.closingTime) ?? Date()

                     // Set title for editing
                     title = "Edit Facility"
                 } else {
                     // Adding a new facility, clear or set default values for the fields
                     facilityUsernameTextField.text = ""
                     facilityPasswordTextField.text = ""
                     facilityNameTextField.text = ""
                     facilityPhoneNumberTextField.text = ""
                     facilityLocationTextField.text = ""
                     isAlwaysOpenSwitch.isOn = false
                     facilityTypeSC.selectedSegmentIndex = 0 // Default to hospital
                     openingTimeDP.date = Date() // Set to current date/time or a default
                     closingTimeDP.date = Date() // Set to current date/time or a default

                     // Set title for adding
                     title = "Add Facility"
                 }
             /*
            guard let facility = facility else {
                title = "Add Facility"
                return
            }
            
            title = "Edit Facility"
                //Update the UI elements with the data from the facility
                facilityUsernameTextField.text = facility.username
                facilityPasswordTextField.text = facility.password
                facilityNameTextField.text = facility.name
                facilityPhoneNumberTextField.text = "\(facility.phoneNumber)"
                facilityLocationTextField.text = facility.location
                isAlwaysOpenSwitch.isOn = facility.isOpen24Hours
                openingTimeDP.date = createDate(from: facility.openingTime) ?? Date()
                closingTimeDP.date = createDate(from: facility.closingTime) ?? Date()

                // Set the segmented control for facility type
                facilityTypeSC.selectedSegmentIndex = facility.facilityType == .hospital ? 0 : 1

                
                // Assuming you have a method to load the image into faclityLogo
                // faclityLogo.image = ...
    */
            // reload table view to reflect changes
            tableView.reloadData()

            }
    
    func createDate(from dateComponents: DateComponents) -> Date? {
                return Calendar.current.date(from: dateComponents)
            }

    
    
    @IBAction func svaeButtoPassed(_ sender: UIBarButtonItem) {
        // Gather data from UI elements
                            let username = facilityUsernameTextField.text ?? ""
                            let password = facilityPasswordTextField.text ?? ""
                            let name = facilityNameTextField.text ?? ""
                            let phoneNumber = Int(facilityPhoneNumberTextField.text ?? "") ?? 0 // Make sure to handle conversion errors
                            let location = facilityLocationTextField.text ?? ""
                            let isOpen24Hours = isAlwaysOpenSwitch.isOn
                            let facilityType = facilityTypeSC.selectedSegmentIndex == 0 ? FacilityType.hospital : FacilityType.lab
                            let openingTimeComponents = Calendar.current.dateComponents([.hour, .minute], from: openingTimeDP.date)
                            let closingTimeComponents = Calendar.current.dateComponents([.hour, .minute], from: closingTimeDP.date)
                            let logoImageName = "defaultLogo" // Replace with your logic to get the image name or URL

                            if let facility = facility { // If editing an existing facility
                                // Update facility properties
                                facility.username = username
                                facility.password = password
                                facility.name = name
                                facility.phoneNumber = phoneNumber
                                facility.location = location
                                facility.isOpen24Hours = isOpen24Hours
                                facility.facilityType = facilityType
                                facility.openingTime = openingTimeComponents
                                facility.closingTime = closingTimeComponents
                                // Update other properties as needed
                            } else { // If adding a new facility
                                // Create new facility object
                                let newFacility = Facility(username: username, password: password, phoneNumber: phoneNumber, name: name, location: location, isOpen24Hours: isOpen24Hours, openingTime: openingTimeComponents, closingTime: closingTimeComponents, facilityType: facilityType, logoImageName: logoImageName)
                                // Add new facility to the data source
                                AppData.sampleFacilities.append(newFacility)
                            }
                        
                        // Save changes to data source
                           AppData.saveFacilities()

                        // Navigate back to the previous view controller
                           navigationController?.popViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "showEditFacilitySegue", let destinationVC = segue.destination as? FacilityFormTableViewController, let indexPath = tableView.indexPathForSelectedRow {
                destinationVC.facility = AppData.sampleFacilities[indexPath.row]
            }
        }
}
