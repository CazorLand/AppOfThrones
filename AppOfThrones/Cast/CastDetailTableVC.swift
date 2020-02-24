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
    
    
    var cast: Cast? {
        didSet {
            avatar.image = UIImage.init(named: self.cast?.avatar ?? "")
            fullName.text = self.cast?.fullname
            role.text = self.cast?.role
            birth.text = self.cast?.birth
            placeBirth.text = self.cast?.placeBirth
        }
    }
    
   

    
    
    
}
