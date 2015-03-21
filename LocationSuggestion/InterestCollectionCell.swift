//
//  InterestCollectionCell.swift
//  LocationSuggestion
//
//  Created by Abdulla Contractor on 21/3/15.
//  Copyright (c) 2015 Abdulla Contractor. All rights reserved.
//

import Foundation
import UIKit

class InterestCollectionCell : UICollectionViewCell{
    @IBOutlet weak var activityImageView: UIImageView!
    @IBOutlet weak var activityLabel: UILabel!
    
    func addShadows(){
        activityImageView.layer.shadowColor = UIColor.blackColor().CGColor
        activityImageView.layer.shadowOffset = CGSizeMake(2, 2);
        activityImageView.layer.shadowOpacity = 0.4;
        activityImageView.layer.shadowRadius = 1.0;
        activityImageView.clipsToBounds = false;
        
        activityLabel.layer.shadowColor = UIColor.blackColor().CGColor
        activityLabel.layer.shadowOffset = CGSizeMake(0, 0);
        activityLabel.layer.shadowOpacity = 1.0;
        activityLabel.layer.shadowRadius = 3.0;
        activityLabel.clipsToBounds = false;
    }
}