//
//  ImageCell.swift
//  Akratiindia
//
//  Created by Pulkit Rohilla on 5/14/17.
//  Copyright © 2017 Pulkit Rohilla. All rights reserved.
//

import UIKit

class ImageCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setupCell(){
        imgView.image = UIImage.init(named: "tempImage")
    }
}
