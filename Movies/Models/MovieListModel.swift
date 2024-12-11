//
//  MovieListModel.swift
//  Movies
//
//  Created by Nurzhan Duisembayev on 24.10.2024.
//

import Foundation

enum CellType {
    case genres([GenreCellModel])
    case movie(MovieCellModel)
    
}


class GenreCellModel {
    
    var name: String
    var selected = false
    
    init(name: String) {  // what does line mean?
        
        self.name = name
    }
    
}

struct ActorModel {
    
    var actorImage: String
    var actorName: String
    
    init(actorImage: String, actorName: String) {
        self.actorImage = actorImage
        self.actorName = actorName
    }
    
}



class MovieCellModel {
    var movieImage: String
    var movieName: String
    var movieGenre: String
    var movieDescription: String
    var actors: [ActorModel]

    
    init(movieImage: String, movieName: String, movieGenre: String, movieDescription: String, actors: [ActorModel]) {
        self.movieImage = movieImage
        self.movieName = movieName
        self.movieGenre = movieGenre
        self.movieDescription = movieDescription
        self.actors = actors
       
    }
}
