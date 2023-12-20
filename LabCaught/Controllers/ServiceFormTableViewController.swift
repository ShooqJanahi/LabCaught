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
    
    var packageItemsIndexPath = IndexPath(row: 5, section: 0)
    var expiryDateIndexPAth = IndexPath(row: 6, section: 0)
    
    var service: Service?
    //var currentType: serviceType = .Test
    
    var name: String = ""
    var cost: String = ""
    var descrip: String = ""
    var instructions: String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        
        /*func updateCurrentType() {
            currentType = serviceTypeSC.selectedSegmentIndex == 0 ? .Test : .Packages
        }*/
        
        
        // MARK: - Table view data source
        
        /*override func numberOfSections(in tableView: UITableView) -> Int {
         // #warning Incomplete implementation, return the number of sections
         return 1
         }
         
         override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         // #warning Incomplete implementation, return the number of rows
         return 0
         }*/
        
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
        
    } }
