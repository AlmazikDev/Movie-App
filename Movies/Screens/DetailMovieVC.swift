//
//  DetailMovieVC.swift
//  Movies
//
//  Created by Almaz  on 01.12.2024.
//

import Foundation
import UIKit


class DetailMovieVC: UIViewController {
    
    private var mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private var mainContentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var movieImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    } ()
    
    var buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isUserInteractionEnabled = true
        return stackView
    }()
    
    var containerButtonView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 0.68, blue: 0, alpha: 1)
        view.layer.cornerRadius = 24
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var watchLabel: UILabel = {
        let label = UILabel()
        label.text = "Смотреть"
        label.textColor = .white
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var downloadButton: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "download")
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var favouriteButton: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "favourite")
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleFavouriteButton))
        imageView.addGestureRecognizer(tapGestureRecognizer)
        return imageView
    }()
    
    private var movieNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 36, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var starImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star")
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var movieDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var genreContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        return view
    } ()
    
    private var movieGenreLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var castLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textAlignment = .left
        label.text = "Состав"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var castScrollView: UIScrollView = {
        let view = UIScrollView()
        view.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    private var castParentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 14
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var filmingGroupLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textAlignment = .left
        label.text = "Сьемочная группа"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var watchAllButtonGroupSide: UIButton = {
        let button = UIButton()
        button.setTitle("Смотреть все", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var trailerAndTeaserLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.text = "Трейлер и тизер"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var watchAllButtonTrailerSide: UIButton = {
        let button = UIButton()
        button.setTitle("Смотреть все", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var trailerscrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    private var trailerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var filmingGroupScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        return scrollView
    }()
    
    private var FilmingGroupStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 14
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var reviewLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textAlignment = .left
        label.text = "Рецензии"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var watchAllButtonReviewSide: UIButton = {
        let button = UIButton()
        button.setTitle("Все", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var reviewScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        return scrollView
    }()
    
    private var reviewStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 14
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let castVC = CastVC()
    let showMoreComponent = ShowMoreView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: .share, style: .plain, target: self, action: #selector(shareNavigationButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = .black
        setupUI()
    }
    
    @objc func shareNavigationButtonTapped() {
        print("Share button tapped")
        
        let alert = UIAlertController(title: "Добавить в список", message: "Выберите папку куда хотите добавить?", preferredStyle: .actionSheet)
        
        let willWatchButton = UIAlertAction(title: "Буду смотреть", style: .default)
        let watchedButton = UIAlertAction(title: "Посмотрел", style: .default)
        let dissmissButton = UIAlertAction(title: "Отменить", style: .cancel)
        
        alert.addAction(willWatchButton)
        alert.addAction(watchedButton)
        alert.addAction(dissmissButton)
        
        present(alert, animated: true)
    }
    
    @objc func buttonTapped() {
        print("cast button tapped")
        navigationController?.pushViewController(castVC, animated: true)
    }
    
    @objc func handleFavouriteButton(sender: UITapGestureRecognizer) {
        if sender.state == .ended{
            print("favourite imageView pressed")
        }
    }
    
    
     func setupMovie(movie: MovieCellModel) {
        movieImage.image = UIImage(named: movie.movieImage)
        movieNameLabel.text = movie.movieName
        movieDescriptionLabel.text = movie.movieDescription
        movieGenreLabel.text = movie.movieGenre
        for actor in movie.actors {
            let actorView = CastActorView()
            actorView.configure(model: actor)
            castParentStackView.addArrangedSubview(actorView)
            castVC.actorArray.append(actor)
        }
         
        for producer in movie.producers {
            let producerView = FilmingGroupView()
            producerView.configure(producer: producer)
            FilmingGroupStackView.addArrangedSubview(producerView)
         }
        
         for trailer in movie.trailers {
             let trailerView = TrailerView()
             trailerView.configure(trailer: trailer)
             trailerStackView.addArrangedSubview(trailerView)
         }
         
         for review in movie.reviews {
             let reviewComponent = ReviewComponent()
             reviewComponent.configureReview(review: review)
             reviewStackView.addArrangedSubview(reviewComponent)
             reviewStackView.addArrangedSubview(showMoreComponent)
         }
    }
    
    
    func setupUI() {
        
        mainContentView.addSubview(movieImage)
        mainContentView.addSubview(buttonsStackView)
        mainContentView.addSubview(containerButtonView)
        containerButtonView.addSubview(watchLabel)
        buttonsStackView.addArrangedSubview(containerButtonView)
        buttonsStackView.addArrangedSubview(downloadButton)
        buttonsStackView.addArrangedSubview(favouriteButton)
        mainContentView.addSubview(movieNameLabel)
        mainContentView.addSubview(starImageView)
        mainContentView.addSubview(movieDescriptionLabel)
        mainContentView.addSubview(genreContainerView)
        genreContainerView.addSubview(movieGenreLabel)
        mainContentView.addSubview(castLabel)
        mainContentView.addSubview(castScrollView)
        castScrollView.addSubview(castParentStackView)
        mainContentView.addSubview(filmingGroupLabel)
        mainContentView.addSubview(watchAllButtonGroupSide)
        mainContentView.addSubview(filmingGroupScrollView)
        filmingGroupScrollView.addSubview(FilmingGroupStackView)
        mainContentView.addSubview(filmingGroupScrollView)
        view.addSubview(mainScrollView)
        mainScrollView.addSubview(mainContentView)
        mainContentView.addSubview(trailerAndTeaserLabel)
        mainContentView.addSubview(watchAllButtonTrailerSide)
        mainContentView.addSubview(trailerscrollView)
        mainContentView.addSubview(trailerStackView)
        trailerscrollView.addSubview(trailerStackView)
        mainContentView.addSubview(reviewLabel)
        mainContentView.addSubview(watchAllButtonReviewSide)
        mainContentView.addSubview(reviewScrollView)
        reviewScrollView.addSubview(reviewStackView)
    
       
        
        NSLayoutConstraint.activate([
            mainScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            mainScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        let mainContentViewHeightConstraint = NSLayoutConstraint(item: mainContentView, attribute: .height, relatedBy: .equal, toItem: mainScrollView, attribute: .height, multiplier: 1, constant: 1)
        
        mainContentViewHeightConstraint.priority = .defaultLow
        NSLayoutConstraint.activate([
            mainContentView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
            mainContentView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor),
            mainContentView.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor),
            mainContentView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
            mainContentView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor),
            mainContentViewHeightConstraint
        ])
        
        NSLayoutConstraint.activate([
            movieImage.topAnchor.constraint(equalTo: mainContentView.topAnchor),
            movieImage.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor),
            movieImage.trailingAnchor.constraint(equalTo: mainContentView.trailingAnchor),
            movieImage.heightAnchor.constraint(equalToConstant: 260)
        ])
        
        NSLayoutConstraint.activate([
            buttonsStackView.centerXAnchor.constraint(equalTo: mainContentView.centerXAnchor),
            buttonsStackView.bottomAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: -15)
        ])
        
        
        NSLayoutConstraint.activate([
            watchLabel.topAnchor.constraint(equalTo: containerButtonView.topAnchor, constant: 8),
            watchLabel.leadingAnchor.constraint(equalTo: containerButtonView.leadingAnchor, constant: 16),
            watchLabel.trailingAnchor.constraint(equalTo: containerButtonView.trailingAnchor, constant: -16),
            watchLabel.bottomAnchor.constraint(equalTo: containerButtonView.bottomAnchor, constant: -8),
        ])
        
        NSLayoutConstraint.activate([
            downloadButton.heightAnchor.constraint(equalToConstant: 45),
            downloadButton.widthAnchor.constraint(equalToConstant: 45),
        ])
        
        NSLayoutConstraint.activate([
            favouriteButton.widthAnchor.constraint(equalToConstant: 45),
            favouriteButton.heightAnchor.constraint(equalToConstant: 45),
        ])
        
        NSLayoutConstraint.activate([
            movieNameLabel.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 16),
            movieNameLabel.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor, constant: 16),
        ])
        
        NSLayoutConstraint.activate([
            starImageView.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 26),
            starImageView.leadingAnchor.constraint(equalTo: movieNameLabel.trailingAnchor, constant: 13),
            starImageView.heightAnchor.constraint(equalToConstant: 26),
            starImageView.widthAnchor.constraint(equalToConstant: 26),
        ])
        
        NSLayoutConstraint.activate([
            movieDescriptionLabel.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: 8),
            movieDescriptionLabel.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor, constant: 16),
            movieDescriptionLabel.trailingAnchor.constraint(equalTo: mainContentView.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            genreContainerView.topAnchor.constraint(equalTo: movieDescriptionLabel.bottomAnchor, constant: 8),
            genreContainerView.leadingAnchor.constraint(equalTo: mainContentView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
        ])
        
        NSLayoutConstraint.activate([
            movieGenreLabel.topAnchor.constraint(equalTo: genreContainerView.topAnchor, constant: 4),
            movieGenreLabel.leadingAnchor.constraint(equalTo: genreContainerView.leadingAnchor, constant: 9),
            movieGenreLabel.trailingAnchor.constraint(equalTo: genreContainerView.trailingAnchor, constant: -9),
            movieGenreLabel.bottomAnchor.constraint(equalTo: genreContainerView.bottomAnchor, constant: -4),
        ])
        
        NSLayoutConstraint.activate([
            castLabel.topAnchor.constraint(equalTo: genreContainerView.bottomAnchor, constant: 17),
            castLabel.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor, constant: 15),
            castLabel.trailingAnchor.constraint(equalTo: mainContentView.trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            watchAllButtonGroupSide.topAnchor.constraint(equalTo: movieGenreLabel.bottomAnchor, constant: 17),
            watchAllButtonGroupSide.trailingAnchor.constraint(equalTo: mainContentView.trailingAnchor, constant: -15),
            watchAllButtonGroupSide.bottomAnchor.constraint(equalTo: castScrollView.topAnchor, constant: -10),
            
        ])
        
        NSLayoutConstraint.activate([
            castScrollView.topAnchor.constraint(equalTo: castLabel.bottomAnchor, constant: 12),
            castScrollView.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor),
            castScrollView.trailingAnchor.constraint(equalTo: mainContentView.trailingAnchor),
            castScrollView.heightAnchor.constraint(equalToConstant: 160)
        ])
        
        let widthConstraint = NSLayoutConstraint(item: castParentStackView, attribute: .width, relatedBy: .equal,
                                                 toItem: castScrollView, attribute: .width, multiplier: 1, constant: 1)
        widthConstraint.priority = .defaultLow
        NSLayoutConstraint.activate([
            castParentStackView.topAnchor.constraint(equalTo: castScrollView.topAnchor),
            castParentStackView.leadingAnchor.constraint(equalTo: castScrollView.leadingAnchor),
            castParentStackView.trailingAnchor.constraint(equalTo: castScrollView.trailingAnchor),
            castParentStackView.bottomAnchor.constraint(equalTo: castScrollView.bottomAnchor),
            castParentStackView.heightAnchor.constraint(equalTo: castScrollView.heightAnchor),
            widthConstraint,
        ])
        
        //Working here
        
        NSLayoutConstraint.activate([
            trailerAndTeaserLabel.topAnchor.constraint(equalTo: castParentStackView.bottomAnchor, constant: 6),
            trailerAndTeaserLabel.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor, constant: 15),
        ])
        
        NSLayoutConstraint.activate([
            watchAllButtonTrailerSide.topAnchor.constraint(equalTo: castParentStackView.bottomAnchor),
            watchAllButtonTrailerSide.trailingAnchor.constraint(equalTo: mainContentView.trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            trailerscrollView.topAnchor.constraint(equalTo: trailerAndTeaserLabel.bottomAnchor, constant: 12),
            trailerscrollView.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor),
            trailerscrollView.trailingAnchor.constraint(equalTo: mainContentView.trailingAnchor),
            trailerscrollView.heightAnchor.constraint(equalToConstant: 136),
        ])
        
        let trailersWidthConstraint = NSLayoutConstraint(item: trailerStackView, attribute: .width, relatedBy: .equal, toItem: trailerscrollView, attribute: .width, multiplier: 1, constant: 1)
        trailersWidthConstraint.priority = .defaultLow
        
        NSLayoutConstraint.activate([
            trailerStackView.topAnchor.constraint(equalTo: trailerscrollView.topAnchor),
            trailerStackView.leadingAnchor.constraint(equalTo: trailerscrollView.leadingAnchor, constant: 17),
            trailerStackView.trailingAnchor.constraint(equalTo: trailerscrollView.trailingAnchor),
            trailerStackView.bottomAnchor.constraint(equalTo: trailerscrollView.bottomAnchor),
            trailerStackView.heightAnchor.constraint(equalTo: trailerscrollView.heightAnchor),
            trailersWidthConstraint
        ])
        
        NSLayoutConstraint.activate([
            filmingGroupLabel.topAnchor.constraint(equalTo: trailerscrollView.bottomAnchor, constant: 37),
            filmingGroupLabel.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor, constant: 16),
            filmingGroupLabel.trailingAnchor.constraint(equalTo: mainContentView.trailingAnchor, constant: -16),
        ])
        
        
        NSLayoutConstraint.activate([
            filmingGroupScrollView.topAnchor.constraint(equalTo: filmingGroupLabel.bottomAnchor, constant: 12),
            filmingGroupScrollView.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor),
            filmingGroupScrollView.trailingAnchor.constraint(equalTo: mainContentView.trailingAnchor),
//            filmingGroupScrollView.bottomAnchor.constraint(equalTo: mainContentView.bottomAnchor),
            filmingGroupScrollView.heightAnchor.constraint(equalToConstant: 120)
        ])
        
        let widthConstraintgGroupScrollView = NSLayoutConstraint(item: FilmingGroupStackView, attribute: .width, relatedBy: .equal, toItem: filmingGroupScrollView, attribute: .width, multiplier: 1, constant: 1)
        
        widthConstraintgGroupScrollView.priority = .defaultLow
        NSLayoutConstraint.activate([
            FilmingGroupStackView.topAnchor.constraint(equalTo: filmingGroupScrollView.topAnchor),
            FilmingGroupStackView.leadingAnchor.constraint(equalTo: filmingGroupScrollView.leadingAnchor),
            FilmingGroupStackView.trailingAnchor.constraint(equalTo: filmingGroupScrollView.trailingAnchor),
            FilmingGroupStackView.bottomAnchor.constraint(equalTo: filmingGroupScrollView.bottomAnchor),
            FilmingGroupStackView.heightAnchor.constraint(equalTo: filmingGroupScrollView.heightAnchor),
            widthConstraintgGroupScrollView
        ])
        
        NSLayoutConstraint.activate([
            reviewLabel.topAnchor.constraint(equalTo: filmingGroupScrollView.bottomAnchor, constant: 16),
            reviewLabel.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor, constant: 16),
        ])
        
        NSLayoutConstraint.activate([
            watchAllButtonReviewSide.topAnchor.constraint(equalTo: filmingGroupScrollView.bottomAnchor, constant: 10),
            watchAllButtonReviewSide.trailingAnchor.constraint(equalTo: mainContentView.trailingAnchor, constant: -16),
        ])
        
        NSLayoutConstraint.activate([
            reviewScrollView.topAnchor.constraint(equalTo: reviewLabel.bottomAnchor, constant: 16),
            reviewScrollView.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor),
            reviewScrollView.trailingAnchor.constraint(equalTo: mainContentView.trailingAnchor),
            reviewScrollView.bottomAnchor.constraint(equalTo: mainContentView.bottomAnchor),
            reviewScrollView.heightAnchor.constraint(equalToConstant: 250),
        ])
        
        let widthConstraintReviewScrollView = NSLayoutConstraint(item: reviewStackView, attribute: .width, relatedBy: .equal, toItem: reviewScrollView, attribute: .width, multiplier: 1, constant: 1)
        widthConstraintReviewScrollView.priority = .defaultLow
        
        NSLayoutConstraint.activate([
            reviewStackView.topAnchor.constraint(equalTo: reviewScrollView.topAnchor),
            reviewStackView.leadingAnchor.constraint(equalTo: reviewScrollView.leadingAnchor),
            reviewStackView.trailingAnchor.constraint(equalTo: reviewScrollView.trailingAnchor),
            reviewStackView.bottomAnchor.constraint(equalTo: reviewScrollView.bottomAnchor),
            reviewStackView.heightAnchor.constraint(equalTo: reviewScrollView.heightAnchor),
            widthConstraintReviewScrollView
        ])
        
       
    }
}
