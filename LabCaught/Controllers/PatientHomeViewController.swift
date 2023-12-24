//
//  PatientHomeViewController.swift
//  LabCaught
//
//  Created by Nada Naser Ahmed Abdulla Abdulkarim Alawadhi on 20/12/2023.
//

import UIKit

class PatientHomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var specializationLbl: UILabel!
    @IBOutlet weak var openingLbl: UILabel!
    
    var facility: Facility?
    var services: [Service]?
    
    init?(coder: NSCoder, facility: Facility?){
        self.facility = facility
        super.init(coder: coder)
        self.services = fillServices(facility: facility)
    }
    
    required init?(coder: NSCoder) {
        self.facility = nil
        self.services = nil
        super.init(coder: coder)
    }
    
    func fillServices(facility: Facility?) -> [Service]{
        guard let facility = facility else {return[]}
        
        // Filter services based on the facility attribute
        let filteredServices = services?.filter { $0.facility == facility } ?? []
        
        return filteredServices
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
        //openingLbl.text = facility.openingTime
    }
    
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return services!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PHFCell", for: indexPath) as! PatientHomeFacilityTableViewCell
        
        let service = services![indexPath.row]
        
        cell.configure(service: service)

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
