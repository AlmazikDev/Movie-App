//
//  CastActorView.swift
//  Movies
//
//  Created by Nurzhan Duisembayev on 11.12.2024.
//

import UIKit

final class CastActorView: UIView {
    private var actorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var actorNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var castStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        castStackView.addArrangedSubview(actorImageView)
        castStackView.addArrangedSubview(actorNameLabel)
        addSubview(castStackView)
        
        NSLayoutConstraint.activate([
            castStackView.topAnchor.constraint(equalTo: topAnchor),
            castStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            castStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            castStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            castStackView.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            actorImageView.widthAnchor.constraint(equalToConstant: 100),
            actorImageView.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    func configure(model: ActorModel) {
        actorImageView.image = UIImage(named: model.actorImage)
        actorNameLabel.text = model.actorName
    }
}
