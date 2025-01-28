//
//  WatchedVC.swift
//  Movies
//
//  Created by Almaz  on 27.01.2025.
//

import UIKit

class WatchedVC: UIViewController {
    
    let allMovies: [MovieCellModel] = [ MovieCellModel(movieImage: "inception_img",
                                                       movieName: "Как приучить дракона",
                                                       movieGenre: "Комедия",
                                                       movieDescription: "Группа специалистов проникает в сознание людей через сны, чтобы украсть или внедрить идеи.",
                                                       actors: [
                                                        ActorModel(actorImage: "actor_leo", actorName: "Леонардо Ди Каприо"),
                                                        ActorModel(actorImage: "actor_murphy", actorName: "Килиан Мерфи"),
                                                        ActorModel(actorImage: "actor_hardy", actorName: "Том Харди"),
                                                        ActorModel(actorImage: "actor_kane", actorName: "Майкл Кейн")
                                                       ],
                                                       producers: [
                                                        ProducerModel(producerImage: "producer_nolan",
                                                                      producerName: "Кристофер Нолан",
                                                                      producerPosition: "Режиссёр",
                                                                      producerMovies: "Интерстеллар, Оппенгеймер, Престиж, Темный Рыцарь ,Бэтмэн, Довод"),
                                                        ProducerModel(producerImage: "producer_emma",
                                                                      producerName: "Эмма Томас",
                                                                      producerPosition: "Режиссёр",
                                                                      producerMovies: "Интерстеллар, Оппенгеймер, Престиж, Темный Рыцарь ,Бэтмэн, Довод")
                                                       ],
                                                       trailers: [TrailerModel(trailerImage: "inception_img",
                                                                                  trailerName: "Трейлер",
                                                                                  trailerDate: "26 июля 2024"),
                                                                     TrailerModel(trailerImage: "inception_img",
                                                                                  trailerName: "Трейлер",
                                                                                  trailerDate: "26 июля 2024")],
                                                       reviews: [ReviewModel(avatarImage: "actor_leo",
                                                                             reviewerName: "Leonardo",
                                                                             dateOfReview: "15 сентября 2024",
                                                                             titleOfReview: "Test",
                                                                             contentOfReview: "This is review of movie")]),
                                        MovieCellModel(movieImage: "squidGame_img",
                                                       movieName: "Игра в Кальмара",
                                                       movieGenre: "Триллер",
                                                       movieDescription: "Сериал повествует о группе людей, которые из-за нужды в деньгах принимают приглашение на участие в тайном турнире на выживание с финальным призом в размере 45,6 млрд вон (38,5 млн долларов США)",
                                                       actors: [
                                                        
                                                        ActorModel(actorImage: "actor_lee", actorName: "Ли Джонджэ",
                                                                   secondName: "Lee Jeong-jae",
                                                                   dateOfBirthAndAge: "15 декабрь 1972  •  52 лет",
                                                                   nickname: "Seong Gi-hoon, 456"),
                                                        ActorModel(actorImage: "actor_choe", actorName: "Чон Хоен",
                                                                   secondName: "Jeong Ho-yeon",
                                                                   dateOfBirthAndAge: "23 июнь 1994  •  30 лет",
                                                                   nickname: "Kang Sae-byeok, 067"),
                                                        ActorModel(actorImage: "actor_gong",
                                                                   actorName: "Гон Ю",
                                                                   secondName: "Gong Yoo",
                                                                   dateOfBirthAndAge: "10 июль 1979  •  45 лет",
                                                                   nickname: "Suit man"),
                                                        ActorModel(actorImage: "actor_anupam",
                                                                   actorName: "Анупам Трипати",
                                                                   secondName: "Anupam Tripathi",
                                                                   dateOfBirthAndAge: "2 ноября 1988  •  30 лет",
                                                                   nickname: "Ali Abdul, 199"),
                                                        ActorModel(actorImage: "actor_byung",
                                                                   actorName: "Ли Бен Хон",
                                                                   secondName: "Lee Byung-hun",
                                                                   dateOfBirthAndAge: "12 июль 1970  •  54 лет",
                                                                   nickname: "Frontman Hwang In-ho"),
                                                        ActorModel(actorImage: "actor_wi",
                                                                   actorName: "Ви Ха Джун",
                                                                   secondName: "Wi Ha-joon",
                                                                   dateOfBirthAndAge: "5 августа 1991  •  33 лет",
                                                                   nickname: "Wi Ha-joon"),
                                                        
                                                       ], producers: [
                                                        ProducerModel(producerImage: "producer_hwang",
                                                                      producerName: "Хван Дон Хен",
                                                                      producerPosition: "Режиссёр",
                                                                      producerMovies: "Игра в Кальмара, Ограбление Склепа, Мисс Бабуля, Суровое испытание ,Чудесная дорога, Отчаяние"),
                                                                      ProducerModel(producerImage: "producer_kim",
                                                                                    producerName: "Ким Джи Ен",
                                                                                    producerPosition: "Режиссёр",
                                                                                    producerMovies: " Игра в Кальмара, Ограбление Склепа, Мисс Бабуля, Суровое испытание ,Чудесная дорога, Отчаяние")],
                                                       trailers: [
                                                        TrailerModel(trailerImage: "squidGame_img",
                                                                     trailerName: "Трейлер",
                                                                     trailerDate: "26 июля 2024"),
                                                                  TrailerModel(trailerImage: "squidGame_img",
                                                                               trailerName: "Трейлер",
                                                                               trailerDate: "26 июля 2024")],
                                                       reviews: [
                                                                    ReviewModel(avatarImage: "actor_leo",
                                                                                reviewerName: "Leonardo",
                                                                                dateOfReview: "15 сентября 2024",
                                                                                titleOfReview: "This is a title of movie",
                                                                                contentOfReview: "This is review of movie")])
    ]
    
    private var table: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPurple
        navigationItem.title = "Посмотрел"
        
        table.dataSource = self
        table.register(MoviesTableViewCell.self, forCellReuseIdentifier: "movieCell")
        
        setupWatchedUI()
    }
    
    func setupWatchedUI() {
        view.addSubview(table)
        
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.topAnchor),
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
    }
    
}

extension WatchedVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allMovies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "movieCell") as! MoviesTableViewCell
        cell.setup(movie: allMovies[indexPath.row])
        
        return cell 
    }

}
