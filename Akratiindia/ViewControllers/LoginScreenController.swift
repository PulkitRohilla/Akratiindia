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
        
        navigateToHomeScreen()
    }

    func navigateToHomeScreen(){
        
        let menuController  = self.storyboard?.instantiateViewController(withIdentifier: StoryboardID().DrawerMenuController)
        let homeController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardID().HomeScreenController)
        let homeNavController : UINavigationController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardID().CommonNavController) as! UINavigationController
        homeNavController.viewControllers = [homeController!]
        
        let navDrawerController = NavigationDrawerController.init(frontViewController: homeNavController, menuController: menuController!)
        
        self.present(navDrawerController, animated: true, completion: nil)
    }
}
