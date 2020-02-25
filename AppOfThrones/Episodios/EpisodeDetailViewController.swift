//
//  EpisodeDetailViewController.swift
//  AppOfThrones
//
//  Created by Sergio Cazorla on 24/02/2020.
//  Copyright © 2020 Sergio Cazorla. All rights reserved.
//

import UIKit

class EpisodeDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var episode: Episode? 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    
    // MARK: - SetUp
    
    func setupUI() {
        self.title = episode?.name
        
        let nib = UINib.init(nibName: "EpisodeDetailTableVC", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "EpisodeDetailTableVC")
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func setEpisode(_ episode: Episode){
        self.episode = episode
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 818
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeDetailTableVC", for: indexPath) as? EpisodeDetailTableVC {
                cell.setEpisode(episode)
                
                return cell
            }
        }
        fatalError("Could not create cell episode")
    }
    
}
