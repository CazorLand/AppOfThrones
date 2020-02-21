//
//  SettingsViewController.swift
//  AppOfThrones
//
//  Created by Sergio Cazorla on 13/02/2020.
//  Copyright © 2020 Sergio Cazorla. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBAction func cleanFavoritesAction(_ sender: Any) {
        DataController.shared.cleanFavorite()
        
        let noteName = Notification.Name(rawValue: "DidFavoritesUpdated")
        NotificationCenter.default.post(name: noteName, object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
    }
    
    
    @IBAction func openProfile(_ sender: Any) {
        
        let openProfile = OpenProfile()
        
        //self.present(openProfile, animated: true, completion: nil)
        //se abre nueva pantalla
        self.show(openProfile, sender: self)
    }
    
    @IBAction func openHelp(_ sender: Any) {
        
        let openHelp = OpenHelp()
        
        //Sale ficha desde abajo
        self.present(openHelp, animated: true, completion: nil)
        
        
        
    }
    
}
        
