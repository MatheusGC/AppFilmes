//
//  Filmes.swift
//  MovieApp
//
//  Created by Matheus Golke Cardoso on 27/03/21.
//  Copyright © 2021 Matheus. All rights reserved.
//

import UIKit

class Filmes: NSObject {
    
    var posterPath:String
    var id:Int
    
    init(posterPath:String, id:Int){
        self.posterPath = posterPath
        self.id = id
    }
    
}
