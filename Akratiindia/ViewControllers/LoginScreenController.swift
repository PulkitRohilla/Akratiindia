//
//  LoginScreenController.swift
//  Akratiindia
//
//  Created by Pulkit Rohilla on 26/05/17.
//  Copyright © 2017 Pulkit Rohilla. All rights reserved.
//

import UIKit

class LoginScreenController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func actionLogin(_ sender: UIButton) {
    
        performSegue(withIdentifier: SegueIdentifier().SILogin, sender: self)
    }

}
