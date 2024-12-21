//
//  TrailerView.swift
//  Movies
//
//  Created by Almaz  on 20.12.2024.
//

import Foundation
import UIKit

final class TrailerView: UIView {
    
    
    private var trailerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"squidGame_img")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private var trailerLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.text = "Трейлер"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var trailerDateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .light)
        label.text = "26 июля 2024"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }() 
    
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupUI() {
        translatesAutoresizingMaskIntoConstraints = false
        

        addSubview(trailerImageView)
        addSubview(trailerLabel)
        addSubview(trailerDateLabel)
        

        NSLayoutConstraint.activate([
            trailerImageView.topAnchor.constraint(equalTo: topAnchor),
            trailerImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            trailerImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            trailerImageView.widthAnchor.constraint(equalToConstant: 227),
            trailerImageView.heightAnchor.constraint(equalToConstant: 92)
        ])
        
        NSLayoutConstraint.activate([
            trailerLabel.topAnchor.constraint(equalTo: trailerImageView.bottomAnchor, constant: 8),
            trailerLabel.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            trailerDateLabel.topAnchor.constraint(equalTo: trailerLabel.bottomAnchor, constant: 2),
            trailerDateLabel.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
        


    }
    
    func configure(trailer: TrailerModel) {
        trailerImageView.image = UIImage(named: trailer.trailerImage)
        trailerLabel.text = trailer.trailerName
        trailerDateLabel.text = trailer.trailerDate
    }
    
    
    
}
