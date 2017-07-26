//
//  SubCategoryClass.swift
//  Akratiindia
//
//  Created by Pulkit Rohilla on 30/06/17.
//  Copyright © 2017 Pulkit Rohilla. All rights reserved.
//

import UIKit

class SubCategoryClass: NSObject {

    var subCategoryName : String!
    var subCategoryCategory : String!
    
    init(withSubCategoryName name : String,andSubCategoryCategory category : String) {
        
        super.init()

        subCategoryName = name
        subCategoryCategory = category
        
    }
}
