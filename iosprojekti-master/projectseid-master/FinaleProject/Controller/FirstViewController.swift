//
//  FirstViewController.swift
//  FinaleProject
//
//  Created by Arber Basha on 17/07/2019.
//  Copyright © 2019 Arber Basha. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func alertBtn(_ sender: Any) {
        
        let alert = UIAlertController(title: "It's an Alert Dialog", message: "Do you like it", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)

    }
    
}
