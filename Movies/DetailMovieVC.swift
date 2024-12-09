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
    
    private var castParentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 14
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
        
    
    private var castStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var actorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = imageView.frame.size.width/2
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "actor_leo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var actorNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        label.text = "Леонардо Ди Каприо"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
    }
    
    
    func setupUI() {
        view.addSubview(movieImage)
        view.addSubview(movieNameLabel)
        view.addSubview(movieDescriptionLabel)
        containerView.addSubview(movieGenreLabel)
        view.addSubview(containerView)
        view.addSubview(castLabel)
        castStackView.addArrangedSubview(actorImageView)
        castStackView.addArrangedSubview(actorNameLabel)
        view.addSubview(castStackView)
        castParentStackView.addArrangedSubview(castStackView)
        view.addSubview(castParentStackView)
        
        
        
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
            castStackView.topAnchor.constraint(equalTo: castLabel.bottomAnchor, constant: 12),
            castStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 17),
            castStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -17),
            castStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -175)
        ])
        
//        NSLayoutConstraint.activate([
//            actorImageView.widthAnchor.constraint(equalToConstant: 80),
//            actorImageView.heightAnchor.constraint(equalToConstant: 80),
//        ])
        
        NSLayoutConstraint.activate([
            actorNameLabel.topAnchor.constraint(equalTo: actorImageView.bottomAnchor, constant: 8),
//            actorNameLabel.leadingAnchor.constraint(equalTo: castStackView.leadingAnchor, constant: 8),
//            actorNameLabel.trailingAnchor.constraint(equalTo: castStackView.trailingAnchor, constant: -8),
            actorNameLabel.bottomAnchor.constraint(equalTo: castStackView.bottomAnchor, constant: 8)
        ])
        
        
            
    }
    
    
}
