//
//  DrawerMenuController.swift
//  Akratiindia
//
//  Created by Pulkit Rohilla on 26/05/17.
//  Copyright © 2017 Pulkit Rohilla. All rights reserved.
//

import UIKit

protocol DrawerMenuDelegate {
    
    func didSelectMenuOptionAtIndex(indexPath: IndexPath)
}

class DrawerMenuController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    var delegate : DrawerMenuDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "accountCellIdentifier", for: indexPath)
            
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "optionCellIdentifier", for: indexPath)
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            
            return 200
        }
        else
        {
            return 50
        }        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        delegate.didSelectMenuOptionAtIndex(indexPath: indexPath)
    }
    
}
