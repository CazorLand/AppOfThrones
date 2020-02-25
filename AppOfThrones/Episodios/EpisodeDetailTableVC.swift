//
//  EpisodeDetailTableVC.swift
//  AppOfThrones
//
//  Created by Sergio Cazorla on 25/02/2020.
//  Copyright © 2020 Sergio Cazorla. All rights reserved.
//

import UIKit

class EpisodeDetailTableVC: UITableViewCell {
    
    @IBOutlet weak var episodeImage: UIImageView!
    @IBOutlet weak var episode: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var overView: UITextView!
    
    var episodeDetail: Episode?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        episodeImage.layer.cornerRadius = 5
        
    }
    
   
    func setEpisode(_ episode: Episode?) {
        if let ep = episode {
            episodeImage.image = ep.image == nil ? nil : UIImage.init(named: ep.image!)
            self.episode.text = "Episode \(ep.episode) - Season \(ep.season)"
            self.name.text = ep.name
            self.date.text = ep.date
            self.overView.text = ep.overview
            
        }
    }
    
}
