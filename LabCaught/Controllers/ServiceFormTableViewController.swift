//
//  ServiceFormTableViewController.swift
//  LabCaught
//
//  Created by Sara Khalifa Ebrahim Khalifa Hamdan on 20/12/2023.
//

import UIKit

class ServiceFormTableViewController: UITableViewController {
    
    @IBOutlet weak var serviceTypeSC: UISegmentedControl!
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var costTxt: UITextField!
    @IBOutlet weak var descriptionTxt: UITextField!
    @IBOutlet weak var instructionsTxt: UITextField!
    
    @IBOutlet weak var saveBtn: UIBarButtonItem!
    
    @IBOutlet weak var testsList: UILabel!
    @IBOutlet weak var expiryDate: UIDatePicker!
    
    
    enum ServiceFormSection: Int, CaseIterable {
        case seg = 0
        case name
        case cost
        case description
        case instructions
        case packageItems
        case expiryDate

        static var count: Int {
            return self.allCases.count
        }
    }
    
    enum ServiceType: Int {
        case test = 0, package
    }

    var currentServiceType: ServiceType = .test
    
    var service: Service?
    
    var name: String = ""
    var cost: String = ""
    var descrip: String = ""
    var instructions: String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        serviceTypeChanged(serviceTypeSC)
        updateViews()
    }
    
    func updateViews() {
        guard let service = service else {
            title = "Add Service"
            return
        }
        
        title = "Edit Service"
        nameTxt.text = service.name
        costTxt.text = service.cost
        descriptionTxt.text = service.describtion
        instructionsTxt.text = service.insrtuctions
        
        if service is Test {
                serviceTypeSC.selectedSegmentIndex = ServiceType.test.rawValue
                currentServiceType = .test
            } else if let package = service as? Packages {
                serviceTypeSC.selectedSegmentIndex = ServiceType.package.rawValue
                currentServiceType = .package
                
                // Set the date picker to the package's expiry date
                if let calendar = package.packageExpiry.calendar {
                    expiryDate.date = calendar.date(from: package.packageExpiry) ?? Date()
                }
            }
        // reload table view to reflect changes
        tableView.reloadData()
        }
    
        
        
        
        // MARK: - Table view data source
        
        /*override func numberOfSections(in tableView: UITableView) -> Int {
         // #warning Incomplete implementation, return the number of sections
         return 1
         }*/
         

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if currentServiceType == .package && (section == ServiceFormSection.packageItems.rawValue || section == ServiceFormSection.expiryDate.rawValue) {
            return 1 // Assuming there is 1 row in each of these sections for packages
        } else if currentServiceType == .test && (section == ServiceFormSection.packageItems.rawValue || section == ServiceFormSection.expiryDate.rawValue) {
            return 0 // Hide rows for tests
        }
        return super.tableView(tableView, numberOfRowsInSection: section)
    }

    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // If 'Tests' is selected and the section is 'packageItems' or 'expiryDate', return an empty string.
        if currentServiceType == .test && (section == ServiceFormSection.packageItems.rawValue || section == ServiceFormSection.expiryDate.rawValue) {
            return ""
        }
        // For all other cases, return the normal section title.
        return super.tableView(tableView, titleForHeaderInSection: section)
    }

        
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = super.tableView(tableView, cellForRowAt: indexPath)
            return cell
            //tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
         }
    
    
    @IBAction func serviceTypeChanged(_ sender: UISegmentedControl) {
        currentServiceType = sender.selectedSegmentIndex == 0 ? .test : .package
        tableView.reloadData()
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
