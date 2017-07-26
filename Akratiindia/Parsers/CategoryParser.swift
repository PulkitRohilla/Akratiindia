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
                            let products = category["Products"] as! [[String:Any]]
                            
                            var mArrayProducts : NSMutableArray!
                            
                            for product in products {
                                
                                let productName = product["name"] as! String
                                
                                let product : ProductClass = ProductClass.init(withProductName: productName, andCategory: categoryName)
                                
                                if (mArrayProducts == nil) {
                                    
                                    mArrayProducts = NSMutableArray()
                                }

                                mArrayProducts.add(product)
                            }
                            
                            let categoryObj : CategoryClass = CategoryClass.init(withCategoryName: categoryName, andProducts: mArrayProducts)

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
