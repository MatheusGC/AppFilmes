//
//  FilmeCollectionViewCell.swift
//  MovieApp
//
//  Created by Matheus Golke Cardoso on 27/03/21.
//  Copyright © 2021 Matheus. All rights reserved.
//

import UIKit

class FilmeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imagemFilme: UIImageView!
    
    func recebeImagem(filme:MoviesViewModel){
        let posterPath = filme.posterPath
        guard let urlImagem = URL(string: posterPath) else {return}

        imagemFilme.af_setImage(withURL: urlImagem)
        
    }

}
