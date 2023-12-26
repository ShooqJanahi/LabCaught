//
//  PatientHomeViewController.swift
//  LabCaught
//
//  Created by Nada Naser Ahmed Abdulla Abdulkarim Alawadhi on 20/12/2023.
//

import UIKit

class PatientHomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var specializationLbl: UILabel!
    @IBOutlet weak var openingLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var facility: Facility?
    var services: [Service] = []
    var filteredServices: [Service] = []
    
    init?(coder: NSCoder, facility: Facility?){
        self.facility = facility
        if let facility = facility{
            services = AppData.getServices(facility: facility)
            filteredServices = services.compactMap{ $0 as? Test }
        }
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        self.facility = nil
        super.init(coder: coder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
        guard let facility = facility else { return }
        
        nameLbl.text = facility.name
        locationLbl.text = facility.location
        specializationLbl.text = facility.facilityType.description
        //openingLbl.text = facility.openingTime.description//wrong
        //imageView.image = facility.logoImageName
    }
    
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredServices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PHFCell", for: indexPath) as! PatientHomeFacilityTableViewCell
        
        let service = filteredServices[indexPath.row]
        
        cell.configure(service: service)

        return cell
    }
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            filteredServices = services.compactMap{ $0 as? Test}
        } else {
            filteredServices = services.compactMap{ $0 as? Packages}
        }
        
        tableView.reloadData()
    }
    
    

    
    // MARK: - Navigation
    
    @IBSegueAction func bookPage(_ coder: NSCoder, sender: Any?) -> bookableViewController? {
        
        var choosenService: Service?
        if let cell = sender as? PatientHomeFacilityTableViewCell,
           let indexPath = tableView.indexPath(for: cell){
            choosenService = filteredServices[indexPath.row] as Service
        }
        
        return bookableViewController(coder: coder, service: choosenService)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? bookableViewController, let selected = tableView.indexPathForSelectedRow{
            destination.test = filteredServices[selected.row]
        }
    }
    
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
