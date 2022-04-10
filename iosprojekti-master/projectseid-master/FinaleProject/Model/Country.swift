//
//  Country.swift
//  FinaleProject
//
//  Created by Arber Basha on 17/07/2019.
//  Copyright © 2019 Arber Basha. All rights reserved.
//

import UIKit
import SwiftyJSON

//"name":"Afghanistan"
//"capital":"Kabul"
//"altSpellings":[...]2 items
//"relevance":"0"
//"region":"Asia"

class Country: NSObject {

    var name:String?
    var capital:String?
    var region:String?
    
    static func createCountry(json: JSON) -> Country?{
        let country = Country()
        if let name = json["name"].string{
            country.name = name
            if let capital = json["capital"].string{
                country.capital = capital
            }
            if let region = json["region"].string{
                country.region = region
            }
            return country
        }
        return nil
    }
    
    static func createUsersArray(jsonArray: [JSON]) -> [Country]? {
        var countryArray: [Country] = []
        for jsonObj in jsonArray{
            if let country = Country.createCountry(json: jsonObj){
                countryArray.append(country)
            }
        }
        return countryArray
    }

    
    
}
