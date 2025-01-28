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

class ActorModel {
    
    var actorImage: String
    var actorName: String
    var secondName: String?
    var dateOfBirthAndAge: String?
    var nickname: String?
    
    
    init(actorImage: String, actorName: String, secondName: String? = nil, dateOfBirthAndAge: String? = nil, nickname: String? = nil) {
        self.actorImage = actorImage
        self.actorName = actorName
        self.secondName = secondName
        self.dateOfBirthAndAge = dateOfBirthAndAge
        self.nickname = nickname
    }
    
}

//class ActorCellModel: ActorModel {
//    var actorModel: ActorModel
//    var secondName: String
//    var dateOfBirthAndAge: String
//    var nickname: String
//    
//    init(actorModel: ActorModel, secondName: String, dateOfBirthAndAge: String, nickname: String) {
//        self.actorModel = actorModel
//        self.secondName = secondName
//        self.dateOfBirthAndAge = dateOfBirthAndAge
//        self.nickname = nickname
//        super.init(actorImage: actorModel.actorImage, actorName: actorModel.actorName)
//    }
//    
//}

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

struct ReviewModel {
    var avatarImage: String
    var reviewerName: String
    var dateOfReview: String
    var titleOfReview: String
    var contentOfReview: String
    
    init(avatarImage: String, reviewerName: String, dateOfReview: String, titleOfReview: String, contentOfReview: String) {
        self.avatarImage = avatarImage
        self.reviewerName = reviewerName
        self.dateOfReview = dateOfReview
        self.titleOfReview = titleOfReview
        self.contentOfReview = contentOfReview
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
    var reviews: [ReviewModel]

    
    init(movieImage: String, movieName: String, movieGenre: String, movieDescription: String, actors: [ActorModel], producers: [ProducerModel], trailers: [TrailerModel], reviews: [ReviewModel]) {
        self.movieImage = movieImage
        self.movieName = movieName
        self.movieGenre = movieGenre
        self.movieDescription = movieDescription
        self.actors = actors
        self.producers = producers
        self.trailers = trailers
        self.reviews = reviews
    }
}
