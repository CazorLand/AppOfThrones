//
//  EpisodeViewController.swift
//  AppOfThrones
//
//  Created by Sergio Cazorla on 13/02/2020.
//  Copyright © 2020 Sergio Cazorla. All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, RateViewControllerDelegate, FavoriteDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var episodes: [Episode] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupNotifications()
        self.setupData(1)
        
    }
    
    deinit {
        let noteName = Notification.Name(rawValue: "DidFavoritesUpdated")
        NotificationCenter.default.removeObserver(self, name: noteName, object: nil)
    }
    
    // MARK: - Setup
    
    func setupUI() {
        self.title = "Seasons"
        
        let nib = UINib.init(nibName: "EpisodeTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "EpisodeTableViewCell")
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    
    func setupNotifications() {
        let noteName = Notification.Name(rawValue: "DidFavoritesUpdated")
        NotificationCenter.default.addObserver(self, selector: #selector(self.didFavoriteChanged), name: noteName, object: nil)
    }
    
    func setupData(_ seasonNumber :Int) {
        if let pathURL = Bundle.main.url(forResource: "season_\(seasonNumber)", withExtension: "json") {
            do {
                let data = try Data.init(contentsOf: pathURL)
                let decoder = JSONDecoder()
                episodes = try decoder.decode([Episode].self, from: data)
                self.tableView.reloadData()
            }catch {
                fatalError(error.localizedDescription)
            }
        }else {
            fatalError("Could not build the pathURL")
        }
    }
    
    // MARK: - IBActions
    
    @IBAction func openRate(_ sender: Any) {
        
        let rateViewController = RateViewController()
        rateViewController.modalPresentationStyle = .fullScreen
        self.present(rateViewController, animated: true, completion: nil)
    }
    @IBAction func seasonChanged(_ sender: UISegmentedControl) {
        let seasonNumber = sender.selectedSegmentIndex + 1
        self.setupData(seasonNumber)
    }
    
    
    //MARK: - EpisodeTableViewCellDelegate
    
    @objc func didFavoriteChanged() {
        self.tableView.reloadData()
    }
    
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
            cell.delegate = self
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
