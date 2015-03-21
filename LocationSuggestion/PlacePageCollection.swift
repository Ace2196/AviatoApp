//
//  PlacePageCollection.swift
//  LocationSuggestion
//
//  Created by Abdulla Contractor on 21/3/15.
//  Copyright (c) 2015 Abdulla Contractor. All rights reserved.
//

import Foundation
import UIKit

class PlacePageCollection: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    @IBOutlet weak var placesCollection: UICollectionView!
    var pageIndex : Int = 0
    
    let placesVisited = ["",
        "Nairobi",
        "Mumbai",
        "Iran",
        "Egypt",
        "California",
        "Singapore"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        placesCollection.dataSource = self
        placesCollection.delegate = self
        placesCollection.backgroundColor = UIColor.clearColor()
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 7
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        var cell = placesCollection.dequeueReusableCellWithReuseIdentifier("placeCollectionCell", forIndexPath: indexPath) as PlaceCollectionCell
        cell.addShadows()
        cell.activityLabel.text = placesVisited[indexPath.row]
        cell.activityImageView.image = UIImage(named: "place_\(indexPath.row)")
        return cell
    }
}