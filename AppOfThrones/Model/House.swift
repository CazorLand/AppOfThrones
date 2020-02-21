//
//  House.swift
//  AppOfThrones
//
//  Created by Sergio Cazorla on 18/02/2020.
//  Copyright © 2020 Sergio Cazorla. All rights reserved.
//

import Foundation

struct House: Identifiable ,Codable {
    
    var imageName: String?
    var name: String?
    var words: String?
    var seat: String? //Area donde se mueve esa casa. Mirar en la fan wiki
    var id: Int
    
    init(imageName: String?, name: String?, words: String?, seat: String?, id: Int) {
           self.imageName = imageName
           self.name  = name
           self.words = words
           self.seat  = seat
           self.id = id
       }
}
