//
//  CategorySectionHeader.swift
//  Akratiindia
//
//  Created by Pulkit Rohilla on 5/28/17.
//  Copyright © 2017 Pulkit Rohilla. All rights reserved.
//

import UIKit

class CategorySectionHeader: UIView {

    let defaultViewSpacing = 15.0
    
    init(sectionHeaderForCategory title: String) {
        
        super.init(frame: .zero)
        self.backgroundColor = UIColor.white
        
        let lableTitle = UILabel.init()
        let buttonToggle = UIButton.init(type: .custom)
        
        lableTitle.text = title
    
        buttonToggle.setTitle(FontAwesomeIcons().iconDownArrow, for: UIControlState.normal)
        buttonToggle.setTitleColor(UIColor.lightGray, for: UIControlState.normal)
        buttonToggle.titleLabel?.font = UIFont(name: "fontawesome", size: 20.0)
        
        self.addSubview(lableTitle)
        self.addSubview(buttonToggle)
        
        lableTitle.translatesAutoresizingMaskIntoConstraints = false
        buttonToggle.translatesAutoresizingMaskIntoConstraints = false
        
        let subviewsDict = ["lableTitle" : lableTitle,
                            "buttonToggle" : buttonToggle]
        let metricsDict = ["defaultViewSpacing" : defaultViewSpacing]
        
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-(defaultViewSpacing)-[lableTitle]-[buttonToggle]-(defaultViewSpacing)-|", options: NSLayoutFormatOptions.alignAllCenterY, metrics: metricsDict, views: subviewsDict)
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[lableTitle]-0-|", options: NSLayoutFormatOptions.alignAllCenterY, metrics: nil, views: subviewsDict)

        self.addConstraints(horizontalConstraints)
        self.addConstraints(verticalConstraints)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
