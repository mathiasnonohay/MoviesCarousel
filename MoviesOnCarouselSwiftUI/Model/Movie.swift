//
//  Movie.swift
//  MoviesOnCarouselSwiftUI
//
//  Created by Mathias Nonohay on 20/10/2023.
//

import SwiftUI

struct Movie: Identifiable, Equatable {
    var id = UUID().uuidString
    var moviewTitle: String
    var artWork: String
}

var movies: [Movie] = [
    Movie(moviewTitle: "Ad Astra", artWork: "adastra"),
    Movie(moviewTitle: "Star Wars", artWork: "starwars"),
    Movie(moviewTitle: "Toy Story", artWork: "toystory"),
    Movie(moviewTitle: "Thor Love & Thunder", artWork: "thor"),
    Movie(moviewTitle: "Spider Man No Way Home", artWork: "spiderman"),
    Movie(moviewTitle: "Shang Chi", artWork: "shangchi"),
    Movie(moviewTitle: "Hawkeye", artWork: "hawkeye")
    
]

