//
//  EpisodeViewController.swift
//  AppOfThrones
//
//  Created by Sergio Cazorla on 13/02/2020.
//  Copyright © 2020 Sergio Cazorla. All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController {
    
    var episodes: [Episode] = [Episode.init(id: 1, name: "Winter is coming", date: "April 17, 2011", image: "image", episode: 1, season: 1, overview: "Jon Arryn, the Hand of the King, is dead. King Robert...")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Seasons"
    }
    
    
    @IBAction func openRate(_ sender: Any) {
        
        let rateViewController = RateViewController()
        
        self.present(rateViewController, animated: true, completion: nil)
        
    }
    
    
}
