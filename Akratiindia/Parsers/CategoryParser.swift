//
//  CategoryParser.swift
//  Akratiindia
//
//  Created by Pulkit Rohilla on 30/06/17.
//  Copyright © 2017 Pulkit Rohilla. All rights reserved.
//

import UIKit

class CategoryParser: NSObject {

    class func returnParsedCategories() -> NSMutableArray{
        
        var mArrayCategories : NSMutableArray!
        
        if let path = Bundle.main.path(forResource: "CategoryListing", ofType: "json")
        {
            if let jsonData = NSData(contentsOfFile: path)
            {
                do{
                    if let jsonResult: NSDictionary = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                    {
                        let arrayCategories = jsonResult["Categories"] as! [[String:Any]]
                        
                        for category in arrayCategories {
                            
                            let categoryName = category["Category"] as! String
                            let subCategories = category["SubCategories"] as! [[String:Any]]
                            
                            var mArraySubCategories : NSMutableArray!
                            
                            for subCategory in subCategories {
                                
                                let subCategoryName = subCategory["name"] as! String
                                
                                let subCategory : SubCategoryClass = SubCategoryClass.init(withSubCategoryName: subCategoryName, andSubCategoryCategory: categoryName)
                                
                                if (mArraySubCategories == nil) {
                                    
                                    mArraySubCategories = NSMutableArray()
                                }

                                mArraySubCategories.add(subCategory)
                            }
                            
                            let categoryObj : CategoryClass = CategoryClass.init(withCategoryName: categoryName, andSubCategorieds: mArraySubCategories)

                            if (mArrayCategories == nil) {
                                
                                mArrayCategories = NSMutableArray()
                            }
                            
                            mArrayCategories.add(categoryObj)
                        }
                        
                    }
                }
                catch {
                    
                    print(error)
                }
            }
        }
        
        return mArrayCategories
    }
}
