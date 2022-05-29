//
//  DetailPostViewController.swift
//  Navigation
//
//  Created by User on 23/05/2022.
//

import UIKit

class DetailPostViewController: UIViewController {
    
    private lazy var authorLabel:UILabel = {
        let authorLabel = UILabel()
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.backgroundColor = .white
        authorLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        authorLabel.textColor = .black
        authorLabel.numberOfLines = 2
        return authorLabel
    }()
    
    private lazy var descriptionLabel:UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.backgroundColor = .white
        descriptionLabel.textColor = .systemGray
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
        descriptionLabel.numberOfLines = 0
        return descriptionLabel
    }()
    
    private lazy var image:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .black
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var likesLabel:UILabel = {
        let likesLabel = UILabel()
        likesLabel.translatesAutoresizingMaskIntoConstraints = false
        likesLabel.textColor = .black
        likesLabel.font = UIFont.systemFont(ofSize: 16)
        likesLabel.backgroundColor = .white
        
        let tapAction = UITapGestureRecognizer(target: self, action: #selector(click))
        likesLabel.isUserInteractionEnabled = true
        likesLabel.addGestureRecognizer(tapAction)
        return likesLabel
    }()
    
    private lazy var viewsLabel:UILabel = {
        let viewsLabel = UILabel()
        viewsLabel.translatesAutoresizingMaskIntoConstraints = false
        viewsLabel.textColor = .black
        viewsLabel.font = UIFont.systemFont(ofSize: 16)
        viewsLabel.textAlignment = .right
        viewsLabel.backgroundColor = .white
        return viewsLabel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = false
        layout()

    }
    
    @objc private func click() {
        let str = likesLabel.text
        let countLike = String(str!.dropFirst(7))
        likesLabel.text = "Likes: \((Int(countLike) ?? 0) + 1)"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }

    
    func addToDetailPostVC(post: Post) {
        authorLabel.text = post.author
        descriptionLabel.text = post.description
        image.image = post.image
        likesLabel.text = "Likes: \(post.likes)"
        viewsLabel.text = "Views: \(post.views)"
    }
    
    private func layout() {
       
        [authorLabel, descriptionLabel, image, likesLabel, viewsLabel] .forEach {view.addSubview($0)}
        
        NSLayoutConstraint.activate([
            authorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            authorLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            image.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            image.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 16),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            image.heightAnchor.constraint(equalToConstant: view.bounds.width),

            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            likesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            likesLabel.widthAnchor.constraint(equalToConstant: 100),
            likesLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            
            viewsLabel.topAnchor.constraint(equalTo: likesLabel.topAnchor),
            viewsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            viewsLabel.widthAnchor.constraint(equalToConstant: 100),
            viewsLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
        ])
    }

}
