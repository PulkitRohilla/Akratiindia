//
//  NavigationDrawerController.swift
//  Akratiindia
//
//  Created by Pulkit Rohilla on 26/05/17.
//  Copyright © 2017 Pulkit Rohilla. All rights reserved.
//

import UIKit

class NavigationDrawerController: UIViewController, DrawerMenuDelegate {
    
    let slideAnimationDuration = -5.0
    let cornerRadius : CGFloat = 5.0
    
    var frontViewController : UIViewController
    var menuController : DrawerMenuController
    var isDrawerOpen : Bool = false
    
    let transparentView : UIView
    var leadingConstraint : NSLayoutConstraint!
    
    init(frontViewController : UIViewController, menuController : UIViewController) {
        
        self.frontViewController = frontViewController
        self.menuController = menuController as! DrawerMenuController
        self.transparentView = UIView.init(frame: frontViewController.view.frame)
        
        super.init(nibName: nil, bundle: nil)
        
        self.menuController.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if (isDrawerOpen) {
            
            closeDrawer()
            
            return
        }
        
        return
    }
    
    //Mark: - DrawerMenuDelegateMethods
    
    func didSelectMenuOptionAtIndex(indexPath: IndexPath) {

        closeDrawer()
        
        switch indexPath.row {
        case 3:
            dismiss(animated: true, completion: nil)
            break
        default:
            break
        }
    }
    
    //Mark: - OtherMethods
    
    func initView(){
        
        self.addChildViewController(frontViewController)
        self.addChildViewController(menuController)
        
        self.view.addSubview(frontViewController.view)
        self.view.addSubview(menuController.view)
        self.view.sendSubview(toBack: menuController.view)
        
        menuController.view.layer.cornerRadius = cornerRadius
        
        menuController.view.translatesAutoresizingMaskIntoConstraints = false
        menuController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        self.addInitialConstraints()
        self.addGestureRecognizers()
        
    }
    
    func returnDrawerWidth() -> CGFloat{
        
        let screenSize = UIScreen.main.bounds
        let drawerWidth = screenSize.width*2/3
        
        return drawerWidth
    }
    
    func addInitialConstraints(){
        
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[view]-0-|",
                                                                 options: .alignAllLeading,
                                                                 metrics: nil,
                                                                 views: ["view" : menuController.view])
        
        self.view.addConstraints(verticalConstraints)
        
        
        let widthConstraint = NSLayoutConstraint(
            item: menuController.view,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1.0,
            constant: returnDrawerWidth())
        
        menuController.view.addConstraint(widthConstraint)
        
        self.leadingConstraint = NSLayoutConstraint(
            item: menuController.view,
            attribute: .leading,
            relatedBy: .equal,
            toItem: self.view,
            attribute: .leading,
            multiplier: 1,
            constant: -returnDrawerWidth())
        
        self.view.addConstraint(leadingConstraint)
    }
    
    func addGestureRecognizers(){
        
        let leftSwipeGesture = UISwipeGestureRecognizer.init(target: self, action: #selector(closeDrawer))
        leftSwipeGesture.direction = .left
        leftSwipeGesture.numberOfTouchesRequired = 1
        
        menuController.view.addGestureRecognizer(leftSwipeGesture)
        
        let rightSwipeScreenEdgeGesture = UIScreenEdgePanGestureRecognizer.init(target: self, action: #selector(screenEdgePan(sender:)))
        rightSwipeScreenEdgeGesture.edges = [.left]
        
        self.view.addGestureRecognizer(rightSwipeScreenEdgeGesture)
    }
    
    func screenEdgePan(sender: UIScreenEdgePanGestureRecognizer){
        
        if sender.state == .began {
            
            openDrawer()
        }
    }
    
    func toggleDrawer(){
        
        if !isDrawerOpen {
            
            openDrawer()
        }
        else if isDrawerOpen && menuController.view.frame.origin.x == 0
        {
            closeDrawer()
        }
    }
    
    func openDrawer(){
        
        self.view.bringSubview(toFront: self.menuController.view)
        self.leadingConstraint.constant = 0;
        
        UIView.animate(withDuration: slideAnimationDuration, delay: 0, options: .curveEaseInOut, animations: {
            
            self.view.layoutIfNeeded()
            self.frontViewController.view.addSubview(self.transparentView)
            
        }, completion: { (Bool) in
            
            self.isDrawerOpen = true
        })
    }
    
    func closeDrawer(){
        
        self.leadingConstraint.constant = -returnDrawerWidth()
        
        UIView.animate(withDuration: slideAnimationDuration, delay: 0, options: .curveEaseInOut, animations: {
            
            self.view.layoutIfNeeded()
            self.transparentView.removeFromSuperview()
            
        }, completion: { (Bool) in
            
            self.isDrawerOpen = false
            self.view.sendSubview(toBack: self.menuController.view)

        })
    }
}

extension UIViewController{
    
    func navigationDrawerController() -> NavigationDrawerController{
        
        var parentViewController : UIViewController = self.parent!
        
        if parentViewController.isKind(of: NavigationDrawerController.self) {
            
            return parentViewController as! NavigationDrawerController
        }
        else
        {
            while (parentViewController = parentViewController.parent!) != nil && !parentViewController .isKind(of: NavigationDrawerController.self) {
                
            }
            
            return parentViewController as! NavigationDrawerController
        }
    }
}
