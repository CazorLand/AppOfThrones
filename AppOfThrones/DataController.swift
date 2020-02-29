//
//  DataController.swift
//  AppOfThrones
//
//  Created by Sergio Cazorla on 17/02/2020.
//  Copyright © 2020 Sergio Cazorla. All rights reserved.
//

import Foundation

protocol FavoriteDelegate {
    func didFavoriteChanged()
}

protocol Identifiable {
    var id: Int { get }
}


class DataController {
    
    static var shared = DataController()
    private init () {}
    
    private var rating: [Rating] = []
    private var favorite: [Int] = []
    private var favoriteEpisodes: [Episode] = []

    
    // MARK: - Favorite
    
    func cleanFavorite() {
        favorite = []
        favoriteEpisodes = []
    }
    
    func getFavEpisodes(_ index: Int) -> Episode {
        return self.favoriteEpisodes[index]
    }
    
    func allFavEpisodes() -> Int {
        return self.favoriteEpisodes.count
    }
    
   func isFavorite<T: Identifiable>(_ value: T) -> Bool {
       return favorite.contains(value.id)
   }
   
   func addFavorite<T: Identifiable>(_ value: T) {
       if self.isFavorite(value) == false {
           favorite.append(value.id)
        if let favEpisode = value as? Episode{
            favoriteEpisodes.append(favEpisode)
            }
       }
   }
   
   func removeFavorite<T: Identifiable>(_ value: T) {
       if let index = favorite.firstIndex(of: value.id) {
           favorite.remove(at: index)
       }
    if let favEpisode = value as? Episode{
        if let index = favoriteEpisodes.firstIndex(of: favEpisode) {
            favoriteEpisodes.remove(at: index)
            }
        }
   }

    // MARK: - Rating

     func cleanReview() {
         rating = []
     }
    
    // Añade la puntutación para un episodio con un valor de x (en la posicion en la q esté). Si ya existe esa puntuación no va a hacer nada y si no existe la añado.
    func rateEpisode(_ episode: Episode, value: Double) {
        if self.ratingForEpisode(episode) == nil {
            let value = Rating.init(id: episode.id, rate: .rated(value: value))
            rating.append(value)
        }
    }
    
    // Aquí borramos la puntuación de un episodio si existe, si no existe no hace nada.
    func removeRateEpisode(_ episode: Episode) {
        if let index = self.rating.firstIndex(where: { (rating) -> Bool in
            return episode.id == rating.id
        }) {
            self.rating.remove(at: index)
        }
    }
    
    // Pregunto por la puntución de un episodio, si existe ese episodio lo devuelvo y si no devuelvo un nil.
    func ratingForEpisode(_ episode: Episode) -> Rating? {
        let filtered = rating.filter {
            $0.id == episode.id
        }
        return filtered.first
    }
}
    

