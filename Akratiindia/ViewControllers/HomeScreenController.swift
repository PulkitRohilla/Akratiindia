//
//  HomeScreenController.swift
//  Akratiindia
//
//  Created by Pulkit Rohilla on 5/11/17.
//  Copyright © 2017 Pulkit Rohilla. All rights reserved.
//

import UIKit

class HomeScreenController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        initScreen()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return HomeScreenConstants().DisplayArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellType : HomeScreenConstants.CellTypes = HomeScreenConstants().DisplayArray[indexPath.row]
        
    
        if cellType == HomeScreenConstants.CellTypes.CellTypeSeparator {
            
            let cell : SeparatorCell = tableView.dequeueReusableCell(withIdentifier: HomeScreenConstants().SeparatorCellIdentifier, for: indexPath) as! SeparatorCell
            cell.setupCell(prompt: "Collections")
            return cell
        }
        else if cellType == HomeScreenConstants.CellTypes.CellTypeImage{
            
            let cell : ImageCell = tableView.dequeueReusableCell(withIdentifier: HomeScreenConstants().ImageCellIdentifier, for: indexPath) as! ImageCell
            cell.setupCell()
            return cell
        }
        
        let cell : UITableViewCell = UITableViewCell.init()
        return cell
    }

    //OtherMethods
    func initScreen(){
        
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }

}
