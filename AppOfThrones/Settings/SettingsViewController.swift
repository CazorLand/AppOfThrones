//
//  SettingsViewController.swift
//  AppOfThrones
//
//  Created by Sergio Cazorla on 13/02/2020.
//  Copyright © 2020 Sergio Cazorla. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
    }
    
    
    @IBAction func openProfile(_ sender: Any) {
        
        let openProfile = OpenProfile()
        
        self.present(openProfile, animated: true, completion: nil)
    }
    
    @IBAction func openHelp(_ sender: Any) {
        
        let openHelp = OpenHelp()
        
        self.present(openHelp, animated: true, completion: nil)
        
    }
    
}
        