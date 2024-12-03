//
//  ViewController.swift
//  Movies
//
//  Created by Nurzhan Duisembayev on 24.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private var cells = [CellType]()
    
    private var selectedGenreValue: GenreCellModel?
    
    private var movies: [MovieCellModel] = []
    
    
    var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = UIColor.secondarySystemBackground
        table.separatorStyle = .none
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
        
        cells = [
            .genres([GenreCellModel(name: "Драма"), GenreCellModel(name: "Триллер")]),
            .movie(MovieCellModel(movieName: "Начало",
                                  movieGenre: "Драма",
                                  movieDescription: "Группа специалистов проникает в сознание людей через сны, чтобы украсть или внедрить идеи.")),
            .movie(MovieCellModel(movieName: "Игра в Кальмара",
                                  movieGenre: "Триллер",
                                  movieDescription: "Сериал повествует о группе людей, которые из-за нужды в деньгах принимают приглашение на участие в тайном турнире на выживание с финальным призом в размере 45,6 млрд вон (38,5 млн долларов США)"))
        ]
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
            movies.append(movieModel)
           
            return cell
        }
        
    }
    

}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath.row)
        print(movies)
        
        let detailViewController = DetailMovieVC()
        
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    
}

extension ViewController: GenresTableViewCellDelegate {
    func filterMovies(by genre: GenreCellModel) {
        selectedGenreValue = genre
        print(selectedGenreValue)
    }
}
