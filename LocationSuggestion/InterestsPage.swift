//
//  InterestsPage.swift
//  LocationSuggestion
//
//  Created by Abdulla Contractor on 21/3/15.
//  Copyright (c) 2015 Abdulla Contractor. All rights reserved.
//

import Foundation
import UIKit

class InterestsPage : UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var interestsTable: UITableView!
    var pageIndex : Int = 0
    
    let interests = ["Football",
        "Music",
        "Beer",
        "Seafood",
        "Adventure Sports",
        "Coffee"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interestsTable.dataSource = self
        interestsTable.delegate = self
        
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("interestCell", forIndexPath: indexPath) as InterestTableViewCell
        cell.addShadows()
        cell.activityLabel.text = interests[indexPath.row]
        cell.activityImageView.image = UIImage(named: "activities_\(indexPath.row)")
        return cell
    }
    
}