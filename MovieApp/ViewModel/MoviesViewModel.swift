//
//  MoviesViewModel.swift
//  MovieApp
//
//  Created by Matheus Golke Cardoso on 05/04/21.
//  Copyright © 2021 Matheus. All rights reserved.
//

import Foundation

struct MoviesViewModel {
    let posterPath:String
    let id:Int
    
    init(posterPath:String, id:Int) {
        self.posterPath = posterPath
        self.id = id
    }
}


