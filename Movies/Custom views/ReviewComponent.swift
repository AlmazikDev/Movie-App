//
//  ReviewComponent.swift
//  Movies
//
//  Created by Almaz  on 15.01.2025.
//

import Foundation
import UIKit

class ReviewComponent: UIView {
    
    private var avatarImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "squidGame_img")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 25
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private var dateReviewLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private var reviewTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private var reviewContentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    
    
    init() {
        super.init(frame: .zero)
        setupReviewUI()
        reviewContentLabel.sizeToFit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupReviewUI() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemGray6
        
        addSubview(avatarImage)
        addSubview(nameLabel)
        addSubview(dateReviewLabel)
        addSubview(reviewTitleLabel)
        addSubview(reviewContentLabel)
        
        
        NSLayoutConstraint.activate([
            avatarImage.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            avatarImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            avatarImage.heightAnchor.constraint(equalToConstant: 50),
            avatarImage.widthAnchor.constraint(equalToConstant: 50),
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
        
        NSLayoutConstraint.activate([
            dateReviewLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            dateReviewLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 10),
            dateReviewLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
        
        NSLayoutConstraint.activate([
            reviewTitleLabel.topAnchor.constraint(equalTo: dateReviewLabel.bottomAnchor, constant: 20),
            reviewTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            reviewTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            reviewContentLabel.topAnchor.constraint(equalTo: reviewTitleLabel.bottomAnchor, constant: 5),
            reviewContentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            reviewContentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            reviewContentLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            reviewContentLabel.widthAnchor.constraint(equalToConstant: 200),
            reviewContentLabel.heightAnchor.constraint(equalToConstant: 65)
        ])
        
    }
    
    func configureReview (review: ReviewModel) {
        avatarImage.image = UIImage(named: review.avatarImage)
        nameLabel.text = review.reviewerName
        dateReviewLabel.text = review.dateOfReview
        reviewTitleLabel.text = review.titleOfReview
        reviewContentLabel.text = review.contentOfReview
        
    }
}

