//
//  HosptalLabTableViewController.swift
//  LabCaught
//
//  Created by Shaikha Hasan Ali Hasan Ali Mohamed on 14/12/2023.
//

import UIKit

class HosptalLabTableViewController: UITableViewController {

    
    @IBOutlet weak var facilityTypeSC: UISegmentedControl!
    
    var labs : [Labs] = LabData.labs
    
    //var users : [User] = AppData.users.compactMap{ $0 as? Teacher }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    func loadFacilities(ofType type: FacilityType) {
        
        
    }
    
    @IBAction func facilitytypeChanged(_ sender: UISegmentedControl) {
        //loadFacilities()
        
        switch sender.selectedSegmentIndex {
        case 0:
            loadFacilities(ofType: .hospital)
        case 1:
            loadFacilities(ofType: .lab)
        default:
            break
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return labs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.HospitalLabCell.rawValue, for: indexPath) as! HospitalLabTableViewCell
        
        //let lab = Labs[indexPath.row]
        //cell.configure(with: lab)

        // Configure the cell...

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
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
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

}
