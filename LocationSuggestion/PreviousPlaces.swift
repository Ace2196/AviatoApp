//
//  PreviousPlaces.swift
//  LocationSuggestion
//
//  Created by Abdulla Contractor on 21/3/15.
//  Copyright (c) 2015 Abdulla Contractor. All rights reserved.
//

import Foundation
import UIKit

class PreviousPlaces : UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var pageIndex : Int = 0
    
    @IBOutlet weak var placesTable: UITableView!
    
    let placesVisited = ["Nairobi",
                            "Mumbai",
                            "Iran",
                            "Egypt",
                            "California",
                            "Singapore"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        placesTable.delegate = self
        placesTable.dataSource = self
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
        var cell = tableView.dequeueReusableCellWithIdentifier("placeCell", forIndexPath: indexPath) as PlaceTableViewCell
        cell.addShadows()
        cell.activityLabel.text = placesVisited[indexPath.row]
        cell.activityImageView.image = UIImage(named: "place_\(indexPath.row)")
        return cell
    }
}