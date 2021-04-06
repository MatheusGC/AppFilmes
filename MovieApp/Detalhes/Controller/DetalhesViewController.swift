//
//  DetalhesViewController.swift
//  MovieApp
//
//  Created by Matheus Golke Cardoso on 28/03/21.
//  Copyright © 2021 Matheus. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire

class DetalhesViewController: UIViewController {
    
    
    @IBOutlet weak var imagemDoFilme: UIImageView!
    @IBOutlet weak var labelTituloDoFilme: UILabel!
    @IBOutlet weak var labelRatingDoFilme: UILabel!
    @IBOutlet weak var labelSinopseDoFilme: UILabel!
    
    var filmeSelecionado:MoviesViewModel?
    var todosOsDetalhes:DetalhesFilmes?
    var listaDeDetalhes:[Detalhes] = []
    
    var request = DetalhesProvider()
   
    
    var detalhesProvider = DetalhesProvider()
    var listaDetalhes:[DetalhesFilmes] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDetalhes()
        //guard let filme = filmeSelecionado?.id else {return}
        //listaDetalhes = detalhesProvider.getDataDetalhes(idFilme: filme)
    }
            
    
    @IBAction func botaoVoltar(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func getDetalhes(){

        guard let IDfilme = filmeSelecionado?.id else {return}
        request.getDataDetalhes(idFilme: IDfilme) { (resultado) in
            guard let posterPath = resultado.posterPath else {return}
            let posterPathCompleto = "https://image.tmdb.org/t/p/w500\(posterPath)"
            guard let titulo = resultado.title else {return}
            guard let rating = resultado.voteAverage else {return}
            guard let sinopse = resultado.overview else {return}
            
            
            DispatchQueue.main.async {
                self.imagemDoFilme.af_setImage(withURL: URL(string:posterPathCompleto)!)
                self.labelTituloDoFilme.text = titulo
                self.labelRatingDoFilme.text = String(rating)
                self.labelSinopseDoFilme.text = sinopse
            }
           
          
           //let detalheAtual = Details(posterPath: posterPath, titulo: titulo, rating: String(rating), overview: sinopse)

        }
    }
    
    
}
