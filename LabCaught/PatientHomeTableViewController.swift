//
//  PatientHomeTableViewController.swift
//  LabCaught
//
//  Created by Nada Naser Ahmed Abdulla Abdulkarim Alawadhi on 19/12/2023.
//

import UIKit

class PatientHomeTableViewController: UITableViewController, UISearchControllerDelegate, UISearchBarDelegate, UISearchResultsUpdating {
    
    // Array of facilities from AppData and arrays for search functionality
    var facilities = AppData.facilites
    var appDataItems: [SearchCell] = []
    var items: [SearchCell] = []
    
    // UISearchController to manage the presentation of the search bar
    let search = UISearchController()

    // Called when the view controller's view is loaded into memory
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initial setup of items and appDataItems
        items = AppData.facilites
        appDataItems = items
        
        
        // Configuring the search controller and search bar
        self.navigationItem.searchController = search
        navigationController?.hidesBarsOnSwipe = false
        navigationItem.hidesSearchBarWhenScrolling = false
        self.search.searchBar.scopeButtonTitles = ["All", "Labs", "Hospitals"]
        self.search.searchBar.showsScopeBar = true
        navigationItem.preferredSearchBarPlacement = .stacked
        search.searchResultsUpdater = self
         
    }
    
    // Called before the view is added to the view hierarchy
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // Updates the search results based on the search bar text and selected scope
    func updateSearchResults(for search: UISearchController) {
        
        let scope = search.searchBar.selectedScopeButtonIndex
        if let term = search.searchBar.text?.lowercased().trimmingCharacters(in: .whitespaces),
           !term.isEmpty {
            // Filters items based on search term and selected scope
            items = appDataItems.filter { item in
                // Filter logic for different scopes
                // scope 0 remaining
                if scope == 0 { //All
                    if let fac = item as? Facility {
                        return fac.name.lowercased().contains(term)
                    }
                    
                } else if scope == 1 { // Labs
                    if let fac = item as? Facility {
                        return fac.facilityType == .lab && (fac.name.lowercased().contains(term))
                    }
                } else if scope == 2 { // Hospitals
                    if let fac = item as? Facility {
                        //print("\(term): contains: \(fac.area.lowercased().contains("diraz"))")
                        return fac.facilityType == .hospital && (fac.name.lowercased().contains(term))
                    }
                }
                // else case?
                return false
                
            }
        }
        else {
            // Resets items if no search term is present
            filterItems()
        }
        tableView.reloadData()
    }
    
    // Updates the items based on the selected scope button
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterItems()
        tableView.reloadData()
    }
    
    // Filters items based on the selected scope button
    func filterItems() {
        switch self.search.searchBar.selectedScopeButtonIndex {
            case 0: // All
                items = appDataItems
            case 1: // Labs
                items = appDataItems.compactMap { item in
                    if let item = item as? Facility {
                        if item.facilityType == .lab {
                            return item
                        }
                    }
                    return nil
                }
                
            case 2: // Hospitals
                items = appDataItems.compactMap { item in
                    if let item = item as? Facility {
                        if item.facilityType == .hospital {
                            return item
                        }
                    }
                    return nil
                }
                
        default:
            return
                
        }
    }
    
    
    // MARK: - Table view data source

    // Returns the number of sections in the table view
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // Returns the number of rows in a given section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
        
    }

    // Configures and returns the cell for a given row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PHCell", for: indexPath) as! PatientHomeTableViewCell
        
        let item = items[indexPath.row]
        
        cell.configure(item: item)

        return cell
    }
    
    // MARK: - Navigation
    
    // Prepares for the segue to the facility page view controller
    @IBSegueAction func facilityPage(_ coder: NSCoder, sender: Any?) -> PatientHomeViewController? {
        
        var choosenFacility: Facility?
        if let cell = sender as? PatientHomeTableViewCell,
           let indexPath = tableView.indexPath(for: cell){
            choosenFacility = items[indexPath.row] as? Facility
        }
        return PatientHomeViewController(coder: coder, facility: choosenFacility)
    }

}
