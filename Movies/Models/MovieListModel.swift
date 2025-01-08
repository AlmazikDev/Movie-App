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


struct GenreCellModel: Hashable {
    
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

struct ProducerModel {
    var producerImage: String
    var producerName: String
    var producerPosition: String
    var producerMovies: String
    
    init(producerImage: String, producerName: String, producerPosition: String, producerMovies: String) {
        self.producerImage = producerImage
        self.producerName = producerName
        self.producerPosition = producerPosition
        self.producerMovies = producerMovies
    }
}


struct TrailerModel {
    var trailerImage: String
    var trailerName: String
    var trailerDate: String
    
    init(trailerImage: String, trailerName: String, trailerDate: String) {
        self.trailerImage = trailerImage
        self.trailerName = trailerName
        self.trailerDate = trailerDate
    }
}



class MovieCellModel {
    var movieImage: String
    var movieName: String
    var movieGenre: String
    var movieDescription: String
    var actors: [ActorModel]
    var producers: [ProducerModel]
    var trailers: [TrailerModel]

    
    init(movieImage: String, movieName: String, movieGenre: String, movieDescription: String, actors: [ActorModel], producers: [ProducerModel], trailers: [TrailerModel]) {
        self.movieImage = movieImage
        self.movieName = movieName
        self.movieGenre = movieGenre
        self.movieDescription = movieDescription
        self.actors = actors
        self.producers = producers
        self.trailers = trailers
    }
}
