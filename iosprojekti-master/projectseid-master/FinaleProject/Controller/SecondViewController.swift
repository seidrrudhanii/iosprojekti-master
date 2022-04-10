//
//  SecondViewController.swift
//  FinaleProject
//
//  Created by Arber Basha on 17/07/2019.
//  Copyright © 2019 Arber Basha. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate , UITableViewDataSource {

    var teamsArray: [Team] = []

 
    @IBOutlet weak var tblTeam: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        getTeams()

        
    }
    
    func getTeams(){
        NbaService.getTeams { (success, teams, error) in
            if(success){
                if let newTeamArray = teams {
                    self.teamsArray = newTeamArray
                    self.tblTeam.reloadData()
                }
            }
        }
        
    }
    
    func setupTable(){
        tblTeam.delegate = self
        tblTeam.dataSource = self
        tblTeam.register(UINib(nibName: "TeamCell", bundle: nil), forCellReuseIdentifier: "teamCell")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
 
    let cell = tblTeam.dequeueReusableCell(withIdentifier: "teamCell") as! TeamCell
        let team = teamsArray[indexPath.row]
        
        cell.lblTeam.text = team.full_name
        cell.lblCity.text = team.city
//        cell.lblTeam.text = "team.full_name"
//        cell.lblCity.text = "team.city"
//
        return cell
    }



}
