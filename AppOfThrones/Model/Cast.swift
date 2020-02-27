//
//  Cast.swift
//  AppOfThrones
//
//  Created by Sergio Cazorla on 17/02/2020.
//  Copyright © 2020 Sergio Cazorla. All rights reserved.
//

import Foundation


struct Cast: Identifiable, Codable, Equatable, CustomStringConvertible{
    
    var id: Int
    var avatar: String?
    var fullname: String?
    var role: String?
    var episodes: Int?
    var birth: String?
    var placeBirth: String?
    
//    MARK: - Equatable
    
    static func == (lhs: Cast, rhs: Cast) -> Bool {
        return lhs.id == rhs.id 
    }
    
//    MARK: - CustomStringConvertible
    
    var description: String {
        if let epi = self.episodes{
            return "Appeared in \(epi) episodes"
        }
        return "No show"
    }
    
    var description1: String {
        if let born = self.placeBirth{
            return "Born in -> \(born)"
        }
        return "No place info"
    }
   
    
}
