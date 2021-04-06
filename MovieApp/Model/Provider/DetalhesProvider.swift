//
//  DetalhesProvider.swift
//  MovieApp
//
//  Created by Matheus Golke Cardoso on 05/04/21.
//  Copyright © 2021 Matheus. All rights reserved.
//

import Foundation

class DetalhesProvider{
    
    func getDataDetalhes(idFilme:Int, completion:@escaping(DetalhesFilmes)-> Void){
        
        //var resultadosDetalhes:[DetalhesFilmes] = []
        
        let urlDetalhes = "https://api.themoviedb.org/3/movie/\(idFilme)?api_key=92f48df587a0b620ed4b4a7ecc9b9159&language=pt-BR"
        guard let finalUrlDetalhes = URL(string: urlDetalhes) else {return}
        
        
        let taskDetalhes = URLSession.shared.dataTask(with: finalUrlDetalhes) { (data, response, error) in
            guard let data = data, error == nil else {return}
            
            do{
                let todosOsDetalhes = try JSONDecoder().decode(DetalhesFilmes.self, from: data)
                completion(todosOsDetalhes)
            }catch{
                print(error.localizedDescription)
            }
        }
        taskDetalhes.resume()
    }
    
}
