//
//  MovieAppTests.swift
//  MovieAppTests
//
//  Created by Matheus Golke Cardoso on 26/03/21.
//  Copyright © 2021 Matheus. All rights reserved.
//

import XCTest
@testable import MovieApp

class MovieAppTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testDeveRetornarIdePosterPathDoFilme(){
        let filme = Filmes(posterPath: "https://image.tmdb.org/t/p/w500/v9XwEXYWpxt2rpkmFBiQ1zeyKUy.jpg", id: 791373)
        XCTAssertEqual(791373, filme.id)
        XCTAssertEqual("https://image.tmdb.org/t/p/w500/v9XwEXYWpxt2rpkmFBiQ1zeyKUy.jpg", filme.posterPath)
    }
    
    func testDeveRetornarOsAtributosDeDetalhes(){
        let detalhes = Detalhes(posterPath: "https://image.tmdb.org/t/p/w500/inNN466SKHNjbGmpfhfsaPQNleS.jpg", titulo: "Godzilla vs. Kong", rating: 7.1, overview: "Em uma época em que os monstros andam na Terra, a luta da humanidade por seu futuro coloca Godzilla e Kong em rota de colisão que verá as duas forças mais poderosas da natureza no planeta se confrontarem em uma batalha espetacular para as idades. Enquanto Monarch embarca em uma missão perigosa em terreno desconhecido e descobre pistas sobre as origens dos Titãs, uma conspiração humana ameaça tirar as criaturas, boas e más, da face da terra para sempre.")
        
        XCTAssertEqual("https://image.tmdb.org/t/p/w500/inNN466SKHNjbGmpfhfsaPQNleS.jpg", detalhes.posterPath)
        XCTAssertEqual("Godzilla vs. Kong", detalhes.titulo)
        XCTAssertEqual(7.1, detalhes.rating)
        XCTAssertEqual("Em uma época em que os monstros andam na Terra, a luta da humanidade por seu futuro coloca Godzilla e Kong em rota de colisão que verá as duas forças mais poderosas da natureza no planeta se confrontarem em uma batalha espetacular para as idades. Enquanto Monarch embarca em uma missão perigosa em terreno desconhecido e descobre pistas sobre as origens dos Titãs, uma conspiração humana ameaça tirar as criaturas, boas e más, da face da terra para sempre.", detalhes.overview)
        
    }
    

}
