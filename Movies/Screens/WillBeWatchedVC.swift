//
//  WillBeWatchedVC.swift
//  Movies
//
//  Created by Almaz  on 27.01.2025.
//

import UIKit

class WillBeWatchedVC: UIViewController {
    
    var allMovies: [MovieCellModel] = [MovieCellModel(movieImage: "inception_img",
                                                      movieName: "Начало",
                                                      movieGenre: "Драма",
                                                      movieDescription: "Группа специалистов проникает в сознание людей через сны, чтобы украсть или внедрить идеи.",
                                                      actors: [
                                                       ActorModel(actorImage: "actor_leo", actorName: "Леонардо Ди Каприо",
                                                                  secondName: "Leonardo DiCaprio",
                                                                  dateOfBirthAndAge: "11 ноября 1977  •  50 лет",
                                                                  nickname: "Cobb"),
                                                       ActorModel(actorImage: "actor_murphy",
                                                                  actorName: "Килиан Мерфи",
                                                                  secondName: "Cillian Murphy",
                                                                  dateOfBirthAndAge: "25 мая 197,  •  48 лет",
                                                                  nickname: "Robert Fischer"),
                                                       ActorModel(actorImage: "actor_hardy",
                                                                  actorName: "Том Харди",
                                                                  secondName: "Tom Hardy",
                                                                  dateOfBirthAndAge: "15 сентября 1974  •  47 лет",
                                                                  nickname: "Eames"),
                                                       ActorModel(actorImage: "actor_kane", actorName: "Майкл Кейн",
                                                                  secondName: "Michael Caine",
                                                                  dateOfBirthAndAge: "14 марта 1933  •  91 лет",
                                                                  nickname: "Miles")
                                                      ], producers: [
                                                       ProducerModel(producerImage: "producer_nolan",
                                                                     producerName: "Кристофер Нолан",
                                                                     producerPosition: "Режиссёр",
                                                                     producerMovies: "Интерстеллар, Оппенгеймер, Престиж, Темный Рыцарь ,Бэтмэн, Довод"),
                                                       ProducerModel(producerImage: "producer_emma",
                                                                     producerName: "Эмма Томас",
                                                                     producerPosition: "Режиссёр",
                                                                     producerMovies: "Интерстеллар, Оппенгеймер, Престиж, Темный Рыцарь ,Бэтмэн, Довод")
                                                      ], trailers: [
                                                       TrailerModel(trailerImage: "inception_img",
                                                                    trailerName: "Трейлер",
                                                                    trailerDate: "26 июля 2024"),
                                                                    TrailerModel(trailerImage: "inception_img",
                                                                                 trailerName: "Трейлер",
                                                                                 trailerDate: "26 июля 2024")],
                                                      reviews: [
                                                                       ReviewModel(avatarImage: "actor_leo",
                                                                                   reviewerName: "Leonardo",
                                                                                   dateOfReview: "15 сентября 2024",
                                                                                   titleOfReview: "Должник благодарности",
                                                                                   contentOfReview: "This is review of movie This is review of movie This is review of movie This is review of movie This is review of movie This is review of movie  "),
                                                                       ReviewModel(avatarImage: "actor_leo",
                                                                                   reviewerName: "Leonardo",
                                                                                   dateOfReview: "15 сентября 2024",
                                                                                   titleOfReview: "This was awesome movie",
                                                                                   contentOfReview: "This is review of movie This is review of movie This is review of movie")]),
                                       MovieCellModel(movieImage: "1+1_img",
                                                      movieName: "1+1",
                                                      movieGenre: "Комедия",
                                                      movieDescription: "Аристократ на коляске нанимает в сиделки бывшего заключенного. Искрометная французская комедия с Омаром Си",
                                                      actors: [
                                                       ActorModel(actorImage: "actor_omar",
                                                                  actorName: "Омар Си",
                                                                  secondName: "Omar Sy",
                                                                  dateOfBirthAndAge: "20 января 1978  •  46 лет",
                                                                  nickname: "Driss"),
                                                       ActorModel(actorImage: "actor_francois",
                                                                  actorName: "Франсуа Клюзе",
                                                                  secondName: "Francois Cluzet",
                                                                  dateOfBirthAndAge: "21 сентября 1955  •  69 лет",
                                                                  nickname: "Philippe"),
                                                       ActorModel(actorImage: "actor_odri",
                                                                  actorName: "Одри Флеро",
                                                                  secondName: "Audrey Fleurot",
                                                                  dateOfBirthAndAge: "6 июль 1977  •  47 лет",
                                                                  nickname: "Magalie"),
                                                      ], producers: [
                                                       ProducerModel(producerImage: "producer_eric",
                                                                     producerName: "Эрик Толедано",
                                                                     producerPosition: "Режиссёр",
                                                                     producerMovies: "Шопоголики, Особенные, Самба, 1+1 Голливудская история"),
                                                       ProducerModel(producerImage: "producer_olivie",
                                                                     producerName: "Оливье Накаш",
                                                                     producerPosition: "Режиссёр",
                                                                     producerMovies: "Шопоголики, Особенные, Самба, 1+1 Голливудская история")
                                                      ], trailers: [TrailerModel(trailerImage: "1+1_img",
                                                                                 trailerName: "Трейлер",
                                                                                 trailerDate: "9 апреля 2012"),
                                                                    TrailerModel(trailerImage: "1+1_img",
                                                                                 trailerName: "Трейлер",
                                                                                 trailerDate: "10 сентября 2012")],
                                                      reviews: [
                                                                       ReviewModel(avatarImage: "actor_leo",
                                                                                   reviewerName: "Leonardo",
                                                                                   dateOfReview: "15 сентября 2024",
                                                                                   titleOfReview: "Well movie is good",
                                                                                   contentOfReview: "This is review of movie"),
                                                                       ReviewModel(avatarImage: "actor_leo",
                                                                                   reviewerName: "Leonardo",
                                                                                   dateOfReview: "15 сентября 2024",
                                                                                   titleOfReview: "I don't like this movie at all",
                                                                                   contentOfReview: "This is review of movie")])]
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemMint
        navigationItem.title = "Буду смотреть"
        
        tableView.dataSource = self
        tableView.register(MoviesTableViewCell.self, forCellReuseIdentifier: "movieCell")
        
        setupWillBeWatchedUI()
    }
    
    func setupWillBeWatchedUI() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }


}

extension WillBeWatchedVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell") as! MoviesTableViewCell
        cell.setup(movie: allMovies[indexPath.row])
        
        return cell 
    }
}
