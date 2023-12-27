//
//  LabBookingsTableViewController.swift
//  LabCaught
//
//  Created by Nada Naser Ahmed Abdulla Abdulkarim Alawadhi on 26/12/2023.
//

import UIKit

class LabBookingsTableViewController: UITableViewController {
    
    @IBOutlet weak var segment: UISegmentedControl!
    
    var bookings: [booking] = AppData.bookings.filter{$0.medicalService.facility.username == AppData.getLoggedInUsername()}

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        segmentChange(segment)
    }
    
    
    @IBAction func segmentChange(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            bookings = AppData.bookings.filter{$0.medicalService.facility.username == AppData.getLoggedInUsername() && $0.status == .upcoming}
        }else if(sender.selectedSegmentIndex == 1){
            bookings = AppData.bookings.filter{$0.medicalService.facility.username == AppData.getLoggedInUsername() && $0.status == .completed}
        }else{
            bookings = AppData.bookings.filter{$0.medicalService.facility.username == AppData.getLoggedInUsername() && $0.status == .cancelled}
        }
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return bookings.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BCell", for: indexPath) as! LabBookingsTableViewCell
        
        let booking = bookings[indexPath.row]
        
        cell.configure(booking: booking)

        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
