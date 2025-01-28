//
//  ShowMoreView.swift
//  Movies
//
//  Created by Almaz  on 28.01.2025.
//

import UIKit


class ShowMoreView: UIView {
    
    private var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var containerView: UIView = {
        let view =  UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray6
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 25
        return view
    }()
    
    private var arrowImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "arrow.right"))
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var showMoreLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.textAlignment = .left
        label.text = "Показать еще"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    init() {
        super.init(frame: .zero)
        setupShowMoreUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupShowMoreUI() {
        translatesAutoresizingMaskIntoConstraints = false 
        containerView.addSubview(arrowImageView)
        mainStackView.addArrangedSubview(containerView)
        mainStackView.addArrangedSubview(showMoreLabel)
        addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            centerXAnchor.constraint(equalTo: centerXAnchor),
            centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
        
        NSLayoutConstraint.activate([
            arrowImageView.widthAnchor.constraint(equalToConstant: 35),
            arrowImageView.heightAnchor.constraint(equalToConstant: 35),
            arrowImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            arrowImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
        ])
        
        NSLayoutConstraint.activate([
            containerView.heightAnchor.constraint(equalToConstant: 50),
        ])
        
    }
}
