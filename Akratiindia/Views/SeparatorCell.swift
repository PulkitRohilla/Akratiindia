//
//  SeparatorCell.swift
//  Akratiindia
//
//  Created by Pulkit Rohilla on 5/14/17.
//  Copyright © 2017 Pulkit Rohilla. All rights reserved.
//

import UIKit

class SeparatorCell: UITableViewCell {

    @IBOutlet weak var lblPrompt: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setupCell( prompt: String){
        lblPrompt.text = prompt
    }
}
