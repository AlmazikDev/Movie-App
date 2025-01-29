//
//  CastVC.swift
//  Movies
//
//  Created by Almaz  on 12.01.2025.
//

import UIKit

class CastVC: UIViewController {
    
    var actorArray = [ActorModel]()
    
    var tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .systemBackground
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Актеры"
        tableView.dataSource = self
//        tableView.delegate = self
        tableView.register(ActorsTableViewCell.self, forCellReuseIdentifier: "actorsCell")
        setupCastTableView()
//        print(actorArray, "\(actorArray.count)")
//        actorArray.forEach { (actor) in
//            print(actor.actorImage, actor.actorName)
//        }
//        actors.append(actorArray)
    }
    
    func setupCastTableView() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
}

extension CastVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actorArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "actorsCell", for: indexPath) as! ActorsTableViewCell
        cell.configureActor(actor: ActorModel(actorImage: actorArray[indexPath.row].actorImage,
                                              actorName: actorArray[indexPath.row].actorName,
                                              secondName: actorArray[indexPath.row].secondName,
                                              dateOfBirthAndAge: actorArray[indexPath.row].dateOfBirthAndAge,
                                              nickname: actorArray[indexPath.row].nickname))
        return cell
        
    }
}

//extension CastVC: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 160
//    }
//}
