//
//  FacilityFormTableViewController.swift
//  LabCaught
//
//  Created by Shaikha Hasan Ali Hasan Ali Mohamed on 24/12/2023.
//

import UIKit
import Firebase
import FirebaseStorage


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
        
        @IBOutlet weak var openingTimeCell: UITableViewCell!
        @IBOutlet weak var closingTimeCell: UITableViewCell!
    
        var facility: Facility?
        var currentFacilityType: FacilityType = .hospital
    
        var selectedImage: UIImage?
    

        var username: String = ""
        var password: String = ""
        var name: String = ""
        var phoneNumber: String = ""
        var location: String = ""
    
    init?(coder: NSCoder, facility: Facility?) {
        self.facility = facility
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        self.facility = nil
        super.init(coder: coder)
    }
    
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //AppData.loadFacilities()
        updateViews()
        facilityIsAlwaysOpen(isAlwaysOpenSwitch)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(facilityLogoTapped))
        facilityLogo.addGestureRecognizer(tapGestureRecognizer)
    }


    func updateViews() {
             
            guard let facility = facility else {
                title = "Add Facility"
                return
            }
            
            title = "Edit Facility"
        
                // Update the UI elements with the data from the facility
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

                
            // Load the image from Firebase Storage
            let storageRef = Storage.storage().reference().child("images/\(facility.logoImageName)")
            storageRef.getData(maxSize: 1 * 1024 * 1024) { [weak self] data, error in
                if let error = error {
                    // Handle any errors
                    print("Error downloading image: \(error)")
                } else if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        // Set the downloaded image to the facilityLogo image view
                        self?.facilityLogo.image = image
                    }
                }
            }
    
            // reload table view to reflect changes
            tableView.reloadData()

            }
    
    func createDate(from dateComponents: DateComponents) -> Date? {
                return Calendar.current.date(from: dateComponents)
            }

    private func uploadImageToFirebase(image: UIImage, completion: @escaping (_ url: String?) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {
            completion(nil)
            return
        }
        
        let imageName = UUID().uuidString // A unique string for each image
        let storageRef = Storage.storage().reference().child("images/\(imageName).jpg")
        
        storageRef.putData(imageData, metadata: nil) { (metadata, error) in
            guard metadata != nil else {
                completion(nil)
                return
            }
            
            storageRef.downloadURL { (url, error) in
                guard let downloadURL = url else {
                    completion(nil)
                    return
                }
                
                completion(downloadURL.absoluteString)
            }
        }
    }
    
    private func presentAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func svaeButtoPassed(_ sender: UIBarButtonItem) {
        // Gather data from UI elements
        let username = facilityUsernameTextField.text ?? ""
        let password = facilityPasswordTextField.text ?? ""
        let name = facilityNameTextField.text ?? ""
        let phoneNumberText = facilityPhoneNumberTextField.text ?? ""
        let location = facilityLocationTextField.text ?? ""
        let isOpen24Hours = isAlwaysOpenSwitch.isOn
        let facilityType = facilityTypeSC.selectedSegmentIndex == 0 ? FacilityType.hospital : FacilityType.lab
        let openingTimeComponents = Calendar.current.dateComponents([.hour, .minute], from: openingTimeDP.date)
        let closingTimeComponents = Calendar.current.dateComponents([.hour, .minute], from: closingTimeDP.date)
        let logoImageName = "defaultLogo" // Replace with your logic to get the image name or URL
        //let currentLogoImageName = self.facility?.logoImageName
        
        
        if username.isEmpty || password.isEmpty || name.isEmpty || location.isEmpty {
                           //Alert message
                           let alertController = UIAlertController(title: "Empty Fields", message: "Please fill the empty fields.", preferredStyle: .alert)
                           let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                           alertController.addAction(okAction)
                           present(alertController, animated: true, completion: nil)
                           return
                       }

        // Convert and validate phone number
        guard let phoneNumber = Int(phoneNumberText) else {
            // Alert message for invalid phone number
            let alertController = UIAlertController(title: "Invalid Phone Number", message: "Please enter a valid phone number.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
            return
                }
        
        // Check if there is an image selected
        if let selectedImage = facilityLogo.image, selectedImage != UIImage(named: "defaultLogo") {
            // Upload the image to Firebase
            uploadImageToFirebase(image: selectedImage) { [weak self] imageUrl in
                guard let self = self, let imageUrl = imageUrl else {
                    self?.presentAlert(title: "Error", message: "Failed to upload image.")
                    return
                }
                // After uploading, save the facility with the new image URL
                if isAlwaysOpenSwitch.isOn {
                    let newFacility = Facility(username: username, password: password, phoneNumber: phoneNumber, name: name, location: location, isOpen24Hours: isOpen24Hours, openingTime: DateComponents(hour: 8, minute: 0), closingTime: DateComponents(hour: 20, minute: 0), facilityType: facilityType, logoImageName: imageUrl)
                    // Create new facility object
                    AppData.addFacility(facility: newFacility)
                    
                }
            }} else {
                let newFacility = Facility(username: username, password: password, phoneNumber: phoneNumber, name: name, location: location, isOpen24Hours: isOpen24Hours, openingTime: openingTimeComponents, closingTime: closingTimeComponents, facilityType: facilityType, logoImageName: facility?.logoImageName ?? logoImageName)
            // Create new facility object
                AppData.addFacility(facility: newFacility)

            }
        
        // If editing an existing facility
        if let facility = facility {
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
            facility.logoImageName = logoImageName
        
            // Update other properties as needed
                                
            //Edit facility to the data source
            AppData.editFacility(facility: facility)
            
        } else { // If adding a new facility
            
            if isAlwaysOpenSwitch.isOn {
                    let newFacility = Facility(username: username, password: password, phoneNumber: phoneNumber, name: name, location: location, isOpen24Hours: isOpen24Hours, openingTime: DateComponents(hour: 8, minute: 0), closingTime: DateComponents(hour: 20, minute: 0), facilityType: facilityType, logoImageName: logoImageName)
                // Create new facility object
                    AppData.addFacility(facility: newFacility)
            } else {
                    let newFacility = Facility(username: username, password: password, phoneNumber: phoneNumber, name: name, location: location, isOpen24Hours: isOpen24Hours, openingTime: openingTimeComponents, closingTime: closingTimeComponents, facilityType: facilityType, logoImageName: logoImageName)
                // Create new facility object
                    AppData.addFacility(facility: newFacility)
            }
                                
        }
                        
            // Save changes to data source
            AppData.saveFacilities()
            //reload

        
            // Navigate back to the previous view controller
            navigationController?.popViewController(animated: true)
    }
    
    
    @objc func facilityLogoTapped(_ sender: UITapGestureRecognizer) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func facilityIsAlwaysOpen(_ sender: UISwitch) {
        if sender.isOn{
            openingTimeCell.isHidden = true
            closingTimeCell.isHidden = true
        } else {
            openingTimeCell.isHidden = false
            closingTimeCell.isHidden = false
        }
    }
    
    
    func updateCurrentType(){
        currentFacilityType = facilityTypeSC.selectedSegmentIndex == 0 ? .hospital : .lab
    }
    
    
}

extension FacilityFormTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            facilityLogo.image = selectedImage
        }
        dismiss(animated: true, completion: nil)
    }
}
