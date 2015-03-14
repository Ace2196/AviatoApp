//
//  GlowingUILabel.swift
//  LocationSuggestion
//
//  Created by Abdulla Contractor on 14/3/15.
//  Copyright (c) 2015 Abdulla Contractor. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

class GlowingUILabel : UILabel{
    override func drawTextInRect(rect: CGRect) {
        var context : CGContextRef = UIGraphicsGetCurrentContext()
        CGContextSaveGState(context)
        
        CGContextSetShadowWithColor(context, CGSizeMake(0.0, 0.0), 20.0, UIColor.blackColor().CGColor)

        
        super.drawTextInRect(rect)
        
        //CGContextRestoreGState(context)
    }
}