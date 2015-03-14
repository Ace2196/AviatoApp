//
//  SuggestionScreenViewController.swift
//  LocationSuggestion
//
//  Created by Abdulla Contractor on 14/3/15.
//  Copyright (c) 2015 Abdulla Contractor. All rights reserved.
//

import Foundation
import UIKit

class SuggestionScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var suggestionTable: UITableView!
    private var cities = ["BARCELONA", "DUBAI", "LONDON", "NEW YORK"]
    private var selectedCityRow = -1
    private var barcelonaPrices : [CGFloat] = [1284, 1284, 1172, 1172, 1172, 1172, 1172, 1172, 1172]
    private var dubaiPrices : [CGFloat] = [1095, 1095, 1020, 1020, 1020, 1020, 1020, 1020, 1020]
    private var londonPrices : [CGFloat] = [1148, 1148, 1035, 1035, 1035, 1035, 1035, 1035, 1035]
    
    private var prices : [[CGFloat]] = [[1284, 1284, 1172, 1172, 1172, 1172, 1172, 1172, 1172],
                           [1095, 1095, 1020, 1020, 1020, 1020, 1020, 1020, 1020],
                           [1148, 1148, 1035, 1035, 1035, 1035, 1035, 1035, 1035],
                            [1826, 1826, 1714, 1714, 1714, 1714, 1714, 1714, 1714]]
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        suggestionTable.delegate = self
        suggestionTable.dataSource = self
        
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if(indexPath.row != selectedCityRow){
            return 166;
        } else{
            return 498;
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if(indexPath.row != selectedCityRow){
            var cell = tableView.dequeueReusableCellWithIdentifier("cityCell", forIndexPath: indexPath) as CitySmallTableViewCell
            cell.cityNameLabel.text = cities[indexPath.row]
            cell.addShadows()
            cell.cityImageView.image = UIImage(named: cities[indexPath.row])
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            return cell
        } else{
            var cell = tableView.dequeueReusableCellWithIdentifier("expandedCityCell", forIndexPath: indexPath) as CityLargeTableViewCell
            cell.cityNameLabel.text = cities[indexPath.row]
            cell.cityImageView.image = UIImage(named: cities[indexPath.row])
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            cell.setUpCell(prices[indexPath.row])
            return cell
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if(indexPath.row == selectedCityRow){
            selectedCityRow = -1
        } else{
            selectedCityRow = indexPath.row
        }
        tableView.reloadData()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    private func getFlight(country: String){
        
    }
    
}
