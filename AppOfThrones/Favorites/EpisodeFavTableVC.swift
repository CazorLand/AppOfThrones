//
//  EpisodeFavTableVC.swift
//  AppOfThrones
//
//  Created by Sergio Cazorla on 28/02/2020.
//  Copyright © 2020 Sergio Cazorla. All rights reserved.
//

import UIKit

class EpisodeFavTableVC: UITableViewCell {
    
    @IBOutlet weak var episodeImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var episodeNumber: UILabel!
    
    override func awakeFromNib() {
        episodeImage.layer.cornerRadius = 2.0
        episodeImage.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        episodeImage.layer.borderWidth = 1.0
        
    }
    
    func setFavEpisode(_ episode: Episode) {
        self.episodeImage.image = UIImage.init(named: episode.image ?? "")
        self.name.text = episode.name
        self.episodeNumber.text = episode.description
    }
    
}
