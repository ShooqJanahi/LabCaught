//
//  HospitalLabTableViewCell.swift
//  LabCaught
//
//  Created by Shaikha Hasan Ali Hasan Ali Mohamed on 20/12/2023.
//

import UIKit
import FirebaseStorage

class HospitalLabTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var facilityNameLabel: UILabel!
    @IBOutlet weak var FacilityLocationLabel: UILabel!
    @IBOutlet weak var FacilityTypeLabel: UILabel!
    @IBOutlet weak var FacilityLogo: UIImageView!
    
    
    func configure (faclity: Facility) {
        facilityNameLabel.text = faclity.name
        FacilityLocationLabel.text = faclity.location
        FacilityTypeLabel.text = faclity.facilityType.rawValue
        
        // Create a reference to the storage service using the default Firebase App
            //let storage = Storage.storage()

            // Create a reference to the file you want to download
            let storageRef = Storage.storage().reference().child("images/\(faclity.logoImageName)")

            // Download the image
            storageRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
                if let error = error {
                    // Handle any errors
                    print("Error downloading image: \(error)")
                } else if let data = data {
                    // Data for "images/facility.logoImageName" is returned
                    let image = UIImage(data: data)
                    self.FacilityLogo.image = image
                }
            }
        
        /*
        if let error = error {
            print("Error downloading image: \(error)")
            self.FacilityLogo.image = UIImage(named: "placeholder_image")
        } else if let data = data {
            // ...
        }
        */
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
