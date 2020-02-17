//
//  EpisodeViewController.swift
//  AppOfThrones
//
//  Created by Sergio Cazorla on 13/02/2020.
//  Copyright © 2020 Sergio Cazorla. All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var episodes: [Episode] = [Episode.init(id: 1, name: "Winter is coming", date: "April 17, 2011", image: "image", episode: 1, season: 1, overview: "Jon Arryn, the Hand of the King, is dead. King Robert...")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    func setupUI() {
        self.title = "Seasons"
        
        let nib = UINib.init(nibName: "EpisodeTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "EpisodeTableViewCell")
        
    }
    
    @IBAction func openRate(_ sender: Any) {
        
        let rateViewController = RateViewController()
        rateViewController.modalPresentationStyle = .fullScreen
        self.present(rateViewController, animated: true, completion: nil)
        
    }
    
    
}
