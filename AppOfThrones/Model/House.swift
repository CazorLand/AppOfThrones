//
//  House.swift
//  AppOfThrones
//
//  Created by Sergio Cazorla on 18/02/2020.
//  Copyright © 2020 Sergio Cazorla. All rights reserved.
//

import Foundation

struct House: Identifiable ,Codable, Equatable, CustomStringConvertible {
    
    
    
    var imageName: String?
    var name: String?
    var words: String?
    var seat: String?
    var id: Int

    
//    MARK: - Equatable
    
    static func == (lhs: House, rhs: House) -> Bool {
        return  lhs.id == rhs.id
    }
    
//    MARK: - CustomStringConvertible
    
    var description: String {
        if let name = self.name {
            return "House \(name)"
        }
        return "House not available"
    }
    
    var description1: String {
        if let place = self.seat {
            return "Seat -> \(place)"
        }
        return "No place"
    }
}
