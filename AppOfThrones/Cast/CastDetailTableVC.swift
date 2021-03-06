//
//  CastDetailTableVC.swift
//  AppOfThrones
//
//  Created by Sergio Cazorla on 22/02/2020.
//  Copyright © 2020 Sergio Cazorla. All rights reserved.
//

import UIKit

class CastDetailTableVC: UITableViewCell {
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var role: UILabel!
    @IBOutlet weak var episodes: UILabel!
    @IBOutlet weak var birth: UILabel!
    @IBOutlet weak var placeBirth: UILabel!
    
    var cast: Cast?
    
    override func awakeFromNib() {
        avatar.layer.cornerRadius = 5
    }

    func setCast(_ cast: Cast?) {
        self.cast = cast
        avatar.image = UIImage.init(named: self.cast?.avatar ?? "")
        self.fullName.text = cast?.fullname
        self.role.text = cast?.role
        self.birth.text = cast?.birth
        self.placeBirth.text = cast?.description1
        self.episodes.text = cast?.description
    }
    
    
}
