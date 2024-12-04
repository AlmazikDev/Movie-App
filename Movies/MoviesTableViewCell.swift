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
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private var movieDescription: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
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
        containerView.addSubview(movieName)
        containerView.addSubview(genreName)
        containerView.addSubview(movieDescription)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 7),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            movieName.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            movieName.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
        ])
        
        NSLayoutConstraint.activate([
            genreName.centerYAnchor.constraint(equalTo: movieName.centerYAnchor),
            genreName.leadingAnchor.constraint(equalTo: movieName.trailingAnchor, constant: 8),
            genreName.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
        ])
        
        NSLayoutConstraint.activate([
            movieDescription.topAnchor.constraint(equalTo: movieName.bottomAnchor, constant: 4),
            movieDescription.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 18),
            movieDescription.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -18),
            movieDescription.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -18)
        ])
        
        
    }
    
}
