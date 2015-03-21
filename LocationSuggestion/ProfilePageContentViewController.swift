//
//  ProfilePageContentViewController.swift
//  LocationSuggestion
//
//  Created by Abdulla Contractor on 21/3/15.
//  Copyright (c) 2015 Abdulla Contractor. All rights reserved.
//

import Foundation
import UIKit

class ProfilePageContentViewController : UIViewController, UIPageViewControllerDataSource {
    var pageViewController : UIPageViewController?
    //var pageTitles : Array<String> = ["THAILAND", "BARCELONA"]
    //var pageImages : Array<String> = ["THAILAND.png", "BARCELONA.png"]
    var currentIndex : Int = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        pageViewController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
        pageViewController!.dataSource = self
        
        let startingViewController: UIViewController = viewControllerAtIndex(0)!
        let viewControllers: NSArray = [startingViewController]
        pageViewController!.setViewControllers(viewControllers, direction: .Forward, animated: false, completion: nil)
        pageViewController!.view.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height + 50);
        
        addChildViewController(pageViewController!)
        view.addSubview(pageViewController!.view)
        pageViewController!.didMoveToParentViewController(self)
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?
    {
        
        var index = 0
        
        if(viewController is InterestsPage){
            index = 0
        } else if(viewController is PreviousPlaces){
            index = 1
        } else{
            return nil
        }
        
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index--
        
        return viewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController?
    {
        var index = 0
        
        if(viewController is InterestsPage){
            index = 0
        } else if(viewController is PreviousPlaces){
            index = 1
        } else{
            return nil
        }
        
        index++
        
        if (index == 2) {
            return nil
        }
        
        return viewControllerAtIndex(index)
    }
    
    func viewControllerAtIndex(index: Int) -> UIViewController?
    {
        if index > 1
        {
            return nil
        }
        
        currentIndex = index
        if(index == 0){
            var mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
            var viewController : InterestsPage = mainStoryBoard.instantiateViewControllerWithIdentifier("InterestsPage") as InterestsPage
            viewController.pageIndex = index
            return viewController
        } else{
            var mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
            var viewController : PreviousPlaces = mainStoryBoard.instantiateViewControllerWithIdentifier("PreviousPlaces") as PreviousPlaces
            viewController.pageIndex = index
            return viewController
        }
        
        // Create a new view controller and pass suitable data.
        /*let pageContentViewController = InstructionView()
        pageContentViewController.imageFile = pageImages[index]
        pageContentViewController.titleText = pageTitles[index]
        pageContentViewController.pageIndex = index*/
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return 2
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return 0
    }

}