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
    private var cities = ["BARCELONA", "DUBAI", "LONDON", "LYON"]
    private var selectedCityRow = -1
    private var barcelonaPrices : [CGFloat] = [1284, 1284, 1172, 1172, 1172, 1172, 1172, 1172, 1172]
    private var dubaiPrices : [CGFloat] = [1095, 1095, 1020, 1020, 1020, 1020, 1020, 1020, 1020]
    private var londonPrices : [CGFloat] = [1148, 1148, 1035, 1035, 1035, 1035, 1035, 1035, 1035]
    
    private var prices : [[CGFloat]] = [[1284, 1284, 1172, 1172, 1172, 1172, 1172, 1172, 1172],
                           [1095, 1095, 1020, 1020, 1020, 1020, 1020, 1020, 1020],
                           [1148, 1148, 1035, 1035, 1035, 1035, 1035, 1035, 1035],
                            [1359, 1359, 1361, 1247, 1249, 1247, 1247, 1247, 1247]]
    
    private var suggestedHotel: String!
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        suggestionTable.delegate = self
        suggestionTable.dataSource = self
        suggestedHotel = ""
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
            APIIntegration().HTTPGetJSON("http://partners.api.skyscanner.net/apiservices/hotels/autosuggest/v2/SG/SGD/en-GB/\(cities[indexPath.row])?apikey=ah455060782609507443529395970981", callback: handleGETJSON)
            NSThread.sleepForTimeInterval(0.3)
            cell.setUpCell(prices[indexPath.row], suggestedHotel: suggestedHotel)
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
    
    func handleGET(result:String, err:String?) -> Void{
        println(result)
    }
    
    func handleGETJSON(result:Dictionary<String, AnyObject>, err:String?) -> Void{
        //println(result)
        findHotel(result)
    }
    
    private func findHotel(data: Dictionary<String, AnyObject>) -> Void{
        var results = data["results"] as [AnyObject]
        for(var i = 0 ; i < results.count ; i++){
            var geo_type = results[i]["geo_type"] as String!
            if(geo_type == "Hotel"){
                print(results[i])
                self.suggestedHotel = results[i]["display_name"] as String!
            }
        }
    }
    
}
