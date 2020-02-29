//
//  FavoritesViewController.swift
//  AppOfThrones
//
//  Created by Sergio Cazorla on 24/02/2020.
//  Copyright © 2020 Sergio Cazorla. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var episodesFavorite: [Episode] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.setupUI()
        self.setupNotifications()
    }
    
//    MARK: - SetUp
    
    func setupUI() {
        self.title = "Favorites"
        
        let favoriteCell = UINib.init(nibName: "EpisodeFavTableVC", bundle: nil)
        tableView.register(favoriteCell, forCellReuseIdentifier: "EpisodeFavTableVC")
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    
    func setupNotifications() {
        let noteName = Notification.Name(rawValue: "DidFavoritesUpdated")
        NotificationCenter.default.addObserver(self, selector: #selector(self.didFavEpisodeChanged), name: noteName, object: nil)
    }
    
//    MARK: - FavoriteDelegate
    
    @objc func didFavEpisodeChanged() {
        self.tableView.reloadData()
    }
    
//    MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 123
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let episode = DataController.shared.getFavEpisodes(indexPath.row)
        
        let episodeDetailVC = EpisodeDetailViewController()
        episodeDetailVC.setEpisode(episode)
        
        self.navigationController?.pushViewController(episodeDetailVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
        
    }

//    MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataController.shared.allFavEpisodes()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeFavTableVC", for: indexPath) as? EpisodeFavTableVC {
            let favEpisode = DataController.shared.getFavEpisodes(indexPath.row)
            cell.setFavEpisode(favEpisode)
            return cell
        }
            fatalError("No Reusable cell available")
        
    }
    
}
