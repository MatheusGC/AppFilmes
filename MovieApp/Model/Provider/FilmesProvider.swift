//
//  FilmesProvider.swift
//  MovieApp
//
//  Created by Matheus Golke Cardoso on 05/04/21.
//  Copyright © 2021 Matheus. All rights reserved.
//

import Foundation

class FilmesProvider{
    
    //var todosOsFilmes:APIMovies?
    var listaDeFilmes:[Filmes] = []
    
      //func getDataMovies()->[Result]{
    
    func getDataMovies(completion:@escaping([Result])->Void){
        
        //var results:[Result] = []
        
        let urlString = "https://api.themoviedb.org/3/trending/movie/week?api_key=92f48df587a0b620ed4b4a7ecc9b9159&language=pt-BR"
        guard let url = URL(string: urlString) else {
            print("Erro ao tentar converter string para url")
            return}
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                print("Erro ao tentar guardar os dados")
                return}
            do{
                let todosOsFilmes = try JSONDecoder().decode(APIMovies.self, from: data)
                guard let resultado = todosOsFilmes.results else {
                    print("Erro ao acessar a propriedade results")
                    return}
                completion(resultado)
            }catch{
                print(error)
            }
        }
        task.resume()
    }
    
}
