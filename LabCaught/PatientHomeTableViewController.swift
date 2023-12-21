//
//  PatientHomeTableViewController.swift
//  LabCaught
//
//  Created by Nada Naser Ahmed Abdulla Abdulkarim Alawadhi on 19/12/2023.
//

import UIKit

class PatientHomeTableViewController: UITableViewController, UISearchControllerDelegate, UISearchBarDelegate, UISearchResultsUpdating {
    
    
    var facilities = AppData.facilites
    
    var appDataItems: [SearchCell] = []
    var items: [SearchCell] = []
    let search = UISearchController()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items = AppData.facilites
        appDataItems = items
        
        self.navigationItem.searchController = search
        navigationController?.hidesBarsOnSwipe = false
        navigationItem.hidesSearchBarWhenScrolling = false
        self.search.searchBar.scopeButtonTitles = ["All", "Labs", "Hospitals"]
        self.search.searchBar.showsScopeBar = true
        navigationItem.preferredSearchBarPlacement = .stacked
        search.searchResultsUpdater = self
         
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func updateSearchResults(for search: UISearchController) {
        
        let scope = search.searchBar.selectedScopeButtonIndex
        if let term = search.searchBar.text?.lowercased().trimmingCharacters(in: .whitespaces),
           !term.isEmpty {
            items = appDataItems.filter { item in
                // scope 0 remaining
                if scope == 0 {
                    if let fac = item as? Facility {
                        return fac.name.lowercased().contains(term)
                    }
                    
                } else if scope == 1 {
                    if let fac = item as? Facility {
                        return fac.facilityType == .lab && (fac.name.lowercased().contains(term))
                    }
                } else if scope == 2 {
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
            filterItems()
        }
        tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterItems()
        tableView.reloadData()
    }
    
    func filterItems() {
        switch self.search.searchBar.selectedScopeButtonIndex {
            case 0:
                items = appDataItems
            case 1:
                items = appDataItems.compactMap { item in
                    if let item = item as? Facility {
                        if item.facilityType == .lab {
                            return item
                        }
                    }
                    return nil
                }
                
            case 2:
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

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PHCell", for: indexPath) as! PatientHomeTableViewCell
        
        let item = items[indexPath.row]
        
        cell.configure(item: item)

        return cell
    }
    /*
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
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
