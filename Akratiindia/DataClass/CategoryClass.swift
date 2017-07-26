//
//  CategoryClass.swift
//  Akratiindia
//
//  Created by Pulkit Rohilla on 30/06/17.
//  Copyright © 2017 Pulkit Rohilla. All rights reserved.
//

import UIKit

class CategoryClass: NSObject {

    var categoryName : String!
    var arrayProducts : NSArray!
    
    init(withCategoryName name : String,andProducts products : NSArray) {
        
        super.init()
        
        categoryName = name
        arrayProducts = products
        
    }
}
