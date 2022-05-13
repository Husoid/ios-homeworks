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
    
    private lazy var authorTextView:UITextView = {
        let authorTextView = UITextView()
        authorTextView.translatesAutoresizingMaskIntoConstraints = false
        authorTextView.backgroundColor = .white
        return authorTextView
    }()
    
    private lazy var descriptionTextView:UITextView = {
        let descriptionTextView = UITextView()
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.backgroundColor = .white
        return descriptionTextView
    }()
    
    private lazy var image:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var likesTextView:UITextView = {
        let likesTextView = UITextView()
        likesTextView.translatesAutoresizingMaskIntoConstraints = false
        likesTextView.backgroundColor = .white
        return likesTextView
    }()
    
    private lazy var viewsTextView:UITextView = {
        let viewsTextView = UITextView()
        viewsTextView.translatesAutoresizingMaskIntoConstraints = false
        viewsTextView.backgroundColor = .white
        return viewsTextView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addToCell(post: Post) {
        authorTextView.text = post.author
        descriptionTextView.text = post.description
        image.image = post.image
        likesTextView.text = "Likes: \(post.likes)"
        viewsTextView.text = "Views: \(post.views)"
        
    }
    
    private func layout() {
       
        contentView.addSubview(cellView)
        
        NSLayoutConstraint.activate([
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        [authorTextView, descriptionTextView, image, likesTextView, viewsTextView] .forEach {cellView.addSubview($0)}

        NSLayoutConstraint.activate([
            authorTextView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor),
            authorTextView.topAnchor.constraint(equalTo: cellView.topAnchor),
            authorTextView.trailingAnchor.constraint(equalTo: cellView.trailingAnchor),
            authorTextView.heightAnchor.constraint(equalToConstant: 50),

            image.leadingAnchor.constraint(equalTo: cellView.leadingAnchor),
            image.topAnchor.constraint(equalTo: authorTextView.bottomAnchor),
            image.trailingAnchor.constraint(equalTo: cellView.trailingAnchor),
//            image.bottomAnchor.constraint(equalTo: cellView.bottomAnchor),
            image.heightAnchor.constraint(equalToConstant: 300),

            descriptionTextView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor),
            descriptionTextView.topAnchor.constraint(equalTo: image.bottomAnchor),
            descriptionTextView.trailingAnchor.constraint(equalTo: cellView.trailingAnchor),
            descriptionTextView.heightAnchor.constraint(equalToConstant: 50),

            likesTextView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor),
            likesTextView.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor),
            likesTextView.widthAnchor.constraint(equalToConstant: 70),
            likesTextView.heightAnchor.constraint(equalToConstant: 30),
            likesTextView.bottomAnchor.constraint(equalTo: cellView.bottomAnchor),
            
            viewsTextView.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor),
            viewsTextView.trailingAnchor.constraint(equalTo: cellView.trailingAnchor),
            viewsTextView.widthAnchor.constraint(equalToConstant: 70),
            viewsTextView.heightAnchor.constraint(equalToConstant: 30),
            viewsTextView.bottomAnchor.constraint(equalTo: cellView.bottomAnchor),
        ])
    }

    
}
