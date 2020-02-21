//
//  HouseTableViewCell.swift
//  AppOfThrones
//
//  Created by Sergio Cazorla on 18/02/2020.
//  Copyright © 2020 Sergio Cazorla. All rights reserved.
//

import UIKit

class HouseTableViewCell: UITableViewCell {
    
    @IBOutlet weak var heart: UIButton!
    @IBOutlet weak var imageName: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var words: UILabel!
    @IBOutlet weak var seat: UILabel!
    
    private var house: House?
    var delegate: FavoriteDelegate?
    
    override func awakeFromNib() {
        imageName.layer.cornerRadius = 8.0
        imageName.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        imageName.layer.borderWidth = 1.0
        
    }
    
    func setHouse(_ house: House) {
        self.house = house
        let heartImageNamed = DataController.shared.isFavorite(house) ? "heart.fill" : "heart"
        let heartImage = UIImage.init(systemName: heartImageNamed)
        self.heart.setImage(heartImage, for: .normal)
        
        self.name.text = house.name
        self.words.text = house.words
        self.seat.text = house.seat
        self.imageName.image = UIImage.init(named: house.imageName ?? "")
    }
    @IBAction func fireFavorite(_ sender: Any) {
        if let house = self.house {
            if DataController.shared.isFavorite(house) == false {
                DataController.shared.addFavorite(house)
            }else{
                DataController.shared.removeFavorite(house)
            }
            delegate?.didFavoriteChanged()
        }
    }
    
    
}
