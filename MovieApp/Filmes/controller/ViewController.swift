//
//  ViewController.swift
//  testingAPIMovie
//
//  Created by Matheus Golke Cardoso on 26/03/21.
//  Copyright © 2021 Matheus. All rights reserved.
//


import UIKit
import Alamofire
import AlamofireImage


class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
   

    
    
    var listaDeFilmes:[MoviesViewModel] = []
    var filmeProvider = FilmesProvider()
    var listaResultados:[Result] = []
    
    
    
    @IBOutlet weak var colecaoFilmes: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colecaoFilmes.dataSource = self
        colecaoFilmes.delegate = self
        getMovies()
    }
    
    //var teste = FilmesProvider().listaDeFilmes
    
//    func itensMovies(results:[Result]){
//        for result in results {
//            guard let idFilme = result.id else {return}
//            let id = idFilme
//            guard let posterPathFilme = result.posterPath else {return}
//            let posterPath = posterPathFilme
//            let completedPosterPath = "https://image.tmdb.org/t/p/w500\(posterPath)"
//            var movies = MoviesViewModel(posterPath: completedPosterPath, id: id)
//            self.listaDeFilmes.append(movies)
//            print(self.listaDeFilmes.count)
//        }
//    }
    
    func getMovies(){
        
        filmeProvider.getDataMovies { (results) in
            //self.itensMovies(results: results)
            
            
            for result in results {
                guard let idFilme = result.id else {return}
                let id = idFilme
                guard let posterPathFilme = result.posterPath else {return}
                let posterPath = posterPathFilme
                let completedPosterPath = "https://image.tmdb.org/t/p/w500\(posterPath)"
                let movies = MoviesViewModel(posterPath: completedPosterPath, id: id)
                self.listaDeFilmes.append(movies)
                //print(self.listaDeFilmes.count)
            }
            
            DispatchQueue.main.async {
                self.colecaoFilmes.reloadData()
            }
        }
        
      
    }
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listaDeFilmes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaFilme = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaFilme", for: indexPath) as! FilmeCollectionViewCell
        let filme = listaDeFilmes[indexPath.item]
        celulaFilme.recebeImagem(filme: filme)
        return celulaFilme
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       let filme = listaDeFilmes[indexPath.item]
       let storyboard = UIStoryboard(name: "Main", bundle: nil)
       let controller = storyboard.instantiateViewController(withIdentifier: "detalhesFilmes") as! DetalhesViewController
       controller.filmeSelecionado = filme
       self.present(controller, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 277.5)
    }
    
    
}


