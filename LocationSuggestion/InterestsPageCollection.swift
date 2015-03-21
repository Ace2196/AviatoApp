//
//  InterestsPageCollection.swift
//  LocationSuggestion
//
//  Created by Abdulla Contractor on 21/3/15.
//  Copyright (c) 2015 Abdulla Contractor. All rights reserved.
//

import Foundation
import UIKit

class InterestsPageCollection: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    @IBOutlet weak var interestsCollection: UICollectionView!
    var pageIndex : Int = 0
    
    let interests = ["",
        "Football",
        "Music",
        "Beer",
        "Seafood",
        "Adventure Sports",
        "Coffee"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interestsCollection.dataSource = self
        interestsCollection.delegate = self
        interestsCollection.backgroundColor = UIColor.clearColor()
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
        var cell = interestsCollection.dequeueReusableCellWithReuseIdentifier("InterestCollectionCell", forIndexPath: indexPath) as InterestCollectionCell
        cell.addShadows()
        cell.activityLabel.text = interests[indexPath.row]
        cell.activityImageView.image = UIImage(named: "interest_\(indexPath.row)")
        return cell
    }
}