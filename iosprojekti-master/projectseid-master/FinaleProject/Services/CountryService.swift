//
//  CountryService.swift
//  FinaleProject
//
//  Created by Arber Basha on 17/07/2019.
//  Copyright © 2019 Arber Basha. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class CountryService: NSObject {
    var param: [String: Any]!
    

    
    static let header  = ["X-RapidAPI-Host":"restcountries-v1.p.rapidapi.com","X-RapidAPI-Key": "e071e2f77emshf265bd719a4286fp1dedcajsnc7d4a7b3d608"]
    
    class func getCountry(id: Int,completionHandler: @escaping(_ success: Bool, _ user: Country?, _ error: Error?)->Void){
        let urlString = "https://reqres.in/api/users/\(id)"
        Alamofire.request(urlString, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            switch response.result{
            case .success(let data):
                let jsonData = JSON(data)
                if let country = Country.createCountry(json: jsonData["data"]){
                    completionHandler(true,country,nil)
                }
            case .failure(let error):
                completionHandler(false,nil,error)
            }
        }
        
    }
}
