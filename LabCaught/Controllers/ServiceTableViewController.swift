//
//  ServiceTableViewController.swift
//  LabCaught
//
//  Created by Sara Khalifa Ebrahim Khalifa Hamdan on 20/12/2023.
//

import UIKit

class ServiceTableViewController: UITableViewController {


    var services = AppData.services
    var displayedServices: [Service] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDisplayedServices(segment: .tests)
        }
    
    // An enum to differentiate between segments
    enum ServiceSegment: Int {
        case tests = 0
        case packages = 1
    }

    // Function to update the displayed services
    func updateDisplayedServices(segment: ServiceSegment) {
        switch segment {
        case .tests:
            displayedServices = AppData.services.filter { $0 is Test }
        case .packages:
            displayedServices = AppData.services.filter { $0 is Packages }
        }
        
        tableView.reloadData() // Reload the table view with the filtered data
    }

        
    
    
    @IBAction func updateDisplayedServices(_ sender: UISegmentedControl) {
        guard let selectedSegment = ServiceSegment(rawValue: sender.selectedSegmentIndex) else { return }
        updateDisplayedServices(segment: selectedSegment)
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedServices.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "serviceCell", for: indexPath) as! ServiceTableViewCell
        
        let service = displayedServices[indexPath.row]
        cell.configure(service: service)
        
        return cell
    }
    

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Present confirmation alert
            let alert = UIAlertController(title: "Delete", message: "Are you sure you want to delete this item?", preferredStyle: .alert)
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { _ in
                // Perform the deletion
                self.services.remove(at: indexPath.row)
                AppData.services.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            
            alert.addAction(deleteAction)
            alert.addAction(cancelAction)
            
            // Present the alert
            DispatchQueue.main.async {
                self.present(alert, animated: true)
            }
        }
    }

    
    func performDeletion(at indexPath: IndexPath) {
             // Delete the facility from the data source
                 AppData.sampleFacilities.remove(at: indexPath.row)
                 //updateDisplayedFacilities()
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editSegue",
           let destinationVC = segue.destination as? ServiceFormTableViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            
            let selectedService = displayedServices[indexPath.row]
            destinationVC.service = selectedService
        }
    }
    
    /*override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "editSegue", sender: self)
    }*/


    
    

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
