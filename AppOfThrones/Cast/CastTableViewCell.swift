//
//  CastTableViewCell.swift
//  AppOfThrones
//
//  Created by Sergio Cazorla on 17/02/2020.
//  Copyright © 2020 Sergio Cazorla. All rights reserved.
//

import UIKit

class CastTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatar: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var role: UILabel!
    
    
    @IBOutlet weak var episodes: UILabel!
    
    @IBOutlet weak var heart: UIButton!
    
    override func awakeFromNib() {
        avatar.layer.cornerRadius = 8
        avatar.layer.borderWidth = 1.0
        avatar.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
    }
    
    func setCast(_ cast: Cast) {
        self.episodes.text = "\(cast.episodes ?? 0) episodes"
        self.role.text = cast.role
        self.name.text = cast.fullname
        self.avatar.image = UIImage.init(named: cast.avatar ?? "")
    }
    
}
