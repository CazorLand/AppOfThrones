//
//  Rating.swift
//  AppOfThrones
//
//  Created by Sergio Cazorla on 18/02/2020.
//  Copyright © 2020 Sergio Cazorla. All rights reserved.
//

import Foundation

enum Rate {
    case unrated
    case rated(value: Double)
}

struct Rating: Equatable, CustomStringConvertible {
    var id: Int
    var rate: Rate
    
    
    // MARK: - Equatable

    static func == (lhs: Rating, rhs: Rating) -> Bool {
        return lhs.id == rhs.id
    }

    // MARK: - CustomStringConvertible
    
    var description: String {
        switch rate {
        case .rated(let value):
            return "Rated -> \(value)"
        case.unrated:
            return "Unrated"
        }
    }
    
    
}


