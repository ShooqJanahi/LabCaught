//
//  bookingdateTableViewController.swift
//  LabCaught
//
//  Created by Maryam Salah on 18/12/2023.
//

import UIKit

class bookableViewController: UITableViewController {
    
    //declare elements
    
    @IBAction func bookBtn(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Confirm Booking", message: "Are you sure you want to proceed with the booking?", preferredStyle: .alert)
        
        let bookAction = UIAlertAction(title: "Book", style: .default) { _ in
            self.handleBookingConfirmed()
        }
        alert.addAction(bookAction)

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)

        present(alert, animated: true, completion: nil)
    }

    private func handleBookingConfirmed() {
        // Add your booking confirmation logic here
    }

    // Call this method when the user initiates the booking process
        




    var isEditingDate = false {
        didSet {
            tableView.beginUpdates()
            tableView.endUpdates()
            // Assuming you add a UILabel for the date, update its color and text here
            //dobLabel.textColor = isEditingDate ? .blue : .label // Change color as needed
            //dobLabel.text = formattedDate(date: datePicker.date)
        }
    }

    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet weak var dobLabel: UILabel! // Make sure to connect this IBOutlet in your storyboard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Additional setup if needed
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8 // One row for the trigger, one for the date picker
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Trigger", for: indexPath)
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DatePick", for: indexPath)
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "location", for: indexPath)
            return cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "name", for: indexPath)
            return cell
        } else if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cost", for: indexPath)
            return cell
        } else if indexPath.row == 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "instruction", for: indexPath)
            return cell
        } else if indexPath.row == 6 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "description", for: indexPath)
            return cell
        } else if indexPath.row == 7 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "testInclude", for: indexPath)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "testInclude", for: indexPath)
            return cell
        }
        
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1 && !isEditingDate {
            return 0 // Hide the date picker cell
        } else {
            return UITableView.automaticDimension
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            isEditingDate.toggle() // Toggle visibility of date picker
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }

    // Action for date picker value changed
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        dobLabel.text = formattedDate(date: sender.date)
    }

    // Format the date to a string
    private func formattedDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }

    // Modify the saveButtonTapped method
    //@IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
      //  let selectedDate = datePicker.date
        // Use selectedDate to create new Employee object
        // ...
    //}
}
