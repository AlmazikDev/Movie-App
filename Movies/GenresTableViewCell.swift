//
//  GenresTableViewCell.swift
//  Movies
//
//  Created by Nurzhan Duisembayev on 24.10.2024.
//

import UIKit

protocol GenresTableViewCellDelegate: AnyObject {
    func filterMovies(by genre: GenreCellModel)
}

class GenresTableViewCell: UITableViewCell {
    
    var genres = [GenreCellModel]()
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()
    
    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 27, bottom: 0, right: 27)
        return scrollView
    }()
    
    var delegate: GenresTableViewCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupScrollView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(genres: [GenreCellModel]) {
        self.genres = genres // what does this line mean ?
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        for iteration in genres.enumerated() {
            let containerView = UIView()
            containerView.backgroundColor = .systemGray5
            containerView.layer.cornerRadius = 8
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onGenreWasSelected))
            containerView.addGestureRecognizer(tapGesture)
            
            let label = UILabel()
            label.font = .systemFont(ofSize: 18, weight: .regular)
            label.text = iteration.element.name
            label.tag = iteration.offset
            label.isUserInteractionEnabled = true
            
            
            containerView.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 6),
                label.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 6),
                label.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -6),
                label.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -6)
            ])
            
            stackView.addArrangedSubview(containerView)
        }
    }
    
    func setupScrollView() {
        contentView.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: contentView.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        let widthConstraint = NSLayoutConstraint(item: stackView, attribute: .width, relatedBy: .equal, toItem: scrollView, attribute: .width, multiplier: 1, constant: 1)
        widthConstraint.priority = .defaultLow
        
        scrollView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            widthConstraint
        ])
    }
    
    @objc private func onGenreWasSelected(sender: UITapGestureRecognizer) {
        let genre = genres[sender.view?.tag ?? 0]
        delegate?.filterMovies(by: genre)
    }
}
