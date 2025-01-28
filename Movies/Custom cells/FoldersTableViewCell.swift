//
//  FoldersTableViewCell.swift
//  Movies
//
//  Created by Almaz  on 25.01.2025.
//

import UIKit

class FoldersTableViewCell: UITableViewCell {
    
    private var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 15
        return view
    }()
    
    var folderNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.text = "Буду смотреть"
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupFolderUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupFolderUI() {
        contentView.addSubview(containerView)
        containerView.addSubview(folderNameLabel)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 9),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -9),
        ])
        
        NSLayoutConstraint.activate([
            folderNameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            folderNameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 26),
            folderNameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            folderNameLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
        ])
    }
        
    
}
