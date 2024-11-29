//
//  SelectedGenreCell.swift
//  Movies
//
//  Created by Almaz  on 26.11.2024.
//

import UIKit

class SelectedGenreCell: UITableViewCell {
    
    var genres = String()
    
    var selectedGenreLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textAlignment = .left
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
    
    
    func setupUI() {
        contentView.addSubview(selectedGenreLabel)
        
        NSLayoutConstraint.activate([
            selectedGenreLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            selectedGenreLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            selectedGenreLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            selectedGenreLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 16)
        ])
    }
    
}
