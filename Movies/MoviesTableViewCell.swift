//
//  MoviesTableViewCell.swift
//  Movies
//
//  Created by Almaz  on 22.11.2024.
//

import UIKit

class MoviesTableViewCell: UITableViewCell {
    
    
    private var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        view.layer.cornerRadius = 25
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    } ()
    
    private var movieName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var genreName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private var movieDescription: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(movie: MovieCellModel) {
        movieName.text = movie.movieName
        genreName.text = movie.movieGenre
        movieDescription.text = movie.movieDescription
    }
    
    func setupUI() {
        contentView.addSubview(containerView)
        contentView.addSubview(movieName)
        contentView.addSubview(genreName)
        contentView.addSubview(movieDescription)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            movieName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            movieName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            
        ])
        
        NSLayoutConstraint.activate([
            genreName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
            genreName.leadingAnchor.constraint(equalTo: movieName.trailingAnchor, constant: 30),
            genreName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            
        ])
        
        NSLayoutConstraint.activate([
            movieDescription.topAnchor.constraint(equalTo: movieName.bottomAnchor, constant: 10),
            movieDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            movieDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            movieDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        
        
    }
    
}
