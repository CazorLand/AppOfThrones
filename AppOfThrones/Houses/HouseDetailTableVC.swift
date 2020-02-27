//
//  HouseDetailTableVC.swift
//  AppOfThrones
//
//  Created by Sergio Cazorla on 26/02/2020.
//  Copyright © 2020 Sergio Cazorla. All rights reserved.
//

import UIKit

class HouseDetailTableVC: UITableViewCell {
    
    @IBOutlet weak var imageHouse: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var words: UILabel!
    @IBOutlet weak var seat: UILabel!
    
    var house: House?
    
    override func awakeFromNib() {
        imageHouse.layer.cornerRadius = 5
    }
    
    func setHouse(_ house: House?) {
        self.house = house
        imageHouse.image = UIImage.init(named: house?.imageName ?? "")
        self.name.text = house?.description
        self.words.text = house?.words
        self.seat.text = house?.description1
    }
    
}
