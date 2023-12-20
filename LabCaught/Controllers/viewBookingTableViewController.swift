//
//  viewBookingTableViewController.swift
//  LabCaught
//
//  Created by Maryam Salah Hashem Adnan Saleh on 14/12/2023.
//

import UIKit

class viewBookingTableViewController: UITableViewController {


    
    
    //@IBOutlet weak var TestPackageName: UILabel!
    //@IBOutlet weak var Location: UILabel!
    //@IBOutlet weak var Price: UILabel!
    //@IBOutlet weak var Date: UILabel!
    //@IBOutlet weak var PackageIncludes: UILabel!
    //@IBOutlet weak var Description: UILabel!
    //@IBOutlet weak var instruction: UILabel!
    var selectedTest: Test?
    @IBOutlet weak var n: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    func updateView(){
       // date.text = "Booking Date:"
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        // #warning Incomplete implementation, return the number of rows
        return 10
        
  
        
    }
    //var bookings: [Booking?] = AppData.bookings
 
 /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let bo = bookings[indexePath.row
        /*
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "schedule", for: indexPath) as! BookingDetailsConfirmedTableViewCell
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "dateBook", for: indexPath) as! BookingDetailsConfirmedTableViewCell
            return cell
        } else if indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "State", for: indexPath) as! BookingDetailsConfirmedTableViewCell
            return cell
        } else if indexPath.row == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Loc", for: indexPath) as! BookingDetailsConfirmedTableViewCell
            return cell
        } else if indexPath.row == 4{
            let cell = tableView.dequeueReusableCell(withIdentifier: "labe", for: indexPath) as! BookingDetailsConfirmedTableViewCell
            return cell
        } else if indexPath.row == 5{
            let cell = tableView.dequeueReusableCell(withIdentifier: "NameTest", for: indexPath) as! BookingDetailsConfirmedTableViewCell
            cell.Namee.text = "ok"
            return cell
        } else if indexPath.row == 6{
            let cell = tableView.dequeueReusableCell(withIdentifier: "PriceCell", for: indexPath) as! BookingDetailsConfirmedTableViewCell
            return cell
        } else if indexPath.row == 7{
            let cell = tableView.dequeueReusableCell(withIdentifier: "InstructionCell", for: indexPath) as! BookingDetailsConfirmedTableViewCell
            return cell
        } else if indexPath.row == 8{
            let cell = tableView.dequeueReusableCell(withIdentifier: "descriptionCell", for: indexPath) as! BookingDetailsConfirmedTableViewCell
            return cell
        }  else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PackageInncludeCell", for: indexPath) as! BookingDetailsConfirmedTableViewCell
            return cell
        }
*/
    }
  */
  
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

