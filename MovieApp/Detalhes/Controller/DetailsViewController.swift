//
//  DetailsViewController.swift
//  MovieApp
//
//  Created by Matheus Golke Cardoso on 03/04/21.
//  Copyright © 2021 Matheus. All rights reserved.
//

import UIKit
import AlamofireImage

class DetailsViewController: UIViewController {
    
    var detalhe:Details?
    var todosOsDetalhes:DetalhesFilmes?
    
    
    @IBOutlet weak var imagemFilme: UIImageView!
    @IBOutlet weak var labelTituloFilme: UILabel!
    @IBOutlet weak var labelRatingFilme: UILabel!
    @IBOutlet weak var labelSinopseFilme: UILabel!
    
    //var listaDetalhes = [Details]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiDetalhes(idFilme: 791373)
    }
    
    func loadData(){
//     detalhe = Details(posterPath: "https://image.tmdb.org/t/p/w500/v9XwEXYWpxt2rpkmFBiQ1zeyKUy.jpg", titulo: "Liga da Justiça de Zack Snyder", rating: "7.0", overview: "Determinado a garantir que o sacrifício final do Superman não foi em vão, Bruce Wayne alinha forças com Diana Prince com planos de recrutar uma equipe de metahumanos para proteger o mundo de uma ameaça de proporções catastróficas que se aproxima.")
        guard let posterPath = todosOsDetalhes?.posterPath else {return}
        guard let titulo = todosOsDetalhes?.title else {return}
        guard let rating = todosOsDetalhes?.voteAverage else {return}
        guard let sinopse = todosOsDetalhes?.overview else {return}
        
        detalhe = Details(posterPath: posterPath,
                          titulo: titulo,
                          rating: String(rating),
                          overview: sinopse)
    setupUI()
    }
    
    //todosOsDetalhes?.posterPath ?? ""
    
    func setupUI(){
        
        
        //listaDetalhes.append(detalhe)
        guard let posterPath = detalhe?.posterPath else {return}
        guard let urlImage = URL(string: posterPath) else {return}
        self.imagemFilme.af_setImage(withURL: urlImage)
        
        // para teste unitário
        //self.imagemFilme = UIImageView()
        
        guard let titulo = detalhe?.titulo else {return}
        self.labelTituloFilme.text = titulo
        guard let rating = detalhe?.rating else {return}
        self.labelRatingFilme.text = rating
        guard let sinopse = detalhe?.overview else {return}
        self.labelSinopseFilme.text = sinopse
        
    }
    
    
    func apiDetalhes(idFilme:Int){
        
        let urlDetalhes = "https://api.themoviedb.org/3/movie/\(idFilme)?api_key=92f48df587a0b620ed4b4a7ecc9b9159&language=pt-BR"
        guard let finalUrlDetalhes = URL(string: urlDetalhes) else {return}
        
        
        let taskDetalhes = URLSession.shared.dataTask(with: finalUrlDetalhes) { (data, response, error) in
            guard let data = data, error == nil else {return}
            
            do{
                self.todosOsDetalhes = try JSONDecoder().decode(DetalhesFilmes.self, from: data)
                self.loadData()
            }catch{
                print(error.localizedDescription)
            }
        }
        
        taskDetalhes.resume()
    }
    
}
