//
//  MoviesTableViewCell.swift
//  Movies
//
//  Created by Almaz  on 22.11.2024.
//

import UIKit

class MoviesTableViewCell: UITableViewCell {
    
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
        contentView.addSubview(movieName)
        contentView.addSubview(genreName)
        contentView.addSubview(movieDescription)
        
        NSLayoutConstraint.activate([
            movieName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            movieName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
        ])
        
        NSLayoutConstraint.activate([
            genreName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            genreName.leadingAnchor.constraint(equalTo: movieName.trailingAnchor, constant: 16),
            genreName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
        ])
        
        NSLayoutConstraint.activate([
            movieDescription.topAnchor.constraint(equalTo: movieName.bottomAnchor, constant: 10),
            movieDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            movieDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            movieDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        
        
    }
    
}
