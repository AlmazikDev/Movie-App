//
//  DetailMovieVC.swift
//  Movies
//
//  Created by Almaz  on 01.12.2024.
//

import Foundation
import UIKit


class DetailMovieVC: UIViewController {
    
    var movieImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    } ()
    
    private var movieNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 36, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var movieDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        return view
    } ()
    
    private var movieGenreLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var castLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textAlignment = .left
        label.text = "Состав"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var castScrollView: UIScrollView = {
        let view = UIScrollView()
        view.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    private var castParentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 14
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var filmingGroupLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textAlignment = .left
        label.text = "Сьемочная группа"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var filmingGroupScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = true
//        scrollView.backgroundColor = .systemBlue
        return scrollView
    }()
    
    private var FilmingGroupStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 14
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = .systemBackground
        setupUI()
        
    }
    
     func setupMovie(movie: MovieCellModel) {
        movieImage.image = UIImage(named: movie.movieImage)
        movieNameLabel.text = movie.movieName
        movieDescriptionLabel.text = movie.movieDescription
        movieGenreLabel.text = movie.movieGenre
        for actor in movie.actors {
            let actorView = CastActorView()
            actorView.configure(model: actor)
            castParentStackView.addArrangedSubview(actorView)
        }
         
        for producer in movie.producers {
            let producerView = FilmingGroupView()
            producerView.configure(producer: producer)
            FilmingGroupStackView.addArrangedSubview(producerView)
         }
    }
    
    
    func setupUI() {
        view.addSubview(movieImage)
        view.addSubview(movieNameLabel)
        view.addSubview(movieDescriptionLabel)
        containerView.addSubview(movieGenreLabel)
        view.addSubview(containerView)
        view.addSubview(castLabel)
        view.addSubview(castScrollView)
        castScrollView.addSubview(castParentStackView)
        view.addSubview(filmingGroupLabel)
        view.addSubview(filmingGroupScrollView)
//        filmingGroupScrollView.addSubview(FilmingGroupContentView)
        view.addSubview(filmingGroupScrollView)
        filmingGroupScrollView.addSubview(FilmingGroupStackView)
        

        
        
        NSLayoutConstraint.activate([
            movieImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            movieImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            movieImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            movieImage.heightAnchor.constraint(equalToConstant: 260)
        ])
        
        NSLayoutConstraint.activate([
            movieNameLabel.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 16),
            movieNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            movieNameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            movieDescriptionLabel.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: 8),
            movieDescriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            movieDescriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: movieDescriptionLabel.bottomAnchor, constant: 8),
            containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            /*containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -309)*/
            //            containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -280)
        ])
        
        NSLayoutConstraint.activate([
            movieGenreLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 4),
            movieGenreLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 9),
            movieGenreLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -9),
            movieGenreLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -4),
        ])
        
        NSLayoutConstraint.activate([
            castLabel.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 17),
            castLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            castLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            castScrollView.topAnchor.constraint(equalTo: castLabel.bottomAnchor, constant: 12),
            castScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            castScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            castScrollView.heightAnchor.constraint(equalToConstant: 160)
        ])
        
        let widthConstraint = NSLayoutConstraint(item: castParentStackView, attribute: .width, relatedBy: .equal,
                                                 toItem: castScrollView, attribute: .width, multiplier: 1, constant: 1)
        widthConstraint.priority = .defaultLow
        NSLayoutConstraint.activate([
            castParentStackView.topAnchor.constraint(equalTo: castScrollView.topAnchor),
            castParentStackView.leadingAnchor.constraint(equalTo: castScrollView.leadingAnchor),
            castParentStackView.trailingAnchor.constraint(equalTo: castScrollView.trailingAnchor),
            castParentStackView.bottomAnchor.constraint(equalTo: castScrollView.bottomAnchor),
            castParentStackView.heightAnchor.constraint(equalTo: castScrollView.heightAnchor),
            widthConstraint,
        ])
        
        NSLayoutConstraint.activate([
            filmingGroupLabel.topAnchor.constraint(equalTo: castParentStackView.bottomAnchor, constant: 12),
            filmingGroupLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            filmingGroupLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
        
        NSLayoutConstraint.activate([
            filmingGroupScrollView.topAnchor.constraint(equalTo: filmingGroupLabel.bottomAnchor, constant: 12),
            filmingGroupScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            filmingGroupScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            filmingGroupScrollView.heightAnchor.constraint(equalToConstant: 220)
        ])
        
        let widthConstraintgGroupScrollView = NSLayoutConstraint(item: FilmingGroupStackView, attribute: .width, relatedBy: .equal, toItem: filmingGroupScrollView, attribute: .width, multiplier: 1, constant: 1)
        
        widthConstraintgGroupScrollView.priority = .defaultLow
        NSLayoutConstraint.activate([
            FilmingGroupStackView.topAnchor.constraint(equalTo: filmingGroupScrollView.topAnchor),
            FilmingGroupStackView.leadingAnchor.constraint(equalTo: filmingGroupScrollView.leadingAnchor, constant: 15),
            FilmingGroupStackView.trailingAnchor.constraint(equalTo: filmingGroupScrollView.trailingAnchor),
            FilmingGroupStackView.bottomAnchor.constraint(equalTo: filmingGroupScrollView.bottomAnchor),
            FilmingGroupStackView.heightAnchor.constraint(equalTo: filmingGroupScrollView.heightAnchor),
            widthConstraintgGroupScrollView
        ])
    }
}
