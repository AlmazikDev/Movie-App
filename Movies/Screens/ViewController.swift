//
//  ViewController.swift
//  Movies
//
//  Created by Nurzhan Duisembayev on 24.10.2024.
//

import UIKit

final class ViewController: UIViewController {
    var cells: [CellType] {
        var cells = [CellType]()
        cells.append(.genres(allGenres))
        
        let currentMovieCells = currentMovies.map {
            CellType.movie($0)
        }
        cells.append(contentsOf: currentMovieCells)
        return cells
    }
    
    var currentMovies = [MovieCellModel]()
    var allMovies = [MovieCellModel]()
    var allGenres = [GenreCellModel]()
    
    private var selectedGenreValue: GenreCellModel? {
        didSet {
            filterMovies()
        }
    }
    
    private var searchingValue: String? {
        didSet {
            filterMovies()
        }
    }

    private let searchController: UISearchController = UISearchController(searchResultsController: nil)

    var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = UIColor.systemBackground
        table.separatorStyle = .none
        table.tableFooterView = UIView()
        table.register(GenresTableViewCell.self, forCellReuseIdentifier: "genresCell")
        table.register(MoviesTableViewCell.self, forCellReuseIdentifier: "movieCell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Фильмы"
        
        tableView.delegate = self
        tableView.dataSource = self
        setupTableView()
        setupSearchController()
                
        allGenres = [GenreCellModel(name: "Драма"),
                     GenreCellModel(name: "Триллер"),
                     GenreCellModel(name: "Комедия"),
                     GenreCellModel(name: "Спорт")]
        allMovies = [
            MovieCellModel(movieImage: "inception_img",
                           movieName: "Начало",
                           movieGenre: "Драма",
                           movieDescription: "Группа специалистов проникает в сознание людей через сны, чтобы украсть или внедрить идеи.",
                           actors: [
                            ActorModel(actorImage: "actor_leo", actorName: "Леонардо Ди Каприо"),
                            ActorModel(actorImage: "actor_murphy", actorName: "Килиан Мерфи"),
                            ActorModel(actorImage: "actor_hardy", actorName: "Том Харди"),
                            ActorModel(actorImage: "actor_kane", actorName: "Майкл Кейн")
                           ], producers: [
                            ProducerModel(producerImage: "producer_nolan", producerName: "Кристофер Нолан", producerPosition: "Режиссёр", producerMovies: "Интерстеллар, Оппенгеймер, Престиж, Темный Рыцарь ,Бэтмэн, Довод"),
                            ProducerModel(producerImage: "producer_emma", producerName: "Эмма Томас", producerPosition: "Режиссёр", producerMovies: "Интерстеллар, Оппенгеймер, Престиж, Темный Рыцарь ,Бэтмэн, Довод")
                           ], trailers: [TrailerModel(trailerImage: "inception_img", trailerName: "Трейлер", trailerDate: "26 июля 2024"),
                                         TrailerModel(trailerImage: "inception_img", trailerName: "Трейлер", trailerDate: "26 июля 2024")]),
            MovieCellModel(movieImage: "inception_img",
                           movieName: "1+1",
                           movieGenre: "Спорт",
                           movieDescription: "Группа специалистов проникает в сознание людей через сны, чтобы украсть или внедрить идеи.",
                           actors: [
                            ActorModel(actorImage: "actor_leo", actorName: "Леонардо Ди Каприо"),
                            ActorModel(actorImage: "actor_murphy", actorName: "Килиан Мерфи"),
                            ActorModel(actorImage: "actor_hardy", actorName: "Том Харди"),
                            ActorModel(actorImage: "actor_kane", actorName: "Майкл Кейн")
                           ], producers: [
                            ProducerModel(producerImage: "producer_nolan", producerName: "Кристофер Нолан", producerPosition: "Режиссёр", producerMovies: "Интерстеллар, Оппенгеймер, Престиж, Темный Рыцарь ,Бэтмэн, Довод"),
                            ProducerModel(producerImage: "producer_emma", producerName: "Эмма Томас", producerPosition: "Режиссёр", producerMovies: "Интерстеллар, Оппенгеймер, Престиж, Темный Рыцарь ,Бэтмэн, Довод")
                           ], trailers: [TrailerModel(trailerImage: "inception_img", trailerName: "Трейлер", trailerDate: "26 июля 2024"),
                                         TrailerModel(trailerImage: "inception_img", trailerName: "Трейлер", trailerDate: "26 июля 2024")]),
            
            MovieCellModel(movieImage: "inception_img",
                           movieName: "Как приучить дракона",
                           movieGenre: "Комедия",
                           movieDescription: "Группа специалистов проникает в сознание людей через сны, чтобы украсть или внедрить идеи.",
                           actors: [
                            ActorModel(actorImage: "actor_leo", actorName: "Леонардо Ди Каприо"),
                            ActorModel(actorImage: "actor_murphy", actorName: "Килиан Мерфи"),
                            ActorModel(actorImage: "actor_hardy", actorName: "Том Харди"),
                            ActorModel(actorImage: "actor_kane", actorName: "Майкл Кейн")
                           ], producers: [
                            ProducerModel(producerImage: "producer_nolan", producerName: "Кристофер Нолан", producerPosition: "Режиссёр", producerMovies: "Интерстеллар, Оппенгеймер, Престиж, Темный Рыцарь ,Бэтмэн, Довод"),
                            ProducerModel(producerImage: "producer_emma", producerName: "Эмма Томас", producerPosition: "Режиссёр", producerMovies: "Интерстеллар, Оппенгеймер, Престиж, Темный Рыцарь ,Бэтмэн, Довод")
                           ], trailers: [TrailerModel(trailerImage: "inception_img", trailerName: "Трейлер", trailerDate: "26 июля 2024"),
                                         TrailerModel(trailerImage: "inception_img", trailerName: "Трейлер", trailerDate: "26 июля 2024")]),
            MovieCellModel(movieImage: "squidGame_img",
                           movieName: "Игра в Кальмара",
                           movieGenre: "Триллер",
                           movieDescription: "Сериал повествует о группе людей, которые из-за нужды в деньгах принимают приглашение на участие в тайном турнире на выживание с финальным призом в размере 45,6 млрд вон (38,5 млн долларов США)",
                           actors: [
                            
                            ActorModel(actorImage: "actor_lee", actorName: "Ли Джонджэ"),
                            ActorModel(actorImage: "actor_choe", actorName: "Чон Хоен"),
                            ActorModel(actorImage: "actor_gong", actorName: "Гон Ю"),
                            ActorModel(actorImage: "actor_anupam", actorName: "Анупам Трипати"),
                            ActorModel(actorImage: "actor_byung", actorName: "Ли Бен Хон"),
                            ActorModel(actorImage: "actor_wi", actorName: "Ви Ха Джун"),
                            
                           ], producers: [ProducerModel(producerImage: "producer_hwang", producerName: "Хван Дон Хен", producerPosition: "Режиссёр", producerMovies: "Игра в Кальмара, Ограбление Склепа, Мисс Бабуля, Суровое испытание ,Чудесная дорога, Отчаяние"),
                                          ProducerModel(producerImage: "producer_kim", producerName: "Ким Джи Ен", producerPosition: "Режиссёр", producerMovies: " Игра в Кальмара, Ограбление Склепа, Мисс Бабуля, Суровое испытание ,Чудесная дорога, Отчаяние")],
                           trailers: [TrailerModel(trailerImage: "squidGame_img", trailerName: "Трейлер", trailerDate: "26 июля 2024"),
                                      TrailerModel(trailerImage: "squidGame_img", trailerName: "Трейлер", trailerDate: "26 июля 2024")])
            
            
        ]

        filterMovies()
        tableView.reloadData()
    }

    private func setupTableView() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "Введите название фильма..."
        
        navigationItem.searchController = searchController
        definesPresentationContext = false
        navigationItem.hidesSearchBarWhenScrolling = false
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = cells[indexPath.row]
        switch cellModel {
        case .genres(let genresModel):
            let cell: GenresTableViewCell = tableView.dequeueReusableCell(withIdentifier: "genresCell",
                                                                          for: indexPath) as! GenresTableViewCell
            cell.delegate = self
            cell.setup(genres: genresModel)
            return cell
        case .movie(let movieModel):
            let cell: MoviesTableViewCell = tableView.dequeueReusableCell(withIdentifier: "movieCell",
                                                                          for: indexPath) as! MoviesTableViewCell
            cell.setup(movie: movieModel)
           
            return cell
        }
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cellModel = cells[indexPath.row]
        switch cellModel {
        case .genres:
            break
        case .movie(let movieModel):
            let detailViewController = DetailMovieVC()
            detailViewController.setupMovie(movie: movieModel)
            navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}

extension ViewController: GenresTableViewCellDelegate {
    func filterMovies(by genre: GenreCellModel?) {
        selectedGenreValue = genre
    }
}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        searchingValue = searchController.searchBar.text
    }
}

private extension ViewController {
    func filterMovies() {
        currentMovies = allMovies
        if let selectedGenreValue {
            currentMovies = currentMovies.filter { $0.movieGenre == selectedGenreValue.name }
        }
        
        if let searchingValue, !searchingValue.isEmpty {
            currentMovies = currentMovies.filter { $0.movieName.contains(searchingValue) }
        }
        
        tableView.reloadData()
    }
}

