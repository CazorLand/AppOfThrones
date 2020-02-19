//
//  DataController.swift
//  AppOfThrones
//
//  Created by Sergio Cazorla on 17/02/2020.
//  Copyright © 2020 Sergio Cazorla. All rights reserved.
//

import Foundation


class DataController {
    
    
    
    static var shared = DataController()
    private init () {}
    
    private var rating: [Rating] = []
    
    
    // MARK: - Rating
    
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
    

