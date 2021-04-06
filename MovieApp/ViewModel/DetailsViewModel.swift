//
//  DetailsViewModel.swift
//  MovieApp
//
//  Created by Matheus Golke Cardoso on 03/04/21.
//  Copyright © 2021 Matheus. All rights reserved.
//

import Foundation

struct Details{
    var posterPath:String
    var titulo:String
    var rating:String
    var overview:String
    
    init(posterPath:String, titulo:String, rating:String, overview:String) {
        self.posterPath = posterPath
        self.titulo = titulo
        self.rating = rating
        self.overview = overview
    }
}

