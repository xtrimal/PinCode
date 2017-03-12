//
//  MasterViewController.swift
//  Register
//
//  Created by AleX on 3/9/17.
//  Copyright © 2017 AleX. All rights reserved.
//

import UIKit
import CoreData

class MasterViewController: UITableViewController, NSFetchedResultsControllerDelegate {

    var detailViewController: DetailViewController? = nil
    var managedObjectContext: NSManagedObjectContext? = nil
    
    var isOnline = true

    @IBOutlet weak var employeeImageView: UIImageView!
    @IBOutlet weak var onlineStatusView: UIView!
    @IBOutlet weak var openCloseButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        
        setupOnlineStatus()
        setupOpenCloseButton()
        setupEmployee()
    }
    
    //online status indication setup
    func setupOnlineStatus() {
        onlineStatusView.layer.cornerRadius = onlineStatusView.frame.size.width / 2
        onlineStatusView.layer.borderWidth = 1.0
        onlineStatusView.layer.borderColor = UIColor.lightGray.cgColor
        onlineStatusView.layoutIfNeeded()
        
        if isOnline {
            onlineStatusView.backgroundColor = UIColor.green;
        } else {
            onlineStatusView.backgroundColor = UIColor.lightGray;
        }
    }
    
    //OpenCloseButton visual and status setup
    func setupOpenCloseButton() {
        openCloseButton.layer.cornerRadius = 5
        openCloseButton.layer.borderWidth = 2.0
        openCloseButton.layer.borderColor = UIColor.lightGray.cgColor
        openCloseButton.layoutIfNeeded()
        
        //OpenCloseButton status setup should be here
    }
    
    //Employee data setup (photo, name, cash etc)
    func setupEmployee() {
        employeeImageView.layer.cornerRadius = employeeImageView.frame.size.width / 2
        employeeImageView.layer.borderWidth = 2.0
        employeeImageView.layer.borderColor = UIColor.lightGray.cgColor
        employeeImageView.layoutIfNeeded()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
//            if let indexPath = self.tableView.indexPathForSelectedRow {
//            let object = self.fetchedResultsController.object(at: indexPath)
//                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
//            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
//        if self.fetchedResultsController.sections != nil {
//            return self.fetchedResultsController.sections!.count
//        }
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 6
        }
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        OrganizationNameCell
//        SellScreenCell
//        SalesHistoryCell
//        CashManagementCell
//        CloseRegisterCell
//        DashboardCell
//        SettingsCell
//        Employee
//        let cell = tableView.dequeueReusableCell(withIdentifier: "OrganizationNameCell", for: indexPath)
        
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        // this is where you set your color view
        let customColorView = UIView.init()
        customColorView.backgroundColor = UIColor.darkGray
        cell.selectedBackgroundView =  customColorView
        
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }

    /*
     // Implementing the above methods to update the table view in response to individual changes may have performance implications if a large number of changes are made simultaneously. If this proves to be an issue, you can instead just implement controllerDidChangeContent: which notifies the delegate that all section and object changes have been processed.
     
     func controllerDidChangeContent(controller: NSFetchedResultsController) {
         // In the simplest, most efficient, case, reload the table view.
         self.tableView.reloadData()
     }
     */

}

