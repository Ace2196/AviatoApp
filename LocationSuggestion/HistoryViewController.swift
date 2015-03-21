//
//  HistoryViewController.swift
//  LocationSuggestion
//
//  Created by Abdulla Contractor on 14/3/15.
//  Copyright (c) 2015 Abdulla Contractor. All rights reserved.
//


import Foundation
import UIKit

class HistoryViewController : UIViewController{
    @IBOutlet weak var profilePhotoImageView: UIImageView!
    @IBOutlet weak var interestLabel: UILabel!
    @IBOutlet weak var travelLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setNeedsStatusBarAppearanceUpdate()
        profilePhotoImageView.layer.shadowColor = UIColor.blackColor().CGColor
        profilePhotoImageView.layer.shadowOffset = CGSizeMake(1, 2);
        profilePhotoImageView.layer.shadowOpacity = 0.4;
        profilePhotoImageView.layer.shadowRadius = 1.0;
        profilePhotoImageView.clipsToBounds = false;
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.BlackOpaque
    }
}