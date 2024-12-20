//
//  TrailerView.swift
//  Movies
//
//  Created by Almaz  on 20.12.2024.
//

import Foundation
import UIKit

final class TrailerView: UIView {
    
    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = true
        return scrollView
    }()
    
    private var trailerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var trailerAndTeaserLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.text = "Трейлер и тизер"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var watchAllButton: UIButton = {
        let button = UIButton()
        button.setTitle("Смотреть все", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var trailerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "squidGame_img")
        imageView.translatesAutoresizingMaskIntoConstraints = false
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
        
        addSubview(trailerAndTeaserLabel)
        addSubview(watchAllButton)
        contentView.addSubview(trailerImageView)
        contentView.addSubview(trailerLabel)
        contentView.addSubview(trailerDateLabel)
        addSubview(contentView)
        trailerStackView.addArrangedSubview(contentView)
        scrollView.addSubview(trailerStackView)
        addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            trailerAndTeaserLabel.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            trailerAndTeaserLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
        ])
        
        NSLayoutConstraint.activate([
            watchAllButton.topAnchor.constraint(equalTo: topAnchor),
            watchAllButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: trailerAndTeaserLabel.bottomAnchor, constant: 18),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            trailerImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            trailerImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            trailerImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            trailerLabel.topAnchor.constraint(equalTo: trailerImageView.bottomAnchor, constant: 8),
            trailerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            trailerDateLabel.topAnchor.constraint(equalTo: trailerLabel.bottomAnchor, constant: 2),
            trailerDateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])

    }
    
    
    
}
