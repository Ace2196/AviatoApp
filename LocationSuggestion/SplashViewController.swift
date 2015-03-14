//
//  SplashViewController.swift
//  LocationSuggestion
//
//  Created by Abdulla Contractor on 14/3/15.
//  Copyright (c) 2015 Abdulla Contractor. All rights reserved.
//

import Foundation
import UIKit

class SplashViewController: UIViewController{
    
    private var splashFrames = [UIImage]()
    
    @IBOutlet weak var splashImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for(var i = 0 ; i <= 9 ; i++ ){
            splashFrames.append(UIImage(named: "loading_0000\(i)")!)
        }
        for(var i = 10 ; i <= 89 ; i++ ){
            splashFrames.append(UIImage(named: "loading_000\(i)")!)
        }
        
        setNeedsStatusBarAppearanceUpdate()
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        splashImage.animationImages = splashFrames
        splashImage.animationDuration = 5
        splashImage.animationRepeatCount = 1
        splashImage.startAnimating()
        
        var timer = NSTimer()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(5, target:self, selector: Selector("endAnimation"), userInfo: nil, repeats: false)
    }
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.BlackOpaque
    }
    
    func endAnimation(){
        var mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        var viewController : UITabBarController = mainStoryBoard.instantiateViewControllerWithIdentifier("TabController") as UITabBarController
        self.presentViewController(viewController, animated: true, completion: nil)
    }
}
