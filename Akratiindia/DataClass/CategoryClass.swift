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
    var arraySubCategories : NSArray!
    
    init(withCategoryName name : String,andSubCategorieds subCategories : NSArray) {
        
        super.init()
        
        categoryName = name
        arraySubCategories = subCategories
        
    }
}
