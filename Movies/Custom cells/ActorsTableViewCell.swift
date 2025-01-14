//
//  ActorsTableViewCell.swift
//  Movies
//
//  Created by Almaz  on 13.01.2025.
//

import UIKit

class ActorsTableViewCell: UITableViewCell {
    
    private var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        return view
    }()
    
    private var actorImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "actor_choe")
        return imageView
    }()
    
    private  var actorNameFirstType: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.text = "Чон Хоен"
        return label
    }()
    
    private var actorNameSecondType: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.text = "Chon Hoen"
        return label
    }()
    
    private var dateOfBirth: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.numberOfLines = 0
        label.textColor = .systemGray
        label.textAlignment = .left
        label.text = "25 сентября 1968 * 58 лет"
        return label
    }()
    
    private var nickname: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.numberOfLines = 0
        label.textColor = .systemGray
        label.textAlignment = .left
        label.text = "Kan Saebook"
        return label
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCastUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCastUI() {
        contentView.addSubview(containerView)
        containerView.addSubview(actorImage)
        containerView.addSubview(actorNameFirstType)
        containerView.addSubview(actorNameSecondType)
        containerView.addSubview(dateOfBirth)
        containerView.addSubview(nickname)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            actorImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            actorImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            actorImage.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
            actorImage.widthAnchor.constraint(equalToConstant: 90),
            actorImage.heightAnchor.constraint(equalToConstant: 120)
            
        ])
        
        NSLayoutConstraint.activate([
            actorNameFirstType.topAnchor.constraint(equalTo: actorImage.topAnchor, constant: 6),
            actorNameFirstType.leadingAnchor.constraint(equalTo: actorImage.trailingAnchor, constant: 12),
            actorNameFirstType.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12)
        ])
        
        NSLayoutConstraint.activate([
            actorNameSecondType.topAnchor.constraint(equalTo: actorNameFirstType.bottomAnchor, constant: 5),
            actorNameSecondType.leadingAnchor.constraint(equalTo: actorImage.trailingAnchor, constant: 12),
            actorNameSecondType.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12)
        ])
        
        NSLayoutConstraint.activate([
            dateOfBirth.topAnchor.constraint(equalTo: actorNameSecondType.bottomAnchor, constant: 12),
            dateOfBirth.leadingAnchor.constraint(equalTo: actorImage.trailingAnchor, constant: 12),
            dateOfBirth.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12)
        ])
        
        NSLayoutConstraint.activate([
            nickname.leadingAnchor.constraint(equalTo: actorImage.trailingAnchor, constant: 12),
            nickname.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12),
            nickname.bottomAnchor.constraint(equalTo: actorImage.bottomAnchor, constant: -4)
        ])
        
    }
    
    func configureActor(actor: ActorModel) {
        actorImage.image = UIImage(named: actor.actorImage)
        actorNameFirstType.text = actor.actorName
        actorNameSecondType.text = actor.secondName
        dateOfBirth.text = actor.dateOfBirthAndAge
        nickname.text = actor.nickname
    }
    
    
}
