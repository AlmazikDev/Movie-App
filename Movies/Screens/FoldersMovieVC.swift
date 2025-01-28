//
//  FoldersMovieVC.swift
//  Movies
//
//  Created by Almaz  on 23.01.2025.
//

import Foundation
import UIKit

class FoldersMovieVC: UIViewController {
   
    var folders: [String] = ["Буду смотреть", "Посмотрел"]
    let plusButton = UIImage(systemName: "plus")
    
    private var table: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        navigationItem.title = "Папки"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: plusButton, style: .plain, target: self, action: #selector(addFolderButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = .black
        
        table.dataSource = self
        table.delegate = self
        table.register(FoldersTableViewCell.self, forCellReuseIdentifier: "foldersCell")
        
        setupFoldersTableView()
    }
    
    @objc func addFolderButtonTapped() {
        print("AddFolder button was pressed")
    }
    
    func setupFoldersTableView() {
        view.addSubview(table)
        
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.topAnchor),
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    
    }
    
}

extension FoldersMovieVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return folders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "foldersCell") as! FoldersTableViewCell
        cell.folderNameLabel.text = folders[indexPath.row]
       return cell
    }
}

extension FoldersMovieVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if folders[indexPath.row] == "Буду смотреть" {
            let willBeWatchVC = WillBeWatchedVC()
            navigationController?.pushViewController(willBeWatchVC, animated: true)
        }
        
        if folders[indexPath.row] == "Посмотрел" {
            let watchedVC = WatchedVC()
            navigationController?.pushViewController(watchedVC, animated: true)
        }
        
        print("\(folders[indexPath.row])")
    }
}


