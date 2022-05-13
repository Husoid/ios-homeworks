//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by User on 12/05/2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    private lazy var cellView:UIView = {
        let cellView = UIView()
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.backgroundColor = .white
        return cellView
    }()
    
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addToCell(post: Post) {
        authorLabel.text = post.author
        descriptionLabel.text = post.description
        image.image = post.image
        likesLabel.text = "Likes: \(post.likes)"
        viewsLabel.text = "Views: \(post.views)"
        
    }
    
    private func layout() {
       
        contentView.addSubview(cellView)
        
        NSLayoutConstraint.activate([
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        [authorLabel, descriptionLabel, image, likesLabel, viewsLabel] .forEach {cellView.addSubview($0)}
        
        NSLayoutConstraint.activate([
            authorLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 16),
            authorLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -16),

            image.leadingAnchor.constraint(equalTo: cellView.leadingAnchor),
            image.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 16),
            image.trailingAnchor.constraint(equalTo: cellView.trailingAnchor),
            image.heightAnchor.constraint(equalToConstant: contentView.bounds.width),

            descriptionLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 16),
            descriptionLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -16),

            likesLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 16),
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            likesLabel.widthAnchor.constraint(equalToConstant: 100),
            likesLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -16),
            
            viewsLabel.topAnchor.constraint(equalTo: likesLabel.topAnchor),
            viewsLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -16),
            viewsLabel.widthAnchor.constraint(equalToConstant: 100),
            viewsLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -16),
        ])
    }

    
}
