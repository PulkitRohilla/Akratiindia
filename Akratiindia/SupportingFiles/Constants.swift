//
//  Constants.swift
//  Akratiindia
//
//  Created by Pulkit Rohilla on 5/14/17.
//  Copyright © 2017 Pulkit Rohilla. All rights reserved.
//

import Foundation

struct WebserviceURL{
    
    let LoginWebservice = "/api/Clients/login"
}

struct SegueIdentifier {
    
    let SILogin = "SILogin"
    let SIProducts = "SIProducts"
}

struct HomeScreenConstants {
    
    enum CellTypes : Int {
        case CellTypeImage = 1, CellTypeSeparator
    }
   
    let ImageCellIdentifier = "ImageCellIdentifier"
    let SeparatorCellIdentifier = "SeparatorCellIdentifier"
    
    let DisplayArray : [CellTypes] = [.CellTypeImage, .CellTypeSeparator, .CellTypeImage, .CellTypeImage, .CellTypeImage, .CellTypeImage]
}


struct CategoryScreenConstants{
    
    let CategoryCellIdentifier = "categoryCellIdentifier"
}

struct FontAwesomeIcons{
    
    let iconDownArrow = ""
}
