//
//  ActivitiesViewController.swift
//  LocationSuggestion
//
//  Created by Abdulla Contractor on 15/3/15.
//  Copyright (c) 2015 Abdulla Contractor. All rights reserved.
//

import Foundation
import UIKit

class ActivitiesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var activityTable: UITableView!
    
    var activities = ["Watch a game at Camp Nou",
                        "Barcelona Beer Festival (15th March)",
                        "Watch The Script perform (30th March)",
                        "Lunch at Cal Boter",
                        "Tour La Rambla",
                        "Climb Montjuïic Mountain",
                        "Visit The Raval",
                        "Chow down fresh seafood",
                        "Hit the beaches"]
    
    var sources = ["(Source: Active Network)",
        "(Source: FourSquare)",
        "(Source: JamBase)",
        "(Source: Facebook)",
        "(Source: TripAdvisor)",
        "(Source: Active Network)",
        "(Source: TripAdvisor)",
        "(Source: FourSquare)",
        "(Source: TripAdvisor)"]
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityTable.delegate = self
        activityTable.dataSource = self
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
    }
    @IBAction func backButtonPress(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("activityCell", forIndexPath: indexPath) as ActivityTableViewCell
        cell.addShadows()
        cell.activityLabel.text = activities[indexPath.row]
        cell.souceLabel.text = sources[indexPath.row]
        cell.activityImageView.image = UIImage(named: "activities_\(indexPath.row)")
        return cell
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}