//
//  CitySmallTableViewCell.swift
//  LocationSuggestion
//
//  Created by Abdulla Contractor on 14/3/15.
//  Copyright (c) 2015 Abdulla Contractor. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore


class CitySmallTableViewCell: UITableViewCell{
    
    @IBOutlet weak var cityImageView: UIImageView!
    @IBOutlet weak var cityNameLabel: UILabel!
    
    func addShadows(){
        cityImageView.layer.shadowColor = UIColor.blackColor().CGColor
        cityImageView.layer.shadowOffset = CGSizeMake(2, 2);
        cityImageView.layer.shadowOpacity = 0.4;
        cityImageView.layer.shadowRadius = 1.0;
        cityImageView.clipsToBounds = false;
        
        cityNameLabel.layer.shadowColor = UIColor.blackColor().CGColor
        cityNameLabel.layer.shadowOffset = CGSizeMake(0, 0);
        cityNameLabel.layer.shadowOpacity = 1.0;
        cityNameLabel.layer.shadowRadius = 10.0;
        cityNameLabel.clipsToBounds = false;
    }
}