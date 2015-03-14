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


class CityLargeTableViewCell: UITableViewCell, BEMSimpleLineGraphDataSource, BEMSimpleLineGraphDelegate{
    
    @IBOutlet weak var cityImageView: UIImageView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var cardBackImageView: UIImageView!
    @IBOutlet weak var borderShadowImageView: UIImageView!
    
    @IBOutlet weak var graphView: BEMSimpleLineGraphView!
    @IBOutlet weak var hotelNameLabel: UILabel!
    
    var data: [CGFloat]!
    
    func setUpCell(prices: [CGFloat], suggestedHotel: String){
        self.graphView.delegate = self
        self.graphView.dataSource = self
        self.graphView.enablePopUpReport = true
        self.graphView.enableBezierCurve = true
        hotelNameLabel.text = suggestedHotel
        addShadows()
        data = prices
        self.graphView.reloadGraph()
    }
    
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
    
    func numberOfPointsInLineGraph(graph: BEMSimpleLineGraphView) -> NSInteger{
        return 9
    }
    
    func lineGraph(lineGraph: BEMSimpleLineGraphView, valueForPointAtIndex index: NSInteger) -> CGFloat{
        /*switch index{
        case 0: return 1095.0
        case 1: return 1095.0
        case 2: return 1020.0
        case 3: return 1020.0
        case 4: return 1020.0
        case 5: return 1020.0
        case 6: return 1020.0
        case 7: return 1020.0
        case 8: return 1020.0
        default: return 0
        }*/
        return data[index]
    }
    
    func numberOfGapsBetweenLabelsOnLineGraph(graph: BEMSimpleLineGraphView) -> NSInteger{
        return 1
    }
    
    func lineGraph(lineGraph: BEMSimpleLineGraphView, labelOnXAxisForIndex index: NSInteger) -> NSString{
        switch index{
        case 0: return "15th\nMar"
        case 1: return "16th\nMar"
        case 2: return "17th\nMar"
        case 3: return "18th\nMar"
        case 4: return "19th\nMar"
        case 5: return "20th\nMar"
        case 6: return "21th\nMar"
        case 7: return "22th\nMar"
        case 8: return "23th\nMar"
        default: return ""
        }
    }
}