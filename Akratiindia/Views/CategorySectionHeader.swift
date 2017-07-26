//
//  CategorySectionHeader.swift
//  Akratiindia
//
//  Created by Pulkit Rohilla on 5/28/17.
//  Copyright © 2017 Pulkit Rohilla. All rights reserved.
//

import UIKit

protocol CategorySectionHeaderDelegate {
    
    func didSelectHeaderForSection(section : Int)
}

class CategorySectionHeader: UIView {

    let defaultViewSpacing = 15.0
    let borderHeight = 0.5

    var section = -1
    
    // MARK:- Delegate
    var sectionDelegate: CategorySectionHeaderDelegate?
    
    init(headerForSection index: Int,withTitle title: String, andDelegate delegate: CategorySectionHeaderDelegate) {
        
        super.init(frame: .zero)
        
        section = index;
        sectionDelegate = delegate;
        
        self.backgroundColor = UIColor.white
        
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(didTapHeader))

        let labelTitle = UILabel.init()
        let labelIcon = UILabel.init()
        let bottomBorder = UIView.init()

        labelTitle.text = title
        labelTitle.font = UIFont.systemFont(ofSize: 20.0, weight: 0.2)
        
        labelIcon.text = FontAwesomeIcons().iconDownArrow
        labelIcon.font = UIFont(name: "fontawesome", size: 20.0)
        labelIcon.textColor = UIColor.gray
        
        bottomBorder.backgroundColor = UIColor.lightGray
        
        self.addSubview(labelTitle)
        self.addSubview(labelIcon)
        self.addSubview(bottomBorder)

        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelIcon.translatesAutoresizingMaskIntoConstraints = false
        bottomBorder.translatesAutoresizingMaskIntoConstraints = false

        let subviewsDict = ["lableTitle" : labelTitle,
                            "labelIcon" : labelIcon,
                            "bottomBorder" : bottomBorder]
        
        let metricsDict = ["defaultViewSpacing" : defaultViewSpacing,
                           "borderHeight": borderHeight]
        
        let centreTitleConstraint = NSLayoutConstraint.init(item: self,
                                                            attribute: .centerY,
                                                            relatedBy: .equal,
                                                            toItem: labelTitle,
                                                            attribute: .centerY,
                                                            multiplier: 1.0,
                                                            constant: 0)
        
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-(defaultViewSpacing)-[lableTitle]-[labelIcon]-(defaultViewSpacing)-|",
                                                                   options: NSLayoutFormatOptions.alignAllCenterY,
                                                                   metrics: metricsDict,
                                                                   views: subviewsDict)
        
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[bottomBorder(borderHeight)]-0-|",
                                                                 options: NSLayoutFormatOptions.init(rawValue: 0),
                                                                 metrics: metricsDict,
                                                                 views: subviewsDict)
        
        let borderhorizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-(defaultViewSpacing)-[bottomBorder]-0-|",
                                                                         options: NSLayoutFormatOptions.init(rawValue: 0),
                                                                         metrics: metricsDict,
                                                                         views: subviewsDict)

        self.addConstraint(centreTitleConstraint)
        self.addConstraints(horizontalConstraints)
        self.addConstraints(verticalConstraints)
        self.addConstraints(borderhorizontalConstraints)
        
        self.addGestureRecognizer(tapGesture)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func didTapHeader(){
        
        sectionDelegate?.didSelectHeaderForSection(section: section)
    }
}
