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
        
        facility.fetchLogoImage { [weak self] image in
            DispatchQueue.main.async {
                self?.facilityLogo.image = image
            }
        }
        
                // Set the segmented control for facility type
                facilityTypeSC.selectedSegmentIndex = facility.facilityType == .hospital ? 0 : 1

            // reload table view to reflect changes
            tableView.reloadData()

        
        
    }
    
    func createDate(from dateComponents: DateComponents) -> Date? {
                return Calendar.current.date(from: dateComponents)
            }

    func refreshFacilityList() {
        // Update your list view (e.g., tableView.reloadData())
        // Make sure to call this on the main thread if updating UI
        DispatchQueue.main.async {
            self.tableView.reloadData()
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
        let logoImageName = facility?.logoImageName
        
        
        
        if username.isEmpty || password.isEmpty || name.isEmpty || location.isEmpty {
                           //Alert message
                           let alertController = UIAlertController(title: "Empty Fields", message: "Please fill the empty fields.", preferredStyle: .alert)
                           let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                           alertController.addAction(okAction)
                           present(alertController, animated: true, completion: nil)
                           return
        }

       
        
        // Check if a new image was selected for upload
        if let imageToUpload = selectedImage {
                uploadImage(imageToUpload) { [weak self] (url) in
                    guard let self = self, let logoUrl = url else {
                        self?.presentAlert(title: "Upload Failed", message: "Failed to upload image.")
                        return
                    }
                    // Now we have the new logo URL
                    self.loadImage(from: logoUrl, into: self.facilityLogo)
                    self.createOrUpdateFacility(with: logoUrl) {
                        // Call finalizeFacilityUpdate after the facility has been created/updated
                        self.finalizeFacilityUpdate()
                    }
                }
            } else {
                // If no new image, use existing logo URL
                createOrUpdateFacility(with: facility?.logoImageName) {
                    // Call finalizeFacilityUpdate after the facility has been created/updated
                    self.finalizeFacilityUpdate()
                }
            }
            
            
            
    
            
    }
    
    private func createOrUpdateFacility(with logoUrl: String?, completion: @escaping () -> Void) {
        // Convert and validate phone number
            guard let phoneNumberInt = Int(facilityPhoneNumberTextField.text ?? "") else {
                presentAlert(title: "Error", message: "Invalid phone number.")
                return
            }

            let username = facilityUsernameTextField.text ?? ""
            let password = facilityPasswordTextField.text ?? ""
            let name = facilityNameTextField.text ?? ""
            let location = facilityLocationTextField.text ?? ""
            let isOpen24Hours = isAlwaysOpenSwitch.isOn
            let facilityType: FacilityType = facilityTypeSC.selectedSegmentIndex == 0 ? .hospital : .lab
            let openingTimeComponents = Calendar.current.dateComponents([.hour, .minute], from: openingTimeDP.date)
            let closingTimeComponents = Calendar.current.dateComponents([.hour, .minute], from: closingTimeDP.date)

            if let facility = self.facility {
                // Updating existing facility
                facility.username = username
                facility.password = password
                facility.name = name
                facility.phoneNumber = phoneNumberInt
                facility.location = location
                facility.isOpen24Hours = isOpen24Hours
                facility.facilityType = facilityType
                facility.openingTime = openingTimeComponents
                facility.closingTime = closingTimeComponents
                facility.logoImageName = logoUrl ?? facility.logoImageName 

                AppData.editFacility(facility: facility)
                
            } else {
                // Create a new Facility object
                
                let newFacility = Facility(username: username, password: password, phoneNumber: phoneNumberInt, name: name, location: location, isOpen24Hours: isOpen24Hours, openingTime: openingTimeComponents, closingTime: closingTimeComponents, facilityType: facilityType, logoImageName: logoUrl ?? "defaultLogo.jpeg")
                
                AppData.addFacility(facility: newFacility)
                
            }
            completion()
            
        }
    
    private func finalizeFacilityUpdate() {
        AppData.saveFacilities()
        refreshFacilityList()
        print("Navigating back after facility update")
        navigationController?.popViewController(animated: true)
    }

    // MARK: - Image Upload to Firebase Storage
    func uploadImage(_ image: UIImage, completion: @escaping (_ url: String?) -> Void) {
        
        // Convert the image to data and determine the file extension
            let imageData: Data
            let fileExtension: String

            if let jpegData = image.jpegData(compressionQuality: 0.8) {
                imageData = jpegData
                fileExtension = "jpg"
            } else if let pngData = image.pngData() {
                imageData = pngData
                fileExtension = "png"
            } else {
                print("Unsupported image format")
                completion(nil)
                return
            }

            // Define the file name with the appropriate file extension
            let fileName = "images/\(UUID().uuidString).\(fileExtension)"
            let storageRef = Storage.storage().reference().child(fileName)

            // Start the upload task
            let uploadTask = storageRef.putData(imageData, metadata: nil) { metadata, error in
                guard let _ = metadata else {
                    // Handle any errors
                    print("Error during image upload: \(String(describing: error))")
                    completion(nil)
                    return
                }

                // Once the image has been uploaded, retrieve its download URL
                storageRef.downloadURL { url, error in
                    guard let downloadURL = url else {
                        // Handle any errors in retrieving the download URL
                        print("Error retrieving download URL: \(String(describing: error))")
                        completion(nil)
                        return
                    }
                    completion(downloadURL.absoluteString)
                }
            }

    }
    
    func fetchImage(withName imageName: String, completion: @escaping (UIImage?) -> Void) {
        let storageRef = Storage.storage().reference()

        // Try fetching .jpg first, then .jpeg if that fails
        storageRef.child("images/\(imageName).jpg").downloadURL { (url, error) in
            if let url = url {
                // Download image using URL...
            } else {
                // Try with .jpeg extension...
                storageRef.child("images/\(imageName).jpeg").downloadURL { (url, error) in
                    if let url = url {
                        // Download image using URL...
                    } else {
                        print("Error fetching image: \(String(describing: error))")
                        completion(nil)
                    }
                }
            }
        }
    }
    
    func loadImage(from url: String, into imageView: UIImageView) {
        guard let imageURL = URL(string: url) else {
            print("Invalid image URL: \(url)")
            return
        }

        URLSession.shared.dataTask(with: imageURL) { data, response, error in
            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                  let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                  let data = data, error == nil,
                  let image = UIImage(data: data) else {
                print("Error fetching image: \(String(describing: error))")
                return
            }

            DispatchQueue.main.async {
                imageView.image = image
            }
        }.resume()
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
        if let image = info[.originalImage] as? UIImage {
                selectedImage = image
                facilityLogo.image = image
            }
        dismiss(animated: true, completion: nil)
    }
}
