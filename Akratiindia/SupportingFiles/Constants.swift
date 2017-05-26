//
//  Constants.swift
//  Akratiindia
//
//  Created by Pulkit Rohilla on 5/14/17.
//  Copyright © 2017 Pulkit Rohilla. All rights reserved.
//

import Foundation

struct StoryboardID {
    
    let CommonNavController = "CommonNavController"
    let HomeScreenController = "HomeScreen"
    let DrawerMenuController = "DrawerMenu"
}

struct HomeScreenConstants {
    
    enum CellTypes : Int {
        case CellTypeImage = 1, CellTypeSeparator
    }
   
    let ImageCellIdentifier = "ImageCellIdentifier"
    let SeparatorCellIdentifier = "SeparatorCellIdentifier"
    
    let DisplayArray : [CellTypes] = [.CellTypeImage, .CellTypeSeparator, .CellTypeImage, .CellTypeImage, .CellTypeImage, .CellTypeImage]
}


