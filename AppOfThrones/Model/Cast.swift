//
//  Cast.swift
//  AppOfThrones
//
//  Created by Sergio Cazorla on 17/02/2020.
//  Copyright © 2020 Sergio Cazorla. All rights reserved.
//

import Foundation


struct Cast: Identifiable, Codable {
    
    var id: Int
    var avatar: String?
    var fullname: String?
    var role: String?
    var episodes: Int?
    var birth: String?
    var placeBirth: String?
    
    init(id: Int, avatar: String? = nil, fullname: String? = nil, role: String? = nil, episodes: Int? = nil, birth: String? = nil, placeBirth: String? = nil) {
        self.id = id
        self.avatar = avatar
        self.fullname = fullname
        self.role = role
        self.episodes = episodes
        self.birth = birth
        self.placeBirth = placeBirth
    }
}
