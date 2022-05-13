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
        return authorLabel
    }()
    
    private lazy var descriptionLabel:UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.backgroundColor = .white
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
        likesLabel.backgroundColor = .white
        return likesLabel
    }()
    
    private lazy var viewsLabel:UILabel = {
        let viewsLabel = UILabel()
        viewsLabel.translatesAutoresizingMaskIntoConstraints = false
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
            authorLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor),
            authorLabel.topAnchor.constraint(equalTo: cellView.topAnchor),
            authorLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor),
            authorLabel.heightAnchor.constraint(equalToConstant: 50),

            image.leadingAnchor.constraint(equalTo: cellView.leadingAnchor),
            image.topAnchor.constraint(equalTo: authorLabel.bottomAnchor),
            image.trailingAnchor.constraint(equalTo: cellView.trailingAnchor),
            image.heightAnchor.constraint(equalToConstant: 300),

            descriptionLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: image.bottomAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor),
//            descriptionTextView.heightAnchor.constraint(equalToConstant: 50),

            likesLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor),
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
            likesLabel.widthAnchor.constraint(equalToConstant: 70),
//            likesLabel.heightAnchor.constraint(equalToConstant: 30),
            likesLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor),
            
            viewsLabel.topAnchor.constraint(equalTo: likesLabel.topAnchor),
            viewsLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor),
            viewsLabel.widthAnchor.constraint(equalToConstant: 70),
            viewsLabel.heightAnchor.constraint(equalToConstant: 30),
            viewsLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor),
        ])
    }

    
}
