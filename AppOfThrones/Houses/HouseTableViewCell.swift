//
//  HouseTableViewCell.swift
//  AppOfThrones
//
//  Created by Sergio Cazorla on 18/02/2020.
//  Copyright © 2020 Sergio Cazorla. All rights reserved.
//

import UIKit

class HouseTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageName: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var words: UILabel!
    
    @IBOutlet weak var seat: UILabel!
    
    override func awakeFromNib() {
        imageName.layer.cornerRadius = 2.0
        imageName.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        imageName.layer.borderWidth = 1.0
        
    }
    
    func setHouse(_ house: House) {
        self.name.text = house.name
        self.words.text = house.words
        self.seat.text = house.seat
        self.imageName.image = UIImage.init(named: house.imageName ?? "")
    }
    
    
}
