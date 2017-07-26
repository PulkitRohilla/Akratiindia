//
//  ProductClass.swift
//  Akratiindia
//
//  Created by Pulkit Rohilla on 30/06/17.
//  Copyright © 2017 Pulkit Rohilla. All rights reserved.
//

import UIKit

class ProductClass: NSObject {

    var productName : String!
    var productCategory : String!
    
    init(withProductName name : String,andCategory category : String) {
        
        super.init()

        productName = name
        productCategory = category
        
    }
}
