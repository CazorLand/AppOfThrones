//
//  SettingsViewController.swift
//  AppOfThrones
//
//  Created by Sergio Cazorla on 13/02/2020.
//  Copyright © 2020 Sergio Cazorla. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var cleanFavorites: UIButton!
    @IBOutlet weak var cleanReviews: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.setupUI()
        
    }
    
//    MARK: - SetUp
    
    func setupUI() {
        self.title = "Settings"
        self.cleanFavorites.layer.cornerRadius = 20.0
        self.cleanReviews.layer.cornerRadius = 20.0
    }
    
//    MARK: - IBActions
    
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
    
    @IBAction func cleanFavoritesAction(_ sender: Any) {
        DataController.shared.cleanFavorite()
        
        let noteName = Notification.Name(rawValue: "DidFavoritesUpdated")
        NotificationCenter.default.post(name: noteName, object: nil)
    }
    
    @IBAction func cleanReviewsAction(_ sender: Any) {
        DataController.shared.cleanReview()

        let noteNameRev = Notification.Name("DidReviewsUpdated")
        NotificationCenter.default.post(name: noteNameRev, object: nil)
    }
    
    
}
        
