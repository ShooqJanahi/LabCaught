//
//  patientBookingTableViewController.swift
//  LabCaught
//
//  Created by Maryam Salah Hashem Adnan Saleh on 13/12/2023.
//

import UIKit

class patientBookingTableViewController: UITableViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    func categorizeBookings() {
        upcomingBookings = listOfBookings.filter{
            $0.status == .upcoming
        }
        completedBookings = listOfBookings.filter{
            $0.status == .completed
        }
        cancelledBookings = listOfBookings.filter{
            $0.status == .cancelled
        }
    }

    
    //declare
    var listOfBookings = AppData.bookings
    var upcomingBookings : [booking] = []
    var completedBookings : [booking] = []
    var cancelledBookings : [booking] = []
    var selectedSegement = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       categorizeBookings()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    @IBAction func segmentedControlChanged(_ sender: Any) {
        selectedSegement = segmentedControl.selectedSegmentIndex
        tableView.reloadData()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    var bookings = AppData.sampleBookings
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch selectedSegement {
               case 0: return upcomingBookings.count
               case 1: return completedBookings.count
               case 2: return cancelledBookings.count
               default: return bookings.count
               }
     
    }

 
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "book", for: indexPath) as! PatientHistoryTableViewCell
        
        let book: booking
        switch selectedSegement {
        case 0: book = upcomingBookings[indexPath.row]
        case 1: book = completedBookings[indexPath.row]
        case 2: book = cancelledBookings[indexPath.row]
        default: fatalError("Invalid segment")
        }

    //    let book = bookings[indexPath.row]
   
      
        
        guard let year = book.booking_date.year, let month = book.booking_date.month, let day = book.booking_date.day else {
            return cell
        }
        cell.Date.text = "\(day)-\(month)-\(year)"
        cell.testName.text = book.medicalService.name
        cell.labName.text = book.medicalService.facility.name
        
      
        // Configure the cell...

        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? viewBookingTableViewController, let selected = tableView.indexPathForSelectedRow{
            destination.selectedTest = bookings[selected.row]
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        categorizeBookings()
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
