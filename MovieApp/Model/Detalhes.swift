//
//  Detalhes.swift
//  MovieApp
//
//  Created by Matheus Golke Cardoso on 29/03/21.
//  Copyright © 2021 Matheus. All rights reserved.
//

import UIKit

class Detalhes: NSObject {
    
    var posterPath:String
    var titulo:String
    var rating:Double
    var overview:String
    
    init(posterPath:String, titulo:String, rating:Double, overview:String) {
        self.posterPath = posterPath
        self.titulo = titulo
        self.rating = rating
        self.overview = overview
    }
}
