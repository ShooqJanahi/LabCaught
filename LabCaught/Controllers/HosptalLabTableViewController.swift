//
//  HosptalLabTableViewController.swift
//  LabCaught
//
//  Created by Shaikha Hasan Ali Hasan Ali Mohamed on 20/12/2023.
//

import UIKit

class HosptalLabTableViewController: UITableViewController {

    var faclities: [Facility] = AppData.facilites
    
    var facility: Facility?

        required init?(coder: NSCoder) {
            super.init(coder: coder)
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //show hospitals by default
        if let segmentedControl = self.navigationItem.titleView as? UISegmentedControl {
                segmentedControl.selectedSegmentIndex = 0
            }

        updateDisplayedFacilities()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return faclities.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HospitalLabCell", for: indexPath) as! HospitalLabTableViewCell

        // Configure the cell...
        let facility = faclities[indexPath.row]
        cell.configure(faclity: facility)


        return cell
    }


    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
                    let alert = UIAlertController(title: "Delete", message: "Are you sure you want to delete this item?", preferredStyle: .alert)
                    let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { _ in
                        self.performDeletion(at: indexPath)
                    }
                    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
                    alert.addAction(deleteAction)
                    alert.addAction(cancelAction)
                    present(alert, animated: true)
                }
        /*
        if editingStyle == .delete {
                // Present confirmation alert
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Delete", message: "Are you sure you want to delete this item?", preferredStyle: .alert)
                    let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { _ in
                        // Perform the deletion
                        self.performDeletion(at: indexPath)
                    }
                    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
                    alert.addAction(deleteAction)
                    alert.addAction(cancelAction)
                    self.present(alert, animated: true)
                }
            }
         */
    }
    
    func performDeletion(at indexPath: IndexPath) {
        // Delete the facility from the data source
            AppData.sampleFacilities.remove(at: indexPath.row)
            updateDisplayedFacilities()
   }
   
    func updateDisplayedFacilities() {
       
        if let segmentedControl = self.navigationItem.titleView as? UISegmentedControl {
               let selectedIndex = segmentedControl.selectedSegmentIndex
               switch selectedIndex {
               case 0:
                   faclities = AppData.sampleFacilities.filter { $0.facilityType == .hospital }
               case 1:
                   faclities = AppData.sampleFacilities.filter { $0.facilityType == .lab }
               default:
                   faclities = AppData.sampleFacilities
               }
           } else {
               // Default to showing hospitals if segmented control is not available
               faclities = AppData.sampleFacilities.filter { $0.facilityType == .hospital }
           }

           // Reload the table view data
           tableView.reloadData()
   }
    

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
    
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
                // Hospital is selected
            faclities = AppData.sampleFacilities.filter { $0.facilityType == .hospital }
            } else {
                // Lab is selected
                faclities = AppData.sampleFacilities.filter { $0.facilityType == .lab }
            }
            tableView.reloadData() // Reload the table view with the filtered data
        
    }
    /*
    @IBSegueAction func editFacility(_ coder: NSCoder, sender: Any?) -> FacilityFormTableViewController? {
        
        // Determine which facility was selected
                    guard let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) else {
                        return nil
                    }

                    // Retrieve the selected facility
                    let selectedFacility = AppData.sampleFacilities[indexPath.row]

                    // Create the FacilityFormTableViewController with the selected facility
                    let editViewController = FacilityFormTableViewController(coder: coder, facility: selectedFacility)

                    return editViewController
        
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showEditFacilitySegue", let destinationVC = segue.destination as? FacilityFormTableViewController, let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
            destinationVC.facility = AppData.sampleFacilities[indexPath.row]
        }
    }
    
}
