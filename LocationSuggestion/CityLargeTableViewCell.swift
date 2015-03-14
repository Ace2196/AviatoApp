//
//  CityLargeTableViewCell.swift
//  LocationSuggestion
//
//  Created by Abdulla Contractor on 14/3/15.
//  Copyright (c) 2015 Abdulla Contractor. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore


class CityLargeTableViewCell: UITableViewCell{
    
    @IBOutlet weak var cityImageView: UIImageView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var cardBackImageView: UIImageView!
    @IBOutlet weak var borderShadowImageView: UIImageView!
    
    func addShadows(){
        borderShadowImageView.layer.shadowColor = UIColor.blackColor().CGColor
        borderShadowImageView.layer.shadowOffset = CGSizeMake(2, 2);
        borderShadowImageView.layer.shadowOpacity = 0.4;
        borderShadowImageView.layer.shadowRadius = 1.0;
        borderShadowImageView.clipsToBounds = false;
        
        cityNameLabel.layer.shadowColor = UIColor.blackColor().CGColor
        cityNameLabel.layer.shadowOffset = CGSizeMake(0, 0);
        cityNameLabel.layer.shadowOpacity = 1.0;
        cityNameLabel.layer.shadowRadius = 10.0;
        cityNameLabel.clipsToBounds = false;
    }
}