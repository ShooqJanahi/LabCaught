//
//  HosptalLabTableViewController.swift
//  LabCaught
//
//  Created by Shaikha Hasan Ali Hasan Ali Mohamed on 20/12/2023.
//

import UIKit

class HosptalLabTableViewController: UITableViewController {

    var facilities: [Facility] = AppData.facilites.filter{ $0.facilityType == .hospital }
    
    
    @IBOutlet weak var facilityTypeSC: UISegmentedControl!
    
    
    //var facility: Facility?

    func filterFacilities() {
            if facilityTypeSC.selectedSegmentIndex == 0 { //0 is for hospitals
                facilities = AppData.facilites.filter { $0.facilityType == .hospital }
            } else { //1 is for labs
                facilities = AppData.facilites.filter { $0.facilityType == .lab }
            }
            tableView.reloadData()
    }
    
        required init?(coder: NSCoder) {
            super.init(coder: coder)
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //super.viewDidLoad()
        filterFacilities()
        //AppData.loadFacilities()
        //show hospitals by default
        if let segmentedControl = self.navigationItem.titleView as? UISegmentedControl {
                segmentedControl.selectedSegmentIndex = 0
            }


    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return facilities.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HospitalLabCell", for: indexPath) as! HospitalLabTableViewCell

        // Configure the cell...
        let facility = facilities[indexPath.row]
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
            confirmation(title: AlertTitle.DeleteConfirm.rawValue, message: AlertMessage.DeleteConfirm.rawValue) {
                
                
                AppData.deleteFacility(facility: self.facilities[indexPath.row])
                
                self.facilities.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                
                
            }
        }
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Refresh the facilities list
        filterFacilities()
    }
    
  
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        filterFacilities()
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
            destinationVC.facility = facilities[indexPath.row]
        }
    }
    
}
