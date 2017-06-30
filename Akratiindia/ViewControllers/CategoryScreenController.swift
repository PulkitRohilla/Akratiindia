//
//  CategoryScreenController.swift
//  Akratiindia
//
//  Created by Pulkit Rohilla on 5/28/17.
//  Copyright © 2017 Pulkit Rohilla. All rights reserved.
//

import UIKit

class CategoryScreenController: UITableViewController, CategorySectionHeaderDelegate {

    var arrayCategories : NSArray!
    var selectedIndex : Int = -1
    var prevSelectedIndex : Int = -1

    override func viewDidLoad() {
        super.viewDidLoad()

        initObjects()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return (arrayCategories != nil) ? arrayCategories.count : 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if selectedIndex > -1 && selectedIndex < arrayCategories.count && section == selectedIndex{
            
            let category = arrayCategories.object(at: section) as! CategoryClass
            return category.arrayProducts.count
        }
        
        return 0
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 44.0
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let category = arrayCategories.object(at: section) as? CategoryClass
        let title = category?.categoryName
        let headerView = CategorySectionHeader.init(headerForSection: section, withTitle: title!, andDelegate: self as CategorySectionHeaderDelegate)
        
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryScreenConstants().CategoryCellIdentifier, for: indexPath)

        // Configure the cell...
        let category = arrayCategories.object(at: indexPath.section) as? CategoryClass
        let product = category?.arrayProducts.object(at: indexPath.row) as? ProductClass

        cell.textLabel?.text = product?.productName
        
        return cell
    }
    
    // MARK: - CategorySectionHeaderDelegate
    
    func didSelectHeaderForSection(section: Int) {
        
        if selectedIndex != section {
            
            selectedIndex = section
        }
        else
        {
            selectedIndex = -1
        }
        
        var sectionIndexes = IndexSet.init(integer: section)

        if prevSelectedIndex != -1 {
            
            sectionIndexes.insert(prevSelectedIndex)
        }
    
        tableView.reloadSections(sectionIndexes, with: UITableViewRowAnimation.automatic)

        prevSelectedIndex = selectedIndex

    }
    
    // MARK: - OtherMethods
    func initObjects(){
        
        retrieveCategoryListing()
    }
    
    func retrieveCategoryListing(){
        
        arrayCategories = CategoryParser.returnParsedCategories()
    }

}
