//
//  FilmingGroupView.swift
//  Movies
//
//  Created by Almaz  on 13.12.2024.
//

import UIKit

class FilmingGroupView: UIView {
    
    private var filmingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var filmingNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var filmingPositionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .regular)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var filmingMoviesLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    init() {
        super.init(frame: .zero)
        setupViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemGray6
        
        addSubview(filmingImageView)
        addSubview(filmingNameLabel)
        addSubview(filmingPositionLabel)
        addSubview(filmingMoviesLabel)
            
        
        NSLayoutConstraint.activate([
            filmingImageView.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            filmingImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            filmingImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -180),
            filmingImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -115),
            filmingImageView.widthAnchor.constraint(equalToConstant: 50),
//            filmingImageView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            filmingNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            filmingNameLabel.leadingAnchor.constraint(equalTo: filmingImageView.trailingAnchor, constant: 10),
            filmingNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            filmingNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -160),
            filmingNameLabel.heightAnchor.constraint(equalToConstant: 15)
        ])
        
        NSLayoutConstraint.activate([
            filmingPositionLabel.topAnchor.constraint(equalTo: filmingNameLabel.bottomAnchor),
            filmingPositionLabel.leadingAnchor.constraint(equalTo: filmingImageView.trailingAnchor, constant: 10),
            filmingPositionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            filmingPositionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -140),
            filmingPositionLabel.heightAnchor.constraint(equalToConstant: 8)
        ])
        
        NSLayoutConstraint.activate([
            filmingMoviesLabel.topAnchor.constraint(equalTo: filmingPositionLabel.bottomAnchor),
            filmingMoviesLabel.leadingAnchor.constraint(equalTo: filmingImageView.trailingAnchor, constant: 10),
            filmingMoviesLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            filmingMoviesLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -95),
//            filmingMoviesLabel.widthAnchor.constraint(equalToConstant: 200),
//            filmingMoviesLabel.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    func configure(producer: ProducerModel) {
        filmingImageView.image = UIImage(named: producer.producerImage)
        filmingNameLabel.text = producer.producerName
        filmingPositionLabel.text = producer.producerPosition
        filmingMoviesLabel.text = producer.producerMovies
        print(producer)
    }
    
}



