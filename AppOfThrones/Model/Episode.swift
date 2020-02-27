//
//  Episode.swift
//  AppOfThrones
//
//  Created by Sergio Cazorla on 13/02/2020.
//  Copyright © 2020 Sergio Cazorla. All rights reserved.
//

import Foundation

class Episode: Identifiable, Codable, Equatable, CustomStringConvertible {
    
    var id: Int
    var name: String?
    var date: String?
    var image: String?
    var episode: Int
    var season: Int
    var overview: String
    
    init(id: Int, name: String?, date: String?, image: String?, episode: Int, season: Int, overview: String) {
        self.id = id
        self.name = name
        self.date = date
        self.image = image
        self.episode = episode
        self.season = season
        self.overview = overview
    }
    
//    MARK: - Equatable
    
    static func == (lhs: Episode, rhs:Episode) -> Bool {
        return lhs.id == rhs.id
    }
    
//    MARK: - CustomStringConvertible
    
    var description: String {
        return "Season \(self.season) Ep.\(self.episode)"
    }
    
    var descriptionOv: String {
        return "Overview: \(self.overview)"
    }
    
    
}
