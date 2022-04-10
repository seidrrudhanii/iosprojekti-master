//
//  Team.swift
//  FinaleProject
//
//  Created by Arber Basha on 19/07/2019.
//  Copyright © 2019 Arber Basha. All rights reserved.
//

import UIKit
import SwiftyJSON

class Team: NSObject {

    var id:Int?
    var abbrevitation:String?
    var city:String?
    var full_name:String?
    
    static func createTeam(json: JSON) -> Team?{
        let team = Team()
        if let id = json["id"].int{
            team.id = id
            if let abbrevitation = json["abbreviation"].string{
                team.abbrevitation = abbrevitation
            }
            if let city = json["city"].string{
                team.city = city
            }
            if let full_name = json["full_name"].string{
                team.full_name = full_name
            }
            return team
        }
        return nil
    }
    
    static func createTeamArray(jsonArray: [JSON]) -> [Team]? {
        var teamArray: [Team] = []
        for jsonObj in jsonArray{
            if let team = Team.createTeam(json: jsonObj){
                teamArray.append(team)
            }
        }
        return teamArray
    }
    
    
}
