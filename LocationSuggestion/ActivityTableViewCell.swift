//
//  ActivityTableViewCell.swift
//  LocationSuggestion
//
//  Created by Abdulla Contractor on 15/3/15.
//  Copyright (c) 2015 Abdulla Contractor. All rights reserved.
//

import Foundation
import UIKit

class ActivityTableViewCell : UITableViewCell {
    
    @IBOutlet weak var cardBackImageView: UIImageView!
    @IBOutlet weak var activityImageView: UIImageView!
    @IBOutlet weak var activityLabel: UILabel!
    @IBOutlet weak var souceLabel: UILabel!
    
    func addShadows(){
        cardBackImageView.layer.shadowColor = UIColor.blackColor().CGColor
        cardBackImageView.layer.shadowOffset = CGSizeMake(2, 2);
        cardBackImageView.layer.shadowOpacity = 0.4;
        cardBackImageView.layer.shadowRadius = 1.0;
        cardBackImageView.clipsToBounds = false;
    }
}
