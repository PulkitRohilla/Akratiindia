//
//  NavigationDrawerController.swift
//  Akratiindia
//
//  Created by Pulkit Rohilla on 26/05/17.
//  Copyright © 2017 Pulkit Rohilla. All rights reserved.
//

import UIKit

class NavigationDrawerController: UIViewController {
    
    let slideAnimationDuration = -5.0
    let cornerRadius : CGFloat = 5.0
    let shadowCorrection : CGFloat = 2.0
    
    var frontViewController : UIViewController
    var menuController : UIViewController
    var isDrawerOpen : Bool = false
    
    let transparentView : UIView
    var leadingConstraint : NSLayoutConstraint!
    
    init(frontViewController : UIViewController, menuController : UIViewController) {
        
        self.frontViewController = frontViewController
        self.menuController = menuController
        self.transparentView = UIView.init(frame: frontViewController.view.frame)
        
        super.init(nibName: nil, bundle: nil)
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
    
    func initView(){
        
        self.addChildViewController(frontViewController)
        self.addChildViewController(menuController)
        
        self.view.addSubview(frontViewController.view)
        self.view.addSubview(menuController.view)
        self.view.sendSubview(toBack: menuController.view)
        
        menuController.view.layer.cornerRadius = cornerRadius
        
        menuController.view.translatesAutoresizingMaskIntoConstraints = false
        menuController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
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
        
        //        UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(move:)];
        //        [panRecognizer setMinimumNumberOfTouches:1];
        //        [panRecognizer setMaximumNumberOfTouches:1];
        //        [ViewMain addGestureRecognizer:panRecognizer];
        
        //        let panRecognizer = UIPanGestureRecognizer.init(target: self, action: #selector(dragDrawer(gestureRecognizer:)))
        //        panRecognizer.maximumNumberOfTouches = 1;
        //        panRecognizer.minimumNumberOfTouches = 1;
        //
        //        menuController.view.addGestureRecognizer(panRecognizer)
    }
    
    func dragDrawer(gestureRecognizer : UIPanGestureRecognizer){
        
        var translatedPoint : CGPoint = gestureRecognizer.translation(in: gestureRecognizer.view?.superview)
        var firstX : CGFloat = 0.0
        
        if gestureRecognizer.state == .began {
            
            firstX = (gestureRecognizer.view?.center.x)!
        }
        
        translatedPoint = CGPoint(x: (gestureRecognizer.view?.center.x)! + translatedPoint.x, y: (gestureRecognizer.view?.center.y)!)
        
        gestureRecognizer.view?.center = translatedPoint
        gestureRecognizer.setTranslation(.zero, in: gestureRecognizer.view)
        
        if gestureRecognizer.state == .ended {
            
            let velocityX = (0.2*gestureRecognizer.velocity(in: self.view).x)
            
            var finalX = translatedPoint.x + velocityX
            
            if finalX < 0 {
                
                finalX = 0
            }
            else if finalX > returnDrawerWidth()
            {
                finalX = returnDrawerWidth()
            }
            
            if finalX > firstX {
                
                openDrawer()
            }
            else
            {
                closeDrawer()
            }
        }
    }
    
    func returnDrawerWidth() -> CGFloat{
        
        let screenSize = UIScreen.main.bounds
        let drawerWidth = screenSize.width*2/3
        
        return drawerWidth
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
