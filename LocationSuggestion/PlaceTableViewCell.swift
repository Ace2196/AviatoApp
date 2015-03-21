//
//  PlaceTableViewCell.swift
//  LocationSuggestion
//
//  Created by Abdulla Contractor on 21/3/15.
//  Copyright (c) 2015 Abdulla Contractor. All rights reserved.
//

import Foundation
import UIKit

class PlaceTableViewCell : UITableViewCell{
    @IBOutlet weak var cardBackImageView: UIImageView!
    @IBOutlet weak var activityImageView: UIImageView!
    @IBOutlet weak var activityLabel: UILabel!
    
    func addShadows(){
        cardBackImageView.layer.shadowColor = UIColor.blackColor().CGColor
        cardBackImageView.layer.shadowOffset = CGSizeMake(2, 2);
        cardBackImageView.layer.shadowOpacity = 0.4;
        cardBackImageView.layer.shadowRadius = 1.0;
        cardBackImageView.clipsToBounds = false;
    }
}