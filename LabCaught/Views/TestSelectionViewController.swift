//
//  TestSelectionViewController.swift
//  LabCaught
//
//  Created by Sara Khalifa Ebrahim Khalifa Hamdan on 24/12/2023.
//

import UIKit

protocol TestSelectionViewControllerDelegate: AnyObject {
    func testSelectionViewController(_ controller: TestSelectionViewController, didSelectTests selectedTests: [Test])
}

class TestSelectionViewController: UITableViewController {
   
    weak var delegate: TestSelectionViewControllerDelegate?
        var tests: [Test] = AppData.tests
        var selectedIndexPaths: [IndexPath] = []

        override func viewDidLoad() {
            super.viewDidLoad()
            tableView.allowsMultipleSelection = true
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return tests.count
        }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TestCell", for: indexPath)
        let test = tests[indexPath.row]
        cell.textLabel?.text = test.name
        cell.accessoryType = selectedIndexPaths.contains(indexPath) ? .checkmark : .none
        return cell
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedIndex = selectedIndexPaths.firstIndex(of: indexPath) {
            selectedIndexPaths.remove(at: selectedIndex)
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            selectedIndexPaths.append(indexPath)
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        // If allowing deselection:
        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let selectedIndex = selectedIndexPaths.firstIndex(of: indexPath) {
            selectedIndexPaths.remove(at: selectedIndex)
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
    }

        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            let selectedTests = selectedIndexPaths.map { tests[$0.row] }
            delegate?.testSelectionViewController(self, didSelectTests: selectedTests)
        }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


