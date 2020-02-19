//
//  EpisodeViewController.swift
//  AppOfThrones
//
//  Created by Sergio Cazorla on 13/02/2020.
//  Copyright © 2020 Sergio Cazorla. All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, RateViewControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var episodes: [Episode] = [Episode.init(id: 1, name: "Winter is coming", date: "April 17, 2011", image: "image", episode: 1, season: 1, overview: "Jon Arryn, the Hand of the King, is dead. King Robert...")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
    }
    
    // MARK: - Setup
    
    func setupUI() {
        self.title = "Seasons"
        
        let nib = UINib.init(nibName: "EpisodeTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "EpisodeTableViewCell")
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    
    @IBAction func openRate(_ sender: Any) {
        
        let rateViewController = RateViewController()
        rateViewController.modalPresentationStyle = .fullScreen
        self.present(rateViewController, animated: true, completion: nil)
    }
    
    //MARK: - EpisodeTableViewCellDelegate
    
    func didRateChange() {
        self.tableView.reloadData()
    }
    
    //MARK: - UITableViewDelegate
    
    //1.- Altura de la celda
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 123
    }
    
    //2.- Acción de la tabla o boton.
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeTableViewCell", for: indexPath) as? EpisodeTableViewCell {
            let ep = episodes[indexPath.row]
            cell.setEpisode(ep)
            cell.rateBlock = { () -> Void in
                let rateViewController = RateViewController.init(withEpisode: ep)
                rateViewController.delegate = self
                let navigationController = UINavigationController.init(rootViewController: rateViewController)
                self.present(navigationController, animated: true, completion: nil)
                
            }
            return cell
        }
        fatalError("Could not create the Episde cell")
    }

}
