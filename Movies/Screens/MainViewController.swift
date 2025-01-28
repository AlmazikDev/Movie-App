//
//  MainViewController.swift
//  Movies
//
//  Created by Almaz  on 23.01.2025.
//

import Foundation
import UIKit


class MainViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTabBar()
       
    }
    
    func configureTabBar() {
        let tabBarVC = UITabBarController()
        tabBarVC.tabBar.tintColor = .black 
        
        let MoviesVC = UINavigationController(rootViewController: ViewController())
        MoviesVC.tabBarItem.title = "Главная"
        MoviesVC.tabBarItem.selectedImage = UIImage(named: "house.fill")
        
        let FoldersVC = UINavigationController(rootViewController: FoldersMovieVC())
        FoldersVC.tabBarItem.title = "Папки"
        FoldersVC.tabBarItem.selectedImage = UIImage(named: "folder.fill")
        
        tabBarVC.viewControllers = [MoviesVC, FoldersVC]
        
        guard let items = tabBarVC.tabBar.items else { return }
        
        let images = ["house", "folder"]
        
        for x in 0..<items.count {
            items[x].image = UIImage(systemName: images[x])
        }
        
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: false)
    }
}

