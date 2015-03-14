//
//  SuggestionScreenViewController.swift
//  LocationSuggestion
//
//  Created by Abdulla Contractor on 14/3/15.
//  Copyright (c) 2015 Abdulla Contractor. All rights reserved.
//

import Foundation
import UIKit

class SuggestionScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var suggestionTable: UITableView!
    private var cities = ["SINGAPORE", "DUBAI", "LONDON", "THAILAND"]
    private var selectedCityRow = -1
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        suggestionTable.delegate = self
        suggestionTable.dataSource = self
        
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if(indexPath.row != selectedCityRow){
            return 166;
        } else{
            return 498;
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if(indexPath.row != selectedCityRow){
            var cell = tableView.dequeueReusableCellWithIdentifier("cityCell", forIndexPath: indexPath) as CitySmallTableViewCell
            cell.cityNameLabel.text = cities[indexPath.row]
            cell.addShadows()
            cell.cityImageView.image = UIImage(named: cities[indexPath.row])
            return cell
        } else{
            var cell = tableView.dequeueReusableCellWithIdentifier("expandedCityCell", forIndexPath: indexPath) as CityLargeTableViewCell
            cell.cityNameLabel.text = cities[indexPath.row]
            cell.addShadows()
            cell.cityImageView.image = UIImage(named: cities[indexPath.row])
            return cell
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if(indexPath.row == selectedCityRow){
            selectedCityRow = -1
        } else{
            selectedCityRow = indexPath.row
        }
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, willDeselectRowAtIndexPath indexPath: NSIndexPath) {
        selectedCityRow = -1
        tableView.reloadData()
    }
    
    /*func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var cell = tableView.cellForRowAtIndexPath(indexPath) as UITableViewCell?
        
        let dirs = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true) as? [String]
        var cnt = dirs!.count
        if(cnt > 0){
            let dir = dirs![0]; //documents directory
            let path = dir.stringByAppendingPathComponent("\(fileList[indexPath.row])\(saveFileSuffix)");
            var read = String(contentsOfFile: path, encoding: NSUTF8StringEncoding, error: nil)
            var arrayRep = read?.componentsSeparatedByString(", ")
            parent.updateWithDataFromArray(arrayRep!)
            dismissViewControllerAnimated(true, completion: nil)
        }
        
        
    }*/
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    
    
}
